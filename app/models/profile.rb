class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :purchased_transactions, class_name: "Transaction", foreign_key: :buyer_id
  has_many :sold_transactions, class_name: "Transaction", foreign_key: :seller_id

  def subtract_from_timebank(amount)
    self.time_bank = self.time_bank - amount
    self.save
  end

  def add_to_timebank(amount)
    self.time_bank = self.time_bank + amount
    self.save
  end
end



### Get amount of current user's time_bank
# Get amount of selected service's price
# Find selected service's user
# If purchase service
  # Subtract from current user's time_bank.

  # Add service price to service owner's time bank.




# Set up through table for contracts: i.e. A User has many services, through :contracts
