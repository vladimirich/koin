module Web::OperationsHelper
  def all_sources_for_user_collection(user)
    user.all_sources.map do |source|
      [source.name, source.id]
    end
  end
end
