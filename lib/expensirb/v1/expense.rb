module Expensirb
  class Expense

    def create(method, opts={})
      requestJobDescription = {}
      requestJobDescription[:type] = "create"
      requestJobDescription[:credentials] = Expensirb::Constants::CREDENTIALS

      # inputSettings
      inputSettings = {}
      inputSettings[:type] = "expenses"
      inputSettings[:employeeEmail] = opts[:employeeEmail]
      inputSettings[:transactionlist] = opts[:transactionlist]
      requestJobDescription[:inputSettings] = inputSettings

      final_json = requestJobDescription.to_json

      Expensirb.make_request method, Expensirb::Constants::API_URL, final_json

    end


  end
end
