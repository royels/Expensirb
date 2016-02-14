require 'json'

module Expensirb
  class Report


    def export(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "file"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS
      requestJobDescription[:test] = opts[:test] unless opts[:test].nil?
      requestJobDescription[:limit] = opts[:limit] unless opts[:limit].nil?
      requestJobDescription[:onFinish] = opts[:onFinish] unless opts[:onFinish].nil?


      # onReceive
      requestJobDescription[:onReceive] = opts[:onReceive]

      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "combinedReportData"
      inputSettings[:filters] = opts[:filters]
      inputSettings[:reportState] = opts[:reportState] unless opts[:reportState].nil?
      inputSettings[:employeeEmail] = opts[:employeeEmail] unless opts[:employeeEmail].nil?
      requestJobDescription[:inputSettings] = inputSettings

      # outputSettings

      outputSettings = {}
      outputSettings[:fileExtension] = opts[:fileExtension]
      outputSettings[:fileBasename] = opts[:fileBasename] unless opts[:fileBasename].nil?
      outputSettings[:includeFullPageReceiptsPdf] = opts[:includeFullPageReceiptsPdf] unless opts[:includeFullPageReceiptsPdf].nil?
      requestJobDescription[:outputSettings] = outputSettings

      # template
      requestJobDescription[:template] = template


      final_json = requestJobDescription.to_json











      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json
    end

    def create(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "create"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS


      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "report"
      inputSettings[:employeeEmail] = opts[:employeeEmail]
      inputSettings[:report] = opts[:report]
      inputSettings[:expenses] = opts[:expenses]
      inputSettings[:policyID] = opts[:policyID]

      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json
      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json
    end


    def status_update(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "update"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS



      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "reportStatus"
      inputSettings[:filters] = opts[:filters]
      inputSettings[:status] = opts[:status]
      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json
      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json
    end

  end
end
