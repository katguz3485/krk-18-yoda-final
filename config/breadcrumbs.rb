crumb  :documents do
  link t('documents'), documents_path
end

crumb :documents do |document|
  link "#{document.name} #{document.url} #{document.document_type} #{document.created_at}", document_path(document)
  parent :documents
end

=begin

crumb :students do
  link t('navbar.students'), students_path
end

crumb :student do |student|
  link "#{student.first_name} #{student.last_name}", student_path(student)
  parent :students
end
=end
