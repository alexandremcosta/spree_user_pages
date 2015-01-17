class AddUserPageToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :user_page, :boolean
  end
end
