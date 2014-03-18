class AddListingIdToBuys < ActiveRecord::Migration
  def change
    add_column :buys, :listing_id, :integer
  end
end
