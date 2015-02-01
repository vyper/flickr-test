class PicturePresenter
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def title
    object.title
  end

  def description
    object.description
  end

  def owner
    object.owner.username
  end

  def full_image_url
    object.source("Large")
  end

  def thumbnail_image_url
    object.source("Square")
  end

  def current_page
    object.page.to_i
  end

  def total_pages
    object.total.to_i / limit_value.to_i
  end

  def limit_value
    50
  end
end