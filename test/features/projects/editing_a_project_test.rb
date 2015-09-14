require "test_helper"

feature "Editing A Project" do
  scenario "Sucessfully edits a test project" do

    visit edit_project_path(projects(:portfolio))
    #puts page.text
    fill_in "Name", with: "Edited!"
    fill_in "Technologies used", with: "Ruby, Rails"
    click_on "Update Project"
    page.must_have_content "Edited"
  end


  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))

    fill_in "Name", with: "q"
    fill_in "Technologies used", with: "q"

    click_on "Update Project"
    page.wont_have_content "Edited"
    page.must_have_content "prohibited"
    page.must_have_content "Name is too short"
  end
end
