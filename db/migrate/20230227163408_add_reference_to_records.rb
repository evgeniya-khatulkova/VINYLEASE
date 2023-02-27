class AddReferenceToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :user, index: true
  end
end
