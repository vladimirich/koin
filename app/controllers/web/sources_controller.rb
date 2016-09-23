module Web
  class SourcesController < WebController
    def new
    end

    def create
      source = current_user.sources.create(source_params)
      if source.valid?
        respond_with source, location: root_url
      else
        flash[:error] = source.errors.full_messages.join('. ')
        respond_with source, location: root_url
      end
    end

    def source
      @source ||= begin
                    Source.find_by(id: params[:id]) || current_user.sources.build
                  end
    end
    helper_method :source

    private

    def source_params
      params.require(:source).permit(:name, :balance)
    end
  end
end
