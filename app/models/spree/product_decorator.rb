Spree::Product.class_eval do
  add_search_scope(:not_plan) { where(plan: false) }
  add_search_scope(:plan) { where(plan: true) }

  def free?
    price == 0
  end
end
