require 'rails_helper'

describe User do
  it {should validate_confirmation_of :password}
  it {should validate_presence_of :email}

  it {should have_many :posts}
  it {should have_many :comments}
end
