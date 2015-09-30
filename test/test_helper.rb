puts ENV["RAILS_ENV"]
#Rails.env = 'test'
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "email_spec"
# require EmailSpec::Helpers
# require EmailSpec::Matchers
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
#system 'rubocop'
require 'capybara/poltergeist'
include Capybara::DSL
Capybara.register_driver :poltergeist do |config|
  Capybara::Poltergeist::Driver.new(config, {js_errors: false})
end
Capybara.current_driver = :poltergeist

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  def login(role = :editor)
    visit new_user_session_path
    fill_in 'Email', with: users(role).email
    fill_in 'Password', with: 'password'
    click_on 'Sign in!'
  end
end
