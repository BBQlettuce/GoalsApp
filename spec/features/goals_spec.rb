require 'spec_helper'
require 'rails_helper'

feature "creating new goal" do
  before :each do
    sign_up("BBQ", "lettuce")
    visit goals_url
  end

  it "has link to create new goal" do
     expect(page).to have_content("Create a Goal")
  end

  it "allows new goal creation in form" do
    click_link("Create a Goal")
    fill_in('title', with: "my_goal")
    fill_in('body', with: "blahblahblah")
    choose('goal_type_public')
    click_button('Submit')
    expect(page).to have_content("my_goal")
  end

  it "shows errors" do
    click_link("Create a Goal")
    fill_in("body", with: "my_goal")
    click_button('Submit')
    expect(page).to have_content("Goal must be public or private")
  end
end

feature "manipulating goals" do
  before :each do
    sign_up("BBQ", "lettuce")
    visit new_goal_url
    fill_in('title', with: "my_goal")
    fill_in('body', with: "blahblahblah")
    choose('goal_type_public')
    click_button('Submit')
  end

  feature "viewing goal" do

    it "displays goal title, body, view permissions, status" do
      click_link('my_goal')
      expect(page).to have_content("Goal set by: BBQ")
      expect(page).to have_content("my_goal")
      expect(page).to have_content("blahblahblah")
      expect(page).to have_content("public")
      expect(page).to have_content("Not Completed")
    end
  end

  feature "updating goal" do

    it "has link to edit goal" do
      click_link('my_goal')
      expect(page).to have_content('Edit goal')
    end

    it "allows you to edit goal" do
      click_link('my_goal')
      click_link('Edit goal')
      fill_in('title', with: "New title")
      check("completed")
      click_button('Submit')
      expect(page).to have_content("New title")
      expect(page).to have_content("Status: Completed")
    end

  end

  feature "deleting goal" do
    it "has link to delete goal" do
      click_link('my_goal')
      expect(page).to have_content("Delete Goal")
    end

    it "allows you to delete goal" do
      click_link('my_goal')
      click_link('Delete Goal')
      expect(page).to_not have_content('my_goal')
    end
  end
end
