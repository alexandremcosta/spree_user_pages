Spree::Page.class_eval do
  belongs_to :user, class_name: 'Spree::User'

  def self.create_from_order(order)
    params = PageParamsCreator.new(order)
    create(
      title: params.title,
      body: params.body,
      slug: params.slug,
      user_id: params.user_id
    )
  end

  private
  class PageParamsCreator
    def initialize(order)
      @order = order
    end
    def user_id
      order.user.id
    end
    def title
      order.bill_address.firstname
    end
    def body
      'example'
    end
    def slug
      title.parametrize
    end
  end
end
