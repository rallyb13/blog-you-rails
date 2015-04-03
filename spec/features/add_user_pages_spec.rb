require 'rails_helper'

describe 'the add a new user process' do
  it 'allows a new user to sign up' do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "Emberfan@pdx.com"
    fill_in "Username", with: "Emberella"
    fill_in "Phone", with: "555Rihanna"
    fill_in "Password", with: "MVC4ever"
    fill_in "Password confirmation", with: "MVC4ever"
    click_on "Join"
    expect(page).to have_content "signed up"
  end

  it 'throws an error if email confirmation left blank' do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "Emberfan@pdx.com"
    fill_in "Password", with: "MVC4ever"
    click_on "Join"
    expect(page).to have_content "lost it all"
  end
end
