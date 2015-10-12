Spree::User.class_eval do
  include Spree::User::Plan
  include Spree::User::Confirmation

  has_many :pages
  attr_accessor :has_page
  after_create :create_page, if: :has_page

  def name
    email.split('@').first
  end

  def first_or_create_page
    pages.first || create_page
  end

  private
  def create_page
    user!
    Spree::Page.create_from_user(self)
  end

  def user!
    spree_roles << Spree::Role.user unless user?
  end

  def user?
    has_spree_role?('user')
  end
end
