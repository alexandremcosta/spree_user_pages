Spree::Page.class_eval do
  belongs_to :user

  def self.create_from_user(user)
    create do |page|
      page.title = user.login_name
      page.body = user.login_name
      page.slug = user.login_name
      page.user_id = user.id
      page.layout = 'page_layout'
      page.render_layout_as_partial = true
      page.stores << Spree::Store.current
    end
  end

  def update_from_order(order)
    update_attributes Spree::OrderPageParams.new(order, self).attributes
  end
end
