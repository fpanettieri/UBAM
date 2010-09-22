class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.references :app
      t.references :user
      t.references :action
      t.string :detail
      t.datetime :time
    end
  end

  def self.down
    drop_table :logs
  end
end
