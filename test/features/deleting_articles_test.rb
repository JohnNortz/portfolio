require "test_helper"

feature "Deleting Posts" do
  scenario "deletes a test post" do

    post = Post.create(title: "Destructable Post", content: "Delete Me")   #FIXME  get old ID to check that new index doesnt contain old ID
    visit post_path(post)

    click_on "Destroy"
    page.wont_have_content "Delete Me"
  end
end
