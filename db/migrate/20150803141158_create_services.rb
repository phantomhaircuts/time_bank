class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
    t.string :name
    t.text :description
    t.references :profile, index: true, foreign_key: true
    end
  end
end
