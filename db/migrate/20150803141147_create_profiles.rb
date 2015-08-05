class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    t.string :name
    t.text :about_me
    t.text :pic_url
    t.integer :time_bank
    # t.references :user, index: true, foreign_key: true
    end
  end
end
