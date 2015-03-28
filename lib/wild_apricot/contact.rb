module WildApricot
  class Contact
    include HTTParty
    base_uri 'https://api.wildapricot.org/v2'

    def initialize(authorization_key, account_id)
      self.class.headers({ 'Authorization' => "Bearer #{authorization_key}" })
      @account_id = account_id
    end

    def all
      endpoint = "/Accounts/#{@account_id}/Contacts?$async=false"
      self.class.get(endpoint).parsed_response['Contacts']
    end

    def find(contact_id)
      endpoint = "/Accounts/#{@account_id}/Contacts/#{contact_id}"
      self.class.get(endpoint).parsed_response
    end

    def create(params)
      endpoint = "/Accounts/#{@account_id}/Contacts"
      self.class.post(endpoint, body: params).parsed_response
    end
  end
end
