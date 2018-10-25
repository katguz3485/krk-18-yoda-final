# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose(:document, attibutes: :document_params)
  expose :documents, -> { Document.all }
  expose :buckets, -> { Bucket.all }

  def index
    authorize document
    @search_documents = Document.where('name like?', "%#{params[:search]}%")
  end

  def create
    if document.save
      authorize document
      perform_upload_file_confirmation(document.id)
      redirect_to dashboard_path, notice: I18n.t('shared.created', resource: 'Document')
    end
  end

  def update
    respond_to do |format|
      if document.update(document_params)
        authorize document
        format.html { redirect_to document, notice: I18n.t('shared.updated', resource: 'Document') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    document.destroy
    authorize document
    respond_to do |format|
      format.html { redirect_to Documents_url, notice: I18n.t('shared.deleted', resource: 'Document') }
      format.json { head :no_content }
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :title, :content, :file, :document_type, :issue_date, :bucket_id)
  end

  def perform_upload_file_confirmation(document_id)
    ::FileUploadWorker.perform_async(document_id)
  end
end
