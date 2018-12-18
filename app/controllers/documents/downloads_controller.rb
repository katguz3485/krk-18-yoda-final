# frozen_string_literal: true

class Documents::DownloadsController < ApplicationController
  before_action :set_document

  def show
    redirect_to @document.file.file.authenticated_url
  end

  private

  def set_document
    @document = current_user.documents.find(params[:id])
  end
end
