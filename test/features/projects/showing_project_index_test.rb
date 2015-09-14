require "test_helper"

feature "Display Project index" do
  scenario "Sucessfully displays the index of projects" do
    visit projects_path
    assert_content page, "Port Fo Lio"
    assert_content page, "PortFree"
  end
end
