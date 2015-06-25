class AddPlanToSpreeUsers < ActiveRecord::Migration
  def change
    add_reference :spree_users, :plan, index: true
  end
end
