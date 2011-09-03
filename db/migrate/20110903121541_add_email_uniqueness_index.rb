class AddEmailUniquenessIndex < ActiveRecord::Migration
  #purpose of this: do migrations every time data model needs to change.
  #could have done it in the users table listing but then you'd have
  #  to roll back first, change the users table listing, then roll 
  #  up again. this way is better.
  def self.up
    add_index :users, :email, :unique => true  #add_index is a Rails method
  end

  def self.down
    remove_index :users, :email
  end
end
