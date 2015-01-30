Spree::Page.class_eval do
  belongs_to :user, class_name: 'Spree::User'

  def self.create_from_order(order)
    params = PageParamsCreator.new(order)
    page = create(
      title: params.title,
      body: params.body,
      slug: params.slug,
      user_id: params.user_id,
      partial: 'page_layout',
      render_layout_as_partial: true
    )
    page.stores << Spree::Store.current and return page
  end

  private
  class PageParamsCreator
    attr_reader :order
    def initialize(order)
      @order = order
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
