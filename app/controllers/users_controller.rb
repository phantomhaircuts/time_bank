class UsersController < ApplicationController

  skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
      user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "Passwords do not match"
    elsif user.save
      message = "Your account has been created"
    else
      message = "Your account could not be created. Username is taken?"
    end
    flash[:notice] = message
    redirect_to action: :sign_in
  end


  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "Username does not exist, please sign-up"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Incorrect password"
    else
    message = "You have signed in, #{@user.username}! "
    cookies[:username] = {
      value: @user.username,
      expires: 5.hours.from_now
      }
      session[:user] = @user
    end
    flash[:notice] = message
    redirect_to root_url

  end

  def sign_out
  reset_session
  redirect_to root_url
  end

end
