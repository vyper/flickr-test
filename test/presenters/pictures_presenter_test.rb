require 'test_helper'

describe PicturePresenter do
  subject { PicturesPresenter.new(photos) }

  describe 'with photos' do
    let(:photos) { OpenStruct.new(page: "1", total: "10") }

    before do
      def photos.map &blk
        [OpenStruct.new(description: "description", title: "title")]
      end
    end

    it '#current_page' do
      subject.current_page.must_equal 1
    end

    it '#total_pages' do
      subject.total_pages.must_equal (10 / PicturesPresenter::PER_PAGE)
    end

    it '#limit_value' do
      subject.limit_value.must_equal 10
    end
  end

  describe 'with empty photos' do
    let(:photos) { OpenStruct.new(page: "0", total: "0") }

    before do
      def photos.map &blk
        []
      end
    end

    it '#current_page' do
      subject.current_page.must_equal 0
    end

    it '#total_pages' do
      subject.total_pages.must_equal 0
    end

    it '#limit_value' do
      subject.limit_value.must_equal 0
    end
  end
end
