class Spree::PagesController < Spree::StoreController
  before_action :load_and_authorize_object

  def edit
  end

  def update
    if @page.update_attributes(permitted_params)
      redirect_to account_path, notice: Spree.t(:updated)
    else
      render 'edit'
    end
  end

  private
  def load_and_authorize_object
    @page = Spree::Page.find(params[:id])
    authorize! :update, @page
  end
  def permitted_params
    params.require(:page).permit(:title, :slug)
  end
end
