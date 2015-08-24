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
    fill_in("body", with: "my_goal")
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

feature "viewing goal" do


end

feature "updating goal" do

end

feature "deleting goal" do

end
