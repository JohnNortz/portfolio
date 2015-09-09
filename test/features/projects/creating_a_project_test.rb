require "test_helper"

feature "Creating A Project" do
  scenario "Sucessfully creates a test project" do

    visit projects_path
    click_on "New Project"
    fill_in "project_name", with: "Q"
    fill_in "project_body", with: "This was a test project! Cool!"
    click_on "Create Project"
    page.must_have_content "New Test Project"
    page.must_have_content "Cool!"
    assert page.has_css?("#notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end

feature "Failing to creating A Project" do
  scenario "Sucessfully stops an innapropriate test project from being created" do

    visit projects_path
    click_on "New Project"
    fill_in "project_name", with: ""
    fill_in "project_body", with: ""
    click_on "Create Project"

    current_path.must_match /projects$/  #display form again with error
    page.wont_have_content "New Test Project"
    page.text.must_include "Project could not be saved"
    page.must_have_content "cannot be left blank"
  end
end
