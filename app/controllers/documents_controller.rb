# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  def index
    @documents = Document.all
    # @documents = current_user.documents
    @buckets = current_user.buckets
  end

  def show
  end

  def new
    @document = Document.new

  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      perform_upload_file_confirmation(@document.id)
      redirect_to dashboard_path
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html {redirect_to @document, notice: 'Document was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html {redirect_to Documents_url, notice: 'Document was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :title, :content, :file, :document_type, :issue_date, :bucket_id)
  end

  def perform_upload_file_confirmation(document_id)
    ::FileUploadWorker.perform_async(document_id)
  end
end
