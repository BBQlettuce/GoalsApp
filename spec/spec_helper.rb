RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def sign_up(username, password)
    visit "/users/new"
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button('Sign Up')
  end
end
