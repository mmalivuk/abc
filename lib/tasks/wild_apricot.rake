require 'wild_apricot/token'
require 'wild_apricot/contact'

namespace :wild_apricot do
  task :refresh_tokens do
    User.all.each do |user|
      api_key = user.api_key
      refresh_token = user.refresh_token
      token = WildApricot::Token.new(api_key)
      if refresh_token
        body = token.refresh(refresh_token)
      elsif api_key
        body = token.authorize
      end
      user.access_token = body['access_token']
      user.refresh_token = body['refresh_token']
      user.save
    end
  end

  task :sync do
    User.all.each do |user|
      contact = WildApricot::Contact.new(user.access_token, user.account_id)
      contact.all.each do |c|
        chapter = Chapter.find_by_external_id(c['Id'])
        chapter ||= Chapter.new

        fields = c['FieldValues'].inject({}) do |result, field|
          name = field['FieldName']
          value = field['Value']
          if ['Phone', 'Renewal due'].include?(name)
            result[name] = value 
          end
          result
        end

        chapter.user_id = user.id
        chapter.first_name = c['FirstName']
        chapter.last_name = c['LastName']
        chapter.email = c['Email']
        chapter.phone = fields['Phone']
        chapter.renewal_due = fields['Renewal due']
        chapter.external_id = c['Id']
        chapter.save
      end
    end
  end
end
