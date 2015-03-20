require 'rails_helper'

describe 'the post deletion process' do
  it "destroys a post forever" do
    destined_to_die = Post.create(:name => "Fatality", :content => "Valor Margulous, or whatever")
    visit posts_path
    click_on "Fatality"
    click_on "Destroy Post Forever"
    expect(page).to have_content "burninated"
  end
end
