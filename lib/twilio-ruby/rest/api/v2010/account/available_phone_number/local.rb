##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class LocalList < ListResource
      ##
      # Initialize the LocalList
      def initialize(version, account_sid: nil, country_code: nil)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid,
            country_code: country_code
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers/#{@solution[:country_code]}/Local.json"
      end
      
      ##
      # Reads LocalInstance records from the API as a list.
      def list(beta: nil, limit: nil, page_size: nil)
        self.stream(
            beta: beta,
            limit: limit,
            page_size: page_size
        ).entries
      end
      
      def stream(beta: nil, limit: nil, page_size: nil)
        limits = @version.read_limits(limit, page_size)
        
        page = self.page(
            beta: beta,
            page_size: limits['page_size'],
        )
        
        return @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
      end
      
      def each
        limits = @version.read_limits
        
        page = self.page(
            page_size: limits['page_size'],
        )
        
        @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
      end
      
      ##
      # Retrieve a single page of LocalInstance records from the API.
      def page(beta: nil, page_token: nil, page_number: nil, page_size: nil)
        params = {
            'Beta' => beta,
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return LocalPage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
            country_code: @solution['country_code'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.LocalList>'
      end
    end
  
    class LocalPage < Page
      def initialize(version, response, account_sid, country_code)
        super(version, response)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
            'country_code' => country_code,
        }
      end
      
      def get_instance(payload)
        return LocalInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            country_code: @solution['country_code'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Api.V2010.LocalPage>'
      end
    end
  
    class LocalInstance < InstanceResource
      def initialize(version, payload)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'friendly_name' => payload['friendly_name'],
            'phone_number' => payload['phone_number'],
            'lata' => payload['lata'],
            'rate_center' => payload['rate_center'],
            'latitude' => payload['latitude'].to_f,
            'longitude' => payload['longitude'].to_f,
            'region' => payload['region'],
            'postal_code' => payload['postal_code'],
            'iso_country' => payload['iso_country'],
            'address_requirements' => payload['address_requirements'],
            'beta' => payload['beta'],
            'capabilities' => payload['capabilities'],
        }
      end
      
      def friendly_name
        @properties['friendly_name']
      end
      
      def phone_number
        @properties['phone_number']
      end
      
      def lata
        @properties['lata']
      end
      
      def rate_center
        @properties['rate_center']
      end
      
      def latitude
        @properties['latitude']
      end
      
      def longitude
        @properties['longitude']
      end
      
      def region
        @properties['region']
      end
      
      def postal_code
        @properties['postal_code']
      end
      
      def iso_country
        @properties['iso_country']
      end
      
      def address_requirements
        @properties['address_requirements']
      end
      
      def beta
        @properties['beta']
      end
      
      def capabilities
        @properties['capabilities']
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        "<Twilio.Api.V2010.LocalInstance>"
      end
    end
  end
end