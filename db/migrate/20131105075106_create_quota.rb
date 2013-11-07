class CreateQuota < ActiveRecord::Migration
  def change
    create_table :quota do |t|
      t.string :user
      t.integer :quota
      t.string :directory
      t.integer :usage
      t.string :date
      t.string :proj
      t.timestamps
    end
  end
end
