Spree::Role.class_eval do
  def self.user
    @user_role ||= find_by_name('user')
  end
end
