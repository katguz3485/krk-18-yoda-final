# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = Elasticsearch::Model.search(query, Document).page(params[:page]).records
  end

  private

  def query
    @query = params[:query]
  end
end
