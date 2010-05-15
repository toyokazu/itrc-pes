class RootController < ApplicationController
  without_auth = [:index]
  before_filter :login_required, :except => without_auth

  def index
  end
end
