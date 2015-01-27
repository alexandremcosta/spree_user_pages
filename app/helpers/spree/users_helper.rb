module Spree::UsersHelper
  def user_page_path(page)
    page.slug
  end
end
