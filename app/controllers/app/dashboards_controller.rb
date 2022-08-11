# frozen_string_literal: true

module App
  class DashboardsController < ApplicationController
    def show
      sms = SMSService.new('','','')
      @balance = sms.get_balance
      @expiry = sms.get_expiry
    end
  end
end
