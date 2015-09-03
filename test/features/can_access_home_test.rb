require "test_helper"

describe "Can Access Home", :capybara do
  it "Home page has content" do
    visit posts_path
    page.must_have_content "Listing All"
    end
end
