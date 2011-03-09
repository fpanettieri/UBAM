class AddIpToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :ip, :string
  end

  def self.down
    remove_column :logs, :ip
  end
end
