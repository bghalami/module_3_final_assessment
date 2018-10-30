class SearchController < ApplicationController
  def index
    @sentences = Sentences.new(params[:Word])
  end
end
