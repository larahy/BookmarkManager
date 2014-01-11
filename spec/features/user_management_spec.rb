require 'spec_helper'

feature 'user signs up' do 

  scenario 'when being logged out' do 
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome, example@example.com")
    expect(User.first.email).to eq("example@example.com")
  end

  def sign_up(email = "example@example.com", password = "password")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end

