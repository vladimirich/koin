class Web::OperationsController < ApplicationController
  def index
  end

  def family
    @family ||= Family.first.decorate
  end
  helper_method :family
end
