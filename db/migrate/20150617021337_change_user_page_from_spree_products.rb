class ChangeUserPageFromSpreeProducts < ActiveRecord::Migration
  def change
    rename_column :spree_products, :user_page, :plan
  end
end
