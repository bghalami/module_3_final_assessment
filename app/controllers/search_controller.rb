class SearchController < ApplicationController
  def index
    @sentence_facade = Sentences.new(params[:Word])
  end
end
