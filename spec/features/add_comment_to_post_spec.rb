require 'rails_helper'

describe "the add comment to post process" do
  it "adds a new comment to a specific post" do
    post1 = FactoryGirl.create(:post)
    sign_in(post1.user)
    visit post_path(post1)
    click_on 'Add Comment'
    fill_in "Content", :with => "You're rude. Stop it before I bop you upside your head."
    click_on "Reply"
    expect(page).to have_content "added to the historical record"
  end
end
