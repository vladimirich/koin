class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.text :description
      t.string :operation_type
      t.bigint :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
