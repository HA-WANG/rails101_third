puts "Create fake data"

# Create 30 accounts
30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password)
end

# account 1, create 20 groups, each group 30 posts
for i in 1..30 do
  title = Faker::Hipster.word
  description = Faker::Hipster.sentence
  Group.create!([title: title, description: description, user_id: "1"])
  GroupUser.create(group_id: i, user_id: 1)
  for k in 1..50 do
    content = Faker::Hipster.paragraph
    Post.create!([group_id: "#{i}",content: content, user_id: "1"])
  end
end

puts "Complete"
