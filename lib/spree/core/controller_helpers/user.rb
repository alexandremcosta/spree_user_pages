module Spree
  module Core
    module ControllerHelpers
      module User
        extend ActiveSupport::Concern
        included do
          helper_method :user_page_path
          helper_method :user_page_url
        end

        protected
        def user_page_url(page)
          "http://#{Spree::Store.current.url}#{page.slug}"
        end
        def user_page_path(page)
          page.slug
        end
      end
    end
  end
end

