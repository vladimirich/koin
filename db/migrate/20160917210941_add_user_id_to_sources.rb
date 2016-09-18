class AddUserIdToSources < ActiveRecord::Migration[5.0]
  def change
    add_reference :sources, :user, index: true
  end
end
