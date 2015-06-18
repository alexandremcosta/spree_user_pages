class AddUnconfirmedEmailToSpreeUsers < ActiveRecord::Migration
  def up
    add_column :spree_users, :unconfirmed_email, :string
    add_index :spree_users, :confirmation_token, :unique => true
    Spree::User.update_all({:confirmed_at => DateTime.now, :confirmation_sent_at => DateTime.now})
  end

  def down
    remove_column :spree_users, :unconfirmed_email
  end
end
