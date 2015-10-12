module Spree::User::Plan
  extend ActiveSupport::Concern

  included do
    belongs_to :plan, class_name: 'Spree::Product'
  end

  def update_plan(plan)
    update_attribute(:plan, plan)
  end

  def free?
    plan.free?
  end

  def plan
    super || Spree::FreePlan.new
  end
end

