require 'spec_helper'

describe 'the logging in and out process' do
  it 'allows a user who has signed up to sign in' do
    FactoryGirl.create(:user)
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "egg@yolkmail.com"
    fill_in "Password", with: "scramble"
    click_on "Submit"
    expect(page).to have_content "returned"
  end

  it 'allows a signed-in user to sign out' do
    FactoryGirl.create(:user)
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "egg@yolkmail.com"
    fill_in "Password", with: "scramble"
    click_on "Submit"
    click_on "Sign Out"
    expect(page).to have_content "outta here"
  end
end
