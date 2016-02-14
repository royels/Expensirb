require 'json'
module Expensirb
  class Policy

    def create(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "create"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS

      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "policy"
      inputSettings[:policyName] = opts[:policyName]
      inputSettings[:plan] = opts[:plan] unless opts[:plan].nil?
      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json

      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json
    end


    def update(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "update"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS
      requestJobDescription[:categories] = opts[:categories] unless opts[:categories].nil?
      requestJobDescription[:tags] = opts[:tags] unless opts[:tags].nil?
      requestJobDescription[:reportFields] = opts[:reportFields] unless opts[:reportFields].nil?

      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "policy"
      inputSettings[:policyID] = opts[:policyID]
      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json

      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json
    end

  end
end