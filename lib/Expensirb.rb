require 'expensirb/version'
require 'rest-client'
require 'json'
require 'uri'
require '../lib/expensirb/errors/error'

module Expensirb
  class << self
    attr_accessor :api_key, :protocol, :api_url

  end

  def self.submit(method, url, options={})
    RestClient(:method, url, options)

  end



  def Expensirb(options={})
    options[:api_key] ||= Expensirb.api_key || ""
    options[:api_url] ||= Expensirb.api_url || "https://integrations.expensify.com/Integration-Server/ExpensifyIntegrations"
  end


  return Expensirb::Handler.new(options)
end
