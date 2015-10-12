module Spree::User::Confirmation
  def not_confirmed?
    confirmed_at.blank?
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  private
  def password_required?
    # Password is not required for new records
    !persisted? ? false : (password.present? || !password_confirmation.present?)
  end

  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
end
