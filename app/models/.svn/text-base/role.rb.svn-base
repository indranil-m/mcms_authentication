=begin

  @File Name                            :role.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This model is required for logic set of role related data

=end

class Role < ActiveRecord::Base
  
  self.table_name = 'mcms_roles' # setting my custome table name with this model (required to be declared here/not in application.rb as it is limited to my gem)

  # it is associated with HABTM association to User model
  
  attr_accessible :title

  has_many :roles_users 
  
  has_many :users, :through => :roles_users

  has_many :plugins

  # each role needs an unique title
  
  validates :title,:presence => true , :uniqueness => true

  
  #  @Params                               : Hash
  #  @Returns                              : Array
  #  @Purpose                              : This class method is responsible for fetching an user's roles

  def self.fetch_roles user 
  
    roles = []

    i = 0

    if user.present?

      if user.roles.present?

        user.roles.each do |user_role|

          roles[i] = user_role.title

          i = i + 1

        end

      end
      
    end

    
    roles # returning the roles array

  end

  
end
