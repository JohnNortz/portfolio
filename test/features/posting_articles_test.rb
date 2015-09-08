require "test_helper"
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

feature "Posting new posts" do
  scenario "the test posted a new post" do
    #post = Post.create(title: "Destructable Post", content: "Delete Me")   #FIXME  get old ID to check that new index doesnt contain old ID
    visit new_post_path
    find('#post_title').set 'New Test post title'
    fill_in 'post_content', with: 'Test post please ignore'
    click_on 'Create Post'
    page.text.must_include 'Test post please ignore'
  end
end
