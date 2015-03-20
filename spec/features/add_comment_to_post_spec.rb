require 'rails_helper'

describe "the add comment to post process" do
  it "adds a new comment to a specific post" do
    stupid_post = Post.create(:name => "Shut up", :content => "Nobody's smart but me. Ya'll shut up now.")
    visit post_path(stupid_post)
    click_on 'Add Comment'
    fill_in "Content", :with => "You're rude. Stop it before I bop you upside your head."
    click_on "Reply"
    expect(page).to have_content "added to the historical record"
  end
end
