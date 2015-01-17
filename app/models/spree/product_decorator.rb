Spree::Product.class_eval do
  add_search_scope :only_user_pages do where(user_page: true) end
  add_search_scope :not_user_pages do where(user_page: false) end
end
