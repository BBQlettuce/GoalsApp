require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit('users/new')
  end

  it "has a new user page" do
    visit('/users/new')
    expect(page).to have_content('Create New User')
  end

  it "takes in username and password" do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end

  feature "signing up a user" do
    it "validates proper username and password (blank input)" do
      click_button('Sign Up')
      expect(page).to have_content('Create New User')
      expect(page).to have_content("Username can't be blank")
    end

    it "validates password length" do
      fill_in('Username', with: "random_user")
      fill_in('Password', with: "short")
      click_button('Sign Up')
      expect(page).to have_content('Create New User')
      expect(page).to have_content("Password is too short")
    end

    it "shows username on the homepage after signup" do
      fill_in('Username', with: "random_user")
      fill_in('Password', with: "long_password")
      click_button('Sign Up')
      expect(page).to have_content("random_user")
    end

  end

end

feature "logging in" do
  before :each do
    sign_up("random_user", "long_password")
  end

  it "shows username on the homepage after login" do
    visit('/session/new')
    fill_in('Username', with: "random_user")
    fill_in('Password', with: "long_password")
    click_button('Login')
    expect(page).to have_content("random_user")
  end


end

feature "logging out" do
  before :each do
    visit('session/new')
  end

  it "begins with logged out state" do
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Log In")
  end

  it "doesn't show username on the homepage after logout" do
    sign_up("random_user", "long_password")
    click_button('Logout')
    expect(page).to_not have_content("random_user")
  end

end
