class Spree::SearchController < Spree::StoreController
  include Spree::Core::ControllerHelpers::User

  def result
    @result = Spree::Search.new(query: params[:keywords]).result
    redirect_to user_page_path(@result.first.page) if @result.size == 1
  end
end

