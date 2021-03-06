User.create!(name:  "Jeffrey Hwang",
             email: "jhwang@madisoncollege.edu",
             password:              "jeffrey",
             password_confirmation: "jeffrey",
             admin: true)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

98.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Date.between(80.years.ago, Date.today)
  users.each { |user| user.microposts.create!(content: content) }
end