require 'test_helper'

describe User do
  subject { User.new(email: "alfredo@email.me") }

  it '#to_s' do
    subject.to_s.must_equal subject.email
  end
end
