FactoryGirl.define do
  factory(:user) do
    email('egg@yolkmail.com')
    username('Egg Gray')
    phone('5555555555')
    password('scramble')
    password_confirmation('scramble')
  end

  factory(:post) do
    name('First Post')
    content('I cannot think of a thing to say.')
    user
  end

  factory(:comment) do
    content('Why did you start a blog?')
    user
    post
  end
end
