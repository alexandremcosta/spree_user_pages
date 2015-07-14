Spree::Address.class_eval do
  def require_company?
    Spree::Config[:company]
  end
end
