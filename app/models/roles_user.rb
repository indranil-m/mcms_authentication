=begin

  @File Name                            :role.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This model is required for logic set of role user relation

=end


class RolesUser < ActiveRecord::Base
  
  # Join table/model for User and Role HABTM association
  
  self.table_name = 'mcms_roles_users'  # setting my custome table name with this model (required to be declared here/not in application.rb as it is limited to my gem)

  attr_accessible :user_id , :role_id

  belongs_to :user
  
  belongs_to :role

   
end
