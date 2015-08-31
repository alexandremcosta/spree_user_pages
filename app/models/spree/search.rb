class Spree::Search
  include ActiveModel::Model
  attr_accessor :query

  def presenters
    raise NotImplementedError
  end
end
