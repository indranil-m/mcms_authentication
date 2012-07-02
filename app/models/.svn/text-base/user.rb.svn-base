=begin

  @File Name                            :role.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :The User model is responsible for tracking all the users logics
                                         rules to be imposed on users crud

=end

class User < ActiveRecord::Base
  
  self.table_name = 'mcms_users' # setting my custome table name with this model (required to be declared here/not in application.rb as it is limited to my gem)


  # The user model is added with  the following devise functionalities
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable ,:token_authenticatable,
    :lockable, :timeoutable

  # every functionality is self explanatory

  # for mass assignment we need the attributes to be accessible
  
  attr_accessible :email, :password, :password_confirmation, :remember_me , :utf8, :_method, :authenticity_token, :user, :id, :commit, :action, :controller, :format

 

  #  @Params                               : Nothing
  #  @Returns                              : Nothing
  #  @Purpose                              : Cleaning up passwords

  def clean_up_passwords

    self.password = self.password_confirmation = nil

  end

  # HABTM association between Role and User model

  has_many :roles_users
  
  has_many :roles, :through => :roles_users


  #  @Params                               : String
  #  @Returns                              : Boolean
  #  @Purpose                              : whether the user has the passed role
  
  def has_role? role_title
    
    if self.roles.present?
    
    self.roles.each do |role|

        if role.title == role_title

          return true

        else

          return false

        end

    end

    else

      return false

    end
    
  end


  

  
end
