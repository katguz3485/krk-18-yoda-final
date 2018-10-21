User.destroy_all

user = User.create!(
  email: 'admin@document.pl',
  password: 'Doc1234'
)

Bucket.create!(
  name: 'Main',
  user_id: user.id  
)

Document.create!(
  name: 'Document',
  url: 'http://localhost:3000',
  document_type: 'pdf',
  issue_date: 2018-10-20,
  bucket_id: bucket.id
)

puts "Seeds have been added."