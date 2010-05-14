class RootController < ApplicationController
  require_auth = [:index]
  before_filter CASClient::Frameworks::Rails::GatewayFilter, :only => require_auth
  before_filter CASClient::Frameworks::Rails::Filter, :except => require_auth

  def index
  end

  def logout
    @admin_user = nil
    @current_user = nil
    CASClient::Frameworks::Rails::Filter.logout(self, request.referer) and return
  end
end
