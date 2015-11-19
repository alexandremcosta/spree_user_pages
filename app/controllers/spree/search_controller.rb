class Spree::SearchController < Spree::StoreController
  include Spree::Core::ControllerHelpers::User

  def result
    @results = search.results
    if @results.size == 1
      redirect_to user_page_path(@results.first.page),
        flash: {notice: Spree.t('custom_search.one_result')}
    elsif search.message.present?
      flash.now[:notice] = search.message
    end
  end

  private
  def search_params
    params.permit(:query)
  end

  def search
    @search ||= Spree::Search.new(search_params)
  end
end

