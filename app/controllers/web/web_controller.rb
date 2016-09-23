require "application_responder"

module Web
  class WebController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :html

    layout "web/layouts/application"

    before_action :authenticate_user!
  end
end
