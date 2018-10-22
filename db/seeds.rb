User.destroy_all

user = User.create!(
  email: 'admin@document.pl',
  password: 'Doc1234'
)

Bucket.create!(
  name: 'Main',
  user_id: user.id  
)

puts "Seeds have been added."