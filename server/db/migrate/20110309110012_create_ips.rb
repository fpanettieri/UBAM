class CreateIps < ActiveRecord::Migration
  def self.up
    create_table :ips do |t|
      t.string :address
    end
  end

  def self.down
    drop_table :ips
  end
end
