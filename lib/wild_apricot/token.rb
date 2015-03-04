module WildApricot
  class Token
    include HTTParty
    base_uri 'https://oauth.wildapricot.org'
    headers 'Authorization' => "Basic #{Base64.encode64('API KEY HERE')}"

    def authorize
      endpoint = '/auth/token'
      body = { grant_type: 'client_credentials', scope: 'contacts' }
      self.class.post(endpoint, body: body).parsed_response
    end

    def refresh_token(token)
      endpoint = '/auth/token'
      body = { grant_type: 'refresh_token', refresh_token: token }
      self.class.post(endpoint, body: body).parsed_response
    end
  end
end
