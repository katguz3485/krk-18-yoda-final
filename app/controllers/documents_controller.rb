# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :authenticate_user!

  expose(:document, attibutes: :document_params)
  expose_decorated :documents, -> { current_user.documents }
  expose :buckets, -> { current_user.buckets }

  def index
    @search_documents = Document.where('name like?', "%#{params[:search]}%")
  end

  def create
    if document.save
      perform_upload_file_confirmation(document.id)
      redirect_to dashboard_path, notice: I18n.t('shared.created', resource: 'Document')
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if document.update(document_params)
        format.html { redirect_to document, notice: I18n.t('shared.updated', resource: 'Document') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    document.destroy
    respond_to do |format|
      format.html { redirect_to document_path, notice: I18n.t('shared.deleted', resource: 'Document') }
      format.json { head :no_content }
    end
  end

  def download
    redirect_to document.download_url
  end

  private

  def document_params
    params.require(:document).permit(:name, :title, :content, :file, :document_type, :issue_date, :bucket_id)
  end

  def perform_upload_file_confirmation(document_id)
    ::FileUploadWorker.perform_async(document_id)
  end

  def download
    redirect_to document.download_url
  end
end
