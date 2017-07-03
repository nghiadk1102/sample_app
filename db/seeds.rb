User.create! name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar", admin: true,
  activated: true, activated_at: Time.zone.now, birth_day: Time.zone.now, address: "Hanoi", phone: "696969699"


25.times do |n|
  name = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  address = FFaker::Address.city
  phone = FFaker::PhoneNumber.phone_number
  birth_day = FFaker::Time.date
  User.create! name: name, email: email, password: password,
    password_confirmation: password, admin: false,
    activated: true, activated_at: Time.zone.now,
    address: address, birth_day: birth_day, phone: phone
end

users = User.order(:created_at).take 6
10.times do
  content = FFaker::Lorem.sentence 5
  users.each {|user| user.posts.create! content: content}
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
