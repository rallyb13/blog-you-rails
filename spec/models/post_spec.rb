require 'rails_helper'

describe Post do
  it {should validate_presence_of :name}
  it {should validate_presence_of :content}
  it {should have_many :comments}
end
