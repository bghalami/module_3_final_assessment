class Sentences
  attr_accessor :word

  def initialize(word)
    @word = word
    service
  end

  def sentences
    service.map do |sentence|
      [sentence[:text], sentence[:regions].first]
    end
  end

  private

  def service
    x = JSON.parse(sentences_endpoint(@word).body, symbolize_names: true)
    x[:results].first[:lexicalEntries].first[:sentences].select do |sentence|
      sentence[:regions].first == "Canadian" || sentence[:regions].first == "British"
    end
  end

  def conn
    Faraday.new(:url => 'https://od-api.oxforddictionaries.com') do |req|
      req.headers['app_id'] = ENV['OXFORD_APP_ID']
      req.headers['app_key'] = ENV['OXFORD_APP_KEY']
      req.adapter  Faraday.default_adapter
    end
  end

  def sentences_endpoint(word)
    conn.get("/api/v1/entries/en/#{word}/sentences")
  end
end
