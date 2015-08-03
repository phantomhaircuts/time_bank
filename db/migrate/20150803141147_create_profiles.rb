class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    t.string :name
    t.text :about_me
    t.text :pic_url
    t.integer :time_bank
    end
  end
end
