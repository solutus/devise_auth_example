class AddLockable < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
    end
  end

  def down
    change_table :users do |t|
      t.remove "failed_attempts"
      t.remove "unlock_token"
      t.remove "locked_at"  
    end
  end
end
