class AddUserIdToSpreePages < ActiveRecord::Migration
  def change
    add_reference :spree_pages, :user, index: true
  end
end
