=begin
******************************************************************************************************************

  FileName:                                          20120608104637_devise_create_users.rb

	Company Name and Copyright information:            Mindfire Solutions Pvt. Ltd.

	Creator name and date:                             Indranil Mukherjee 08/06/2012

	Description of the file contents:                  This is the migration file for creating role table for users
                                                     In our case mcms_roles

******************************************************************************************************************
=end

class CreateRoles < ActiveRecord::Migration

  def change
    
    create_table :mcms_roles do |t|

      t.string :title # only title column
      
      t.timestamps

    end

  end
  
end
