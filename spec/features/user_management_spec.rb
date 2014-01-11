require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com", :password => 'test', :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome, test@test.com")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test@test.com")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end

feature 'user signs out' do 

  before(:each) do
    User.create(:email => "test@test.com", 
                :password => 'test', 
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!") # where does this message go?
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end

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

end

