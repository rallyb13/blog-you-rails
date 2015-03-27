require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Create New Post'
    fill_in "Title", :with => "Top 10"
    fill_in "Content", :with => "Here's my top ten books of the year..."
    click_on "Post It"
    expect(page).to have_content "successfully"
  end

  it "throws an alert if a post isn't saved" do
    visit posts_path
    click_on 'Create New Post'
    fill_in "Content", :with => "Here's my top ten books of the year..."
    click_on "Post It"
    expect(page).to have_content "Failure."
  end
end
