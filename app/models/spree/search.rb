class Spree::Search
  include ActiveModel::Model
  attr_accessor :query
  attr_reader :message

  def presenters
    raise NotImplementedError
  end
end
