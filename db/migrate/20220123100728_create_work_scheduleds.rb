class CreateWorkScheduleds < ActiveRecord::Migration[5.2]
  def change
    create_table :work_scheduleds do |t|
       t.string :member_id, null: false
       t.datetime :time_in
       t.datetime :time_out
      t.timestamps
       end
  end
end
