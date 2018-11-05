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
    name: 'Example document',
    url: 'https://s3.amazonaws.com/yodaapk/uploads/document/file/4/irida-elastic.png',
    document_type: 'pdf',
    date: '2012-10-15')


puts "Seeds have been added."