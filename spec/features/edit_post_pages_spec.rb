require 'rails_helper'

describe 'the edit a post process' do
  it 'edits a post' do
    post1 = FactoryGirl.create(:post)
    sign_in(post1.user)
    visit post_path(post1)
    click_on "Edit Post"
    fill_in "Content", :with => "Don't Stop Believin'! Streetlights. People. Whoa-oh-OOO!"
    click_on "Post It"
    expect(page).to have_content "updated"
  end

end
