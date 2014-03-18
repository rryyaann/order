class AddFieldsToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :buyer_id, :integer
    add_column :buys, :seller_id, :integer
  end
end
