require "test_helper"

feature "Visiting The Posts Index" do
  scenario "Posts Index populates with existing posts" do
    visit posts_path
    page.must_have_content "Listing Posts"
  end
end
