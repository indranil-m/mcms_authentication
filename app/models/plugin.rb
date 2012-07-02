=begin

  @File Name                            :plugin.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This model is responsible for defining logic tracking
                                         access control of a particular module for a particular
                                         role

=end

class Plugin < ActiveRecord::Base


  self.table_name = 'mcms_plugins' # setting my custome table name with this model (required to be declared here/not in application.rb as it is limited to my gem)

  attr_accessible :id, :role_module , :role_read , :role_create , :role_update , :role_destroy , :role_manage , :role_id

  belongs_to :role # it belongs to role
  
end
