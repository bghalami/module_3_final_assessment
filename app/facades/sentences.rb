class Sentences
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def sentences
    service.map do |sentence|
      [sentence[:text], sentence[:regions].first]
    end
  end

  private

  def service
    OxfordService.new.service(@word)
  end
end
