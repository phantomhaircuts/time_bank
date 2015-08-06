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
      flash[:notice] = "Passwords do not match"
      render :sign_up
    elsif user.save
      flash[:notice] = "Your account has been created"
      sign_in_user(user)
      redirect_to new_profile_path
    else
      flash[:notice] = "Your account could not be created. Username is taken?"
      render :sign_up
    end
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
    sign_in_user(@user)
    end
    flash[:notice] = message
    redirect_to root_url

  end

  def sign_out
  reset_session
  redirect_to root_url
  end

  private
  def sign_in_user(user)
    cookies[:username] = { value: user.username, expires: 5.hours.from_now }
    session[:user_id] = user.id
  end

end
