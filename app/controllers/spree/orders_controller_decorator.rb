Spree::OrdersController.class_eval do
  before_action :skip_cart, only: :edit

  private
  def skip_cart
    @order = current_order || Order.incomplete.find_or_initialize_by(guest_token: cookies.signed[:guest_token])
    @order.remove_remaining_plans
    if @order.checkout_allowed? && @order.skip_cart?
      @order.next
      redirect_to checkout_state_path(@order.checkout_steps.first)
    end
  end
end
