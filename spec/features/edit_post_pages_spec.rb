require 'rails_helper'

describe 'the edit a post process' do
  it 'edits a post' do
    post1 = Post.create(:name => "Hey Hey Whatevs", :content => "What Ev Urrr!")
    visit posts_path
    click_on "Hey Hey Whatevs"
    click_on "Edit Post"
    fill_in "Content", :with => "Don't Stop Believin'! Streetlights. People. Whoa-oh-OOO!"
    click_on "Post It"
    expect(page).to have_content "updated"
  end

end
