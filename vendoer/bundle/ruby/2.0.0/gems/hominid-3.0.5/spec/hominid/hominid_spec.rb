require 'spec_helper'

module Hominid
  describe API do
    it "requires an API key" do
      expect {Hominid::API.new}.should raise_error(ArgumentError)
    end
    
    it "requires a valid API key" do
      expect {Hominid::API.new(@invalid_api_key)}.should raise_error(ArgumentError)
    end

    it "also accepts config options" do
      expect {Hominid::API.new(@valid_api_key, {:secure => true})}.should_not raise_error(ArgumentError)
    end
    # TODO: Need a way to mock XMLRPC requests.
  end
  
  describe STS do
    it "returns an instance of API" do
      Hominid::STS.new(@valid_api_key).should be_kind_of(Hominid::API)
    end
  end
end
