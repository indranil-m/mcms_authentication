=begin
******************************************************************************************************************

  FileName:                                          20120608140424_devise_create_users.rb

	Company Name and Copyright information:            Mindfire Solutions Pvt. Ltd.

	Creator name and date:                             Indranil Mukherjee 08/06/2012

	Description of the file contents:                  This is the migration file for creating roles_users table
                                                     which is a join table for users and roles
                                                     In our case mcms_roles_users

******************************************************************************************************************
=end

class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :mcms_roles_users do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.timestamps
    end
  end
end
