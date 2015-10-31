require "test_helper"

feature "Editing Post" do
  scenario "Has text body, submit and edit buttons" do

    login(:editor)
    post = Post.create(title: "Editable Post", content: "change Me")   #FIXME  get old ID to check that new index doesnt contain old ID
    visit post_path(post)

    click_on "Edit"

    fill_in "post_title", with: "Updated Post"
    click_on "Update Post"

    page.must_have_content "Updated Post"
    page.text.must_include "Post was successfully updated"
    page.text.wont_include "change me"
  end
end
