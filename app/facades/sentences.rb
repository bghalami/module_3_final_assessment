class Sentences

  def initialize(word)
    @word = word
    sentences_endpoint(word)
  end

  def sentences

  end

  private

  def service
  end

  def conn
    Faraday.new(:url => 'https://od-api.oxforddictionaries.com/api/v1/entries/en') do |req|
      req.headers['app_id'] = ENV['OXFORD_APP_ID']
      req.headers['app_key'] = ENV['OXFORD_APP_KEY']
    end
  end

  def sentences_endpoint(word)
    conn.get
    
  end
end
