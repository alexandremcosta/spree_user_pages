Spree::User.class_eval do
  has_many :pages
  belongs_to :plan, class_name: 'Spree::Product'

  after_create :create_first_page

  def name
    email.split('@').first
  end

  def not_confirmed?
    confirmed_at.blank?
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def first_page
    pages.first
  end

  def update_plan(plan)
    update_attributes(plan: plan)
  end

  private
  def create_first_page
    Spree::Page.create_from_user(self)
  end

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
