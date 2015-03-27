require 'rails_helper'

describe 'the post deletion process' do
  it "destroys a post forever" do
    post1 = FactoryGirl.create(:post)
    sign_in(post1.user)
    visit post_path(post1)
    click_on "Destroy Post Forever"
    expect(page).to have_content "burninated"
  end
end
