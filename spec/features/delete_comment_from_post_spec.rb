require 'rails_helper'

describe 'the delete a comment process' do
  it 'deletes a comment from within a post' do
    comment1 = FactoryGirl.create(:comment)
    sign_in(comment1.user)
    visit post_path(comment1.post)
    click_on "Eliminate Comment"
    expect(page).to have_content "Reply erased."
  end
end
