class TransactionsController < ApplicationController
  def create
    @buyer = current_user.profile
    @service = Service.find params[:transaction][:service_id]
    @price = @service.price
    @seller = @service.profile

    Transaction.create(buyer: @buyer, service: @service, price: @price, seller: @seller)

    @buyer.subtract_from_timebank @price
    @seller.add_to_timebank @price

    redirect_to profile_service_path(@seller, @service), notice: "Service has been purchased! #{@price}:00 has been deducted from your account."
  end
end
