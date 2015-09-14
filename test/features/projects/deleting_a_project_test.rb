require "test_helper"

feature "Deleting A Project" do
  scenario "Sucessfully destroys a test project" do

    visit project_path(projects(:portfolio))
    #puts page.text
    click_on "Delete"

    page.wont_have_content "Port Fo Lio"
  end
end
