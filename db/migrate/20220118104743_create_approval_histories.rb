class CreateApprovalHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :approval_histories do |t|
      t.references :admin, foreign_key: true
      t.references :attendance_information, foreign_key: true
      t.text :reason
      t.timestamps
    end
  end
end
