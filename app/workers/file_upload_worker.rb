
class FileUploadWorker
  include Sidekiq::Worker

  def perform(document_id)
    FileUploadMailer.confirmation_upload(document_id).deliver_later
  end
end
