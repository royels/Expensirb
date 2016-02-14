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











      Expensirb.make_request(method, final_json)
    end

    def create(method, opts={})

    end


    def status_update(method, opts={})

    end

  end
end
