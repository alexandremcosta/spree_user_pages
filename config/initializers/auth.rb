Spree.user_class = "Spree::User"
Spree::PermittedAttributes.user_attributes << :has_page
Spree::Auth::Config[:confirmable] = true

Devise.allow_unconfirmed_access_for = nil
