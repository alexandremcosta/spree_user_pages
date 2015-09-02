Spree::Page.class_eval do
  belongs_to :user

  def self.create_from_user(user)
    create do |page|
      page.title = user.name
      page.body = user.name
      page.slug = user.name
      page.user_id = user.id
      page.layout = 'page_layout'
      page.render_layout_as_partial = true
      page.stores << Spree::Store.current
    end
  end

  def update_from_order(order)
    update_attributes OrderPageParams.new(order, self).hash
  end

  private
  class OrderPageParams
    def initialize(order, page)
      @order = order
      @page = page
    end

    def hash
      { title: title,
        body: body,
        slug: slug,
        user_id: user_id,
        layout: 'page_layout',
        render_layout_as_partial: true }
    end

    private
    attr_reader :page, :order

    def body
      'example'
    end

    def user_id
      order.user.id
    end

    def title
      page.title.present? ? page.title : order.name
    end

    def slug
      page.slug.present? ? page.slug : new_slug
    end

    def new_slug
      slug = '/' + title.parameterize
      return slug unless Spree::Page.find_by_slug(slug)
      "#{slug}-#{order.number}"
    end
  end
end
