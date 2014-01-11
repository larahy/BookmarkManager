require 'spec_helper'

feature 'user signs up' do 

  scenario 'when being logged out' do 
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome, example@example.com")
    expect(User.first.email).to eq("example@example.com")
  end

  scenario 'with a non-matching password' do 
    lambda { sign_up('larahy@gmail.com', 'pword', "password") }.should change(User, :count).by(0)
  end
  scenario 'with a user that is already registered' do 
    lambda { sign_up }.should change(User, :count).by(1)
    lambda { sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("This email is already in use")
  end
  

  def sign_up(email = "example@example.com", password = "password", password_confirmation = "password")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end

