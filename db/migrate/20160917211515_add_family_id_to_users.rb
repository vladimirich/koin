class AddFamilyIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :family, index: true
  end
end
