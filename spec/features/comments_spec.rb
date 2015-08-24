require 'spec_helper'
require 'rails_helper'

feature "creating comments" do
  # sign up
  before :each do
    sign_up("user", "password")
    visit new_goal_url
    fill_in('title', with: "my_goal")
    fill_in('body', with: "goal_text")
    choose('goal_type_public')
    click_button('Submit')
  end

  it "creates new comment on user" do
    click_link('Post Comment')
    fill_in('comment', with: "this is a comment")
    click_button('Submit')
    expect(page).to have_content("this is a comment")
  end

  it "creates new comment on goal" do
    click_link('my_goal')
    click_link('Post Comment')
    fill_in('comment', with: "this is a comment")
    click_button('Submit')
    expect(page).to have_content("this is a comment")
  end

end

feature "showing comments" do

end

feature "updating comment" do

end

feature "deleting comment" do

end
