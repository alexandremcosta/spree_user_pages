require 'spree/order/state_machine_decorator.rb'

Spree::Order.class_eval do
  def after_complete_callbacks
    create_pages
  end

  private
  def create_pages
    Spree::Page.create_from_order(self)
  end
end



