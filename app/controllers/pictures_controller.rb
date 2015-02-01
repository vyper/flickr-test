class PicturesController < ApplicationController
  def index
    if params[:query].present?
      @pictures = PicturesPresenter.new(
        flickr.photos_search(text: params[:query], page: params[:page],
                             per_page: PicturesPresenter::PER_PAGE))
    end
  end

private
  def flickr
    @flickr ||= Flickr.new(api_key: ENV['FLICKR_API_KEY'])
  end
end
