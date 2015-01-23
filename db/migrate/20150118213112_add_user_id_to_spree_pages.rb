class AddUserIdToSpreePages < ActiveRecord::Migration
  def change
    add_reference :spree_pages, :user_id, index: true
  end
end
