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
    products.not_user_pages.any?
  end

  def after_complete_callbacks
    create_pages
  end

  private
  def create_pages
    # user.create_pages(self)
  end
end

Spree::Order.state_machine.after_transition to: :complete, do: :after_complete_callbacks


