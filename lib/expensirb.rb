require 'expensirb/version'
require 'rest-client'
require 'json'
require 'uri'
require 'expensirb/errors/error'

module Expensirb

  def report
    Expensirb::Report.new
  end

  def employee
    Expensirb::Employee.new
  end

  def policy
    Expensirb::Policy.new
  end

  def expense
    Expensirb::Expense.new
  end

  def self.make_request(method, url, parameters)
    begin
      JSON.parse(RestClient.send(method, url, parameters))
    rescue RestClient::ExceptionWithResponse => e
      handle_api_error(e)
    end
  end

  def self.handle_error(error)
    begin
      response = JSON.parse(error.http_body.to_s)
      message = response.fetch("error").fetch("message")
      raise InvalidRequestError.new(message, error.http_code, error.http_body, error.response)
    rescue JSON::ParserError, KeyError
      raise Expensirb::ExpensirbError.new
    end
  end
end
