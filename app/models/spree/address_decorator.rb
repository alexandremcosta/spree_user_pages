Spree::Address.class_eval do
  validates_uniqueness_of :company, if: :require_company?

  def require_company?
    Spree::Config[:company]
  end
end
