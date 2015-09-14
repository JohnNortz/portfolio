require "test_helper"

feature "Showing A Project" do
  scenario "Sucessfully renders a test project" do
    visit project_path(projects(:portfolio))
    assert_content page, "Port Fo Lio"
    assert_content page, "Zurb"
  end
end
