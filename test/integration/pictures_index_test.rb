require "test_helper"

feature "Pictures Index" do
  include Warden::Test::Helpers

  fixtures :users

  scenario "unlogged user" do
    visit root_path

    page.must_have_css "#user_password"
    page.must_have_content "Sign in"
  end

  scenario "logged user" do
    login_as(users(:alfredo), scope: :user, run_callbacks: false)

    visit root_path

    fill_in 'query', with: "mulheres nuas"
    click_on 'search'

    page.must_have_css "#pictures img"
    page.must_have_content "Last"
  end
end