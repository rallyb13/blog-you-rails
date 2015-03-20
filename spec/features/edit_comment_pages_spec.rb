require 'rails_helper'

describe 'the edit a comment process' do
  it 'edits a comment' do
    post1 = Post.create(:name => "Lunch Options", :content => "What should I have for lunch? All I can think of is pasta.")
    visit post_path(post1)
    click_on "Add Comment"
    fill_in "Content", :with => "How aboot a spam samwitch?"
    click_on "Reply"
    click_on "Edit Comment"
    fill_in "Content", :with => "How about a ham sandwich?"
    click_on "Reply"
    expect(page).to have_content "Reply replaced."
  end
end
