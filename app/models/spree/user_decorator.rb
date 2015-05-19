Spree::User.class_eval do
  has_many :pages

  def not_confirmed?
    confirmed_at.blank?
  end
end
