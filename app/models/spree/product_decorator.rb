Spree::Product.class_eval do
  add_search_scope :not_user_pages do where(user_page: false) end
end
