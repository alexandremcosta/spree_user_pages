module Spree
  module Core
    module ControllerHelpers
      module User
        extend ActiveSupport::Concern
        included do
          helper_method :user_page_path
        end

        protected
        def user_page_path(page)
          page.slug
        end
      end
    end
  end
end

