Spree::UsersController.class_eval do
  include Spree::Core::ControllerHelpers::User

  before_filter :load_pages, only: :show
  private
  def load_pages
    @pages ||= spree_current_user.pages
  end
end
