require 'spree/order/state_machine_decorator.rb'

Spree::Order.class_eval do
  def after_complete_callbacks
    create_pages
  end

  def name
    if (address = bill_address || ship_address)
      if Spree::Config[:company]
        address.company
      else
        "#{address.firstname} #{address.lastname}"
      end
    end
  end

  private
  def create_pages
    Spree::Page.create_from_order(self)
  end
end



