module Hominid
  class STS < API
    
    # MailChimp STS API Documentation: http://apidocs.mailchimp.com/sts/1.0/
    MAILCHIMP_STS_VERSION = "1.0"
    
    # Initialize with an API key and config options
    def initialize(api_key, config = {})
      defaults = {
        :api_version        => MAILCHIMP_STS_VERSION,
        :domain             => 'sts.mailchimp.com',
        :secure             => false,
        :timeout            => nil
      }
      super(api_key, defaults.merge(config))
    end
    
  end
end