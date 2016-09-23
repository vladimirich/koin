class AddSourceIdToOperations < ActiveRecord::Migration[5.0]
  def change
    add_reference :operations, :source
  end
end
