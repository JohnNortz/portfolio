require "test_helper"

feature 'Users can create a new unique account' do
  scenario 'Users can register' do
    visit '/'
    click_on 'Sign up'

    fill_in 'Email', with: 'trueuser@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up!'

    page.must_have_content 'successful'
  end

  scenario 'User cannot login if their email address does not exist' do
    visit '/'
    click_on 'Sign in'

    fill_in 'Email', with: 'testuser@example.com'
    fill_in 'Password', with: '12345'
    click_on 'Sign in!'
    page.must_have_content 'Invalid'
  end
end


feature 'User Authorization, users can login to unique accounts' do
  before(:each) do
    visit '/'
    click_on 'Sign in'

    fill_in 'Email', with: 'testuser@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in!'#puts "||||||||||||||||||||||||User Auth signed in from root should be signed in|||||||||||||||||||"
  end

  scenario 'Users can login with registered email and password' do
    page.must_have_content "successful"
  end

  scenario 'Users can logout' do

    click_on 'Sign out'
    page.must_have_content "Sign in"
  end

  scenario "sign in with twitter works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    click_on "Sign in with Twitter"
    page.must_have_content "Logged in as test_twitter_user"
  end
end


