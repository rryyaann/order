class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
