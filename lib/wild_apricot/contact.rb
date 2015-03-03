module WildApricot
  class Contact
    include HTTParty
    base_uri 'https://api.wildapricot.org/v2'
    headers 'Authorization' => "Bearer AUTHORIZATION KEY HERE"

    def all
      endpoint = "/Accounts/#{account_id}/Contacts?$async=false"
      self.class.get(endpoint).parsed_response
    end

    def find(contact_id)
      endpoint = "/Accounts/#{account_id}/Contacts/#{contact_id}"
      self.class.get(endpoint).parsed_response
    end

    def create(params)
      endpoint = "/Accounts/#{account_id}/Contacts"
      self.class.post(endpoint, body: params).parsed_response
    end

    private

    def account_id
      60177
    end
  end
end
