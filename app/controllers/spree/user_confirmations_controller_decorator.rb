Spree::UserConfirmationsController.class_eval do
  protected
  def after_confirmation_path(resource_name, resource)
    account_path if is_navigational_format?
  end
  def after_resending_confirmation_instructions_path_for(resource_name)
    account_path if is_navigational_format?
  end
end
