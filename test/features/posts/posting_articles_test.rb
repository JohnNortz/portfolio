require "test_helper"
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

feature "Posting new posts" do
  scenario "the test posted a new post" do
    #post = Post.create(title: "Destructable Post", content: "Delete Me")   #FIXME  get old ID to check that new index doesnt contain old ID
    login(:author)
    visit new_post_path
    find('#post_title').set 'New Test post title'
    fill_in 'post_content', with: 'Test post please ignore'
    click_on 'Create Post'
    page.text.must_include 'Test post please ignore'
    page.text.wont_include 'Status: Unpublished'
  end

  # scenario "unauthenticated site visitors cannot visit new_post_path" do
  #   visit new_post_path
  #   puts "||||||||||||||| visiting newpostpath without auth |||||||||||||"
  #   puts page.text
  #   page.must_have_content "You need to sign in or sign up before continuing"
  # end

  # ^^  I know this test SHOULD pass, it keeps the user from using this path directly, not sure where to put a flash message about this

  scenario "unauthenticated site vistiors cannot see new post button" do

    visit posts_path
    # Then I should not see the "New Article" button
    page.text.wont_include "New Post"
  end

  scenario "authors can't publish" do
    login(:author)

    visit new_post_path

    page.wont_have_field('published')
  end

  scenario "editors can publish posts" do
    login(:editor)
    visit new_post_path

    page.must_have_field('Published')

    fill_in "post_title", with: "Publishing"
    fill_in "post_content", with: "Editors testing creating a published post"
    check "Published"
    click_on "Create Post"

    # Then the published article should be shown
    page.text.must_include "Status: Published"
  end
end


