require 'spree/order/state_machine_decorator.rb'

Spree::Order.class_eval do
  def name
    if (address = bill_address || ship_address)
      if Spree::Config[:company]
        address.company
      else
        "#{address.firstname} #{address.lastname}"
      end
    end
  end

  def skip_cart?
    products.not_plan.empty? && one_item? && empty_or_free_user?
  end

  def remove_remaining_plans
    line_plans = line_items.joins(:product).merge(Spree::Product.plan)
    if line_plans.any?
      new_plan = line_items.new line_plans.last.attributes.merge(quantity: 1)
      line_plans.destroy_all
      self.line_items << new_plan
    end
  end

  private
  def one_item?
    line_items.size == 1 && line_items.first.quantity == 1
  end

  def after_complete_callbacks
    first_page = user.pages.first
    first_page.update_from_order(self) if first_page.present? && user.free?
    user.update_plan(plans.first) if plans.any?
  end

  def plans
    products.plan
  end

  def empty_or_free_user?
    user.blank? || user.free?
  end
end

