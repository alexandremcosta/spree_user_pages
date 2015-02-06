Spree::UsersController.class_eval do
  # TODO is prepend needed?
  prepend_before_filter :load_pages, only: :show
  private
  def load_pages
    @pages ||= spree_current_user.pages
  end
end
