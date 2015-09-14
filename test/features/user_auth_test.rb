require "test_helper"

feature 'Users can create a new unique account' do
  scenario 'Users can register' do
    visit '/'
    click_on 'Sign up'

    fill_in 'Email', with: 'trueuser@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up!'

    # puts "||||||||||||||||||||||||Created new account from root|||||||||||||||||||"
    # puts page.text
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
    # puts "||||||||||||||||||||||||Signing in from root|||||||||||||||||||"
    # puts page.text
    click_on 'Sign in'
    fill_in 'Email', with: 'testuser@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in!'
    #puts "||||||||||||||||||||||||User Auth signed in from root should be signed in|||||||||||||||||||"
  end

  scenario 'Users can login with registered email and password' do
    page.must_have_content "successful"
  end

  scenario 'Users can logout' do
    # puts "||||||||||||||||||||||||User Auth log out from root|||||||||||||||||||"
    # puts page.text
    click_on 'Sign out'
    page.must_have_content "Sign in"
  end
end
