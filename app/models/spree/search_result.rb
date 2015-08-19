module Spree::SearchResult
  def title
    raise NotImplementedError
  end

  def image
    raise NotImplementedError
  end

  def url
    raise NotImplementedError
  end
end
