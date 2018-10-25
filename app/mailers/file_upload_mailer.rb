# frozen_string_literal: true

class FileUploadMailer < ApplicationMailer
  def confirmation_upload(document_id)
    @document = Document.find(document_id)
    @user = @document.user

    mail(to: 'ashente@gmail.com', subject: 'Your file was uploaded successfully')
  end
end
