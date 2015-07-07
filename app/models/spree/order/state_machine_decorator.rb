Spree::Order.class_eval do
  checkout_flow do
    go_to_state :address
    go_to_state :delivery, if: ->(order) { order.delivery_required? }
    go_to_state :payment,  if: ->(order) { order.payment_required? }
    go_to_state :confirm,  if: ->(order) { order.confirmation_required? }
    go_to_state :complete
    remove_transition from: :delivery, to: :confirm
  end

  def delivery_required?
    products.not_plan.any?
  end

  def after_complete_callbacks
    user.update_plan(first_plan) if first_plan
    page = user.first_page
    page.update_from_order(self)
  end
end

Spree::Order.state_machine.after_transition to: :complete, do: :after_complete_callbacks

