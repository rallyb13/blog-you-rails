def sign_in(user)
  visit root_path
  click_on "Sign In"
  fill_in "Email", :with => 'egg@yolkmail.com'
  fill_in "Password", :with => 'scramble'
  click_on "Submit"
end
