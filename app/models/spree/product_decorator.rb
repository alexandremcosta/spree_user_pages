Spree::Product.class_eval do
  add_search_scope(:not_plan) { where(plan: false) }
end
