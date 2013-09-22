module Hominid
  class Export
    
    # MailChimp Export API Documentation: http://apidocs.mailchimp.com/export/1.0/
    MAILCHIMP_EXPORT_VERSION = "1.0"
    
    # Initialize with an API key and config options
    def initialize(api_key, config = {})
      raise ArgumentError.new('Your Mailchimp API key appears to be malformed.') unless api_key.include?('-')
      dc = api_key.split('-').last
      defaults = {
        :api_version        => MAILCHIMP_EXPORT_VERSION,
        :secure             => false
      }
      @config = defaults.merge(config).freeze
      protocol = @config[:secure] ? 'https' : 'http'
      @api_key = api_key
      @api_base = "#{protocol}://#{dc}.api.mailchimp.com/export/#{@config[:api_version]}"
    end
    
    # TODO: We'll have to see how this progresses with regard to Mailchimp
    #       adding methods to the Export API. It would be nice to have this
    #       model follow the "method_missing" style of the others, but it
    #       would require passing arguments in as a hash:
    #
    #       hominid_export.list({:id => 123, :status => 'unsubscribed'})
    #
    #       It's the only way to get the *args to map over to the params hash
    #       if we use the "method_missing" approach. For now, this way seems
    #       more intuitive to the end user.
    
    def list(id, status = 'subscribed', segment = [], since = '1900-01-01 00:00:00')
      post_data = {
        :apikey => @api_key,
        :id => id,
        :status => status,
        :since => since
      }
      call('list', post_data)
    end
    
    def campaign_subscriber_activity(id, include_empty = false)
      post_data = {
        :apikey => @api_key,
        :id => id,
        :include_empty => include_empty,
      }
      call('campaignSubscriberActivity', post_data)
    end
    
    private
    
    def call(list_method, post_data)
      uri = URI.parse("#{@api_base}/#{list_method}/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if @config[:secure]
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(post_data)
      response = http.request(request)
      response.body
    end
  end
end