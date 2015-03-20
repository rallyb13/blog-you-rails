require 'rails_helper'

describe 'the delete a comment process' do
  it 'deletes a comment from within a post' do
    post1 = Post.create(:name => "Play this awesome app, released today!", :content => "Jenny O's new game ThunderStriker is awesome.")
    visit post_path(post1)
    click_on "Add Comment"
    fill_in "Content", :with => "But that's a girrrrr-ul. *whine*"
    click_on "Reply"
    click_on "Eliminate Comment"
    expect(page).to have_content "Reply erased."

  end
end
