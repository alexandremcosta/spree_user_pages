class Spree::SearchController < Spree::StoreController
  include Spree::Core::ControllerHelpers::User

  def result
    @presenters = search.presenters
    if @presenters.size == 1
      redirect_to user_page_path(@presenters.first.page),
        flash: {notice: Spree.t('search.one_result')}
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

