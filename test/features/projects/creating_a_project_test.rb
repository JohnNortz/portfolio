require "test_helper"

feature "Creating A Project" do
  scenario "Sucessfully creates a test project" do

    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "New Test Project"
    fill_in "Technologies used", with: "Ruby, Rails, Git"
    click_on "Create Project"
    #puts page.text
    page.must_have_content "New Test Project"
    assert page.has_css?("#notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end

feature "Failing to creating A Project" do
  scenario "Sucessfully stops an innapropriate test project from being created" do

    visit projects_path
    click_on "New Project"
    fill_in "Name", with: ""
    fill_in "Technologies used", with: ""
    click_on "Create Project"

    current_path.must_match /projects$/  #display form again with error
    page.wont_have_content "New Test Project"
    page.text.must_include "errors prohibited this project"
  end
end
