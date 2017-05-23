require 'securerandom'

User.destroy_all
Image.destroy_all
Post.destroy_all
100.times do |i|
  user = User.create(
    first_name: "first#{i}",
    last_name: "last#{i}",
    username: "username#{i}",
    email: "test#{i}@example.com",
    password: 'password',
    birthday: (Date.today - i.years)
  )
  user.posts.create(
    title: "Hello from #{user.id}",
    body: SecureRandom.hex,
    published_at: Time.now
  )
  print '.'
end

User.create(
  first_name: 'admin',
  last_name: 'admin',
  username: 'Admin',
  email: 'admin@example.com',
  password: 'password',
  birthday: '1990'
)

ap'done', color: { string: :greenish }
