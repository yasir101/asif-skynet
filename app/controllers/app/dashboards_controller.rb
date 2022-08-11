# frozen_string_literal: true

module App
  class DashboardsController < ApplicationController
    def show
      sms = SMSService.new('','','')
      @balance = sms.get_balance 
    end
  end
end
