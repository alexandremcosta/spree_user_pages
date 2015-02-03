class Spree::PagesController < Spree::StoreController
  prepend_before_filter :load_object, only: [:edit, :update]

  def edit
  end

  def update
    if @page.update(permitted_params)
      redirect_to account_path, notice: Spree.t(:updated)
    else
      render 'edit'
    end
  end

  private
  def load_object
    @page = Spree::Page.find(params[:id])
  end
  def permitted_params
    params.require(:page).permit(:title, :slug)
  end
end
