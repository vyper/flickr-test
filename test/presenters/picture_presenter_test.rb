require 'test_helper'

describe PicturePresenter do
  let(:photo)  { OpenStruct.new(description: "description", title: "title") }

  subject { PicturePresenter.new(photo) }

  before do
    # TODO I will find a better way to test this );
    def photo.source(size)
      size
    end

    def photo.owner
      OpenStruct.new(username: "owner")
    end
  end

  it '#title' do
    subject.title.must_equal photo.title
  end

  it '#description' do
    subject.description.must_equal photo.description
  end

  it '#user' do
    subject.owner.must_equal "owner"
  end

  it '#full_image_url' do
    subject.full_image_url.must_equal "Large"
  end

  it '#thumbnail_image_url' do
    subject.thumbnail_image_url.must_equal "Square"
  end
end
