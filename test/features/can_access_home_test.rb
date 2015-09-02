require "test_helper"

describe "CanAccessHome", :capybara do
  it "Home page has content" do
    visit root_path
    page.must_have_content "Hello World"
    end
end
