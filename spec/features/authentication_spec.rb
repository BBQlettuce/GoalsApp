require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

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
      expect(page).to have_content("Password can't be blank")
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

  it "shows username on the homepage after login"

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end