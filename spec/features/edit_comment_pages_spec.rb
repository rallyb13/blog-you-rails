require 'rails_helper'

describe 'the edit a comment process' do
  it 'edits a comment' do
    comment1 = FactoryGirl.create(:comment)
    sign_in(comment1.user)
    visit post_path(comment1.post)
    click_on "Edit Comment"
    fill_in "Content", :with => "How about a ham sandwich?"
    click_on "Reply"
    expect(page).to have_content "Reply replaced."
  end
end
