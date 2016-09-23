module Web
  class OperationsController < WebController
    def index
      current_user.decorate
    end

    def new
    end

    def create
      operation = OperationForm.new(operation_params.merge(user: current_user))
      if operation.save
        respond_with operation, location: root_url
      else
        flash[:error] = operation.errors.full_messages.join('. ')
        respond_with operation, location: root_url
      end
    end

    def operations
      @operations = current_user.all_operations.decorate
    end
    helper_method :operations

    def family
      @family ||= current_user.family.decorate if current_user.family
    end
    helper_method :family

    def operation
      @operation ||= begin
                    Operation.find_by(id: params[:id]) || current_user.operations.build
                  end
    end
    helper_method :operation

    private

    def operation_params
      params.require(:operation).permit(:description, :operation_type, :amount, :source_id)
    end
  end
end
