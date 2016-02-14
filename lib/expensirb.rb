require 'expensirb/version'
require 'rest-client'
require 'json'
require 'uri'
require '../lib/expensirb/errors/error'

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


end
