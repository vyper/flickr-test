class PicturesPresenter
  attr_reader :collection, :total_pages, :limit_value, :current_page

  PER_PAGE = 50

  def initialize(collection)
    @limit_value  = collection.total.to_i
    @total_pages  = @limit_value > 0 ? @limit_value / PER_PAGE : 0
    @current_page = collection.page.to_i
    @collection   = collection.map { |item| PicturePresenter.new(item) }
  end

  def each &blk
    @collection.each &blk
  end
end