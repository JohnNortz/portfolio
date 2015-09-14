require "test_helper"

feature "Visiting The Articles Index" do
  scenario "Articles Index populates with existing posts" do
    visit posts_path
    page.must_have_content "Listing Posts"
  end
end
