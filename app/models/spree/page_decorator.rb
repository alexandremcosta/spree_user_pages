Spree::Page.class_eval do
  belongs_to :user

  def self.create_from_order(order)
    page = create PageParams.new(order).hash
    page.stores << Spree::Store.current
    page
  end

  private
  class PageParams
    attr_reader :order
    def initialize(order)
      @order = order
    end
    def hash
      { title: params.title,
        body: params.body,
        slug: params.slug,
        user_id: params.user_id,
        layout: 'page_layout',
        render_layout_as_partial: true }
    end
    def user_id
      order.user.id
    end
    def title
      order.name
    end
    def body
      'example'
    end
    def slug
      slug = '/' + title.parameterize
      return slug unless Spree::Page.find_by_slug(slug)
      "#{slug}-#{order.number}"
    end
  end
end
