class AddConfirmableToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.confirmable
      t.reconfirmable
    end
    add_index :users, :confirmation_token, :unique => true
  end

  def self.down
    remove_column :users, :confirmed_at, :confirmation_token, 
      :confirmation_sent_at, :unconfirmed_email
  end
end