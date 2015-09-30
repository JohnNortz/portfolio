require "test_helper"

feature 'Users cant hack the site' do
  scenario 'Users cant directly post' do
    #sign_in(:author)
    post :create, articles: {title: 'posting directly', content: 'posted through hack! lol!'}
    save_and_open_page
    page.text.wont_include "posting directly"
  end

  # scenario 'Users cant hack to change roles' do
  #   sign_in(:author)

  # end
end


