
module Expensirb
  class Employee


    def update(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "create"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS

      inputSettings = {}
      inputSettings[:type] = "employees"
      inputSettings[:fileType] = "csv"
      inputSettings[:policyID] = opts[:policyID]
      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json

      cols = opts[:column_headers]
      data << cols.join(',')
      opts[:data].each do |i|
        data << i.join(',')
      end
      Expensirb.make_request method, Expensirb::Constants::API_URL, parameters: [final_json, data]

    end
  end
end