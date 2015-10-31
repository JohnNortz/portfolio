require "test_helper"

feature "Deleting Posts" do
  scenario "deletes a test post" do
    login(:editor)

    post = Post.create(title: "Destructable Post", content: "Delete Me")

    visit post_path(post)
    #puts "||||||||||||||||||||||||Delete post test post_path(posts)|||||||||||||||||||"
    #puts page.text

    click_on "Destroy"
    page.wont_have_content "Delete Me"
  end
end
