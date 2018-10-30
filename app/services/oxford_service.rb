class OxfordService

  def service(word)
    oxford_body(word)[:results].first[:lexicalEntries].first[:sentences].select do |sentence|
      sentence[:regions].first == "Canadian" || sentence[:regions].first == "British"
    end
  end

  def oxford_body(word)
    get_json(sentences_endpoint(word))
  end

  def get_json(to_jsoned)
    JSON.parse(to_jsoned.body, symbolize_names: true)
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
