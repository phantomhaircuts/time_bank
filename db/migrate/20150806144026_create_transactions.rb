class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :price
      t.references :buyer, index: true, foreign_key: false
      t.references :seller, index: true, foreign_key: false
      t.references :service, index: true, foreign_key: true
    end
  end
end
