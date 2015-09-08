require "test_helper"

feature "Visting Page with foundation" do
  scenario "page shows foundation and theme" do
    visit posts_path
    page.html.must_include "stylesheet"
  end
end
