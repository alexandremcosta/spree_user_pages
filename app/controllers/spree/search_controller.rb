class Spree::SearchController < Spree::StoreController
  include Spree::Core::ControllerHelpers::User

  def result
    @presenters = Spree::Search.new(search_params).presenters
    redirect_to user_page_path(@presenters.first.page) if @presenters.size == 1
  end

  private
  def search_params
    params.permit(:query)
  end
end

