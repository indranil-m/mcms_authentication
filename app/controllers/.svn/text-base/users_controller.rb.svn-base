=begin

  @File Name                            :users_controller.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This controller is responsible for managing users

=end

class UsersController <  Devise::RegistrationsController # inheriting Devise::Registrations controller to override the actions(CRUDS user)


  prepend_before_filter :authenticate_user! # Obvious need of authetication before proceeding

  load_and_authorize_resource # authorized users are allowed for the operations


  # The following line seems to be redundant as we already said that every action requires authentication.
  # But its actually not.We need to override devise behaviour to sign up non-logged in user.Here it needs a logged in user  
  prepend_before_filter :require_no_authentication, :except => [ :new,:index, :create,:edit,:destroy_user,:update ]

  layout HOME_LAYOUT # using a layout

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned GET mcms/users
  #  @Purpose                              : Showing all existing users
  
  def index

    @users = User.all # Selecting all users
    
    respond_to do |f|

      f.html # HTML response

      f.json {render :json => @users} # JSON response
      
    end
    
  end

 
  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned GET mcms/users/new
  #  @Purpose                              : Instantiating a new user

  def new

    @all_roles = Role.all # Roles needs to be there to select

    super # else is upto devise
    
  end


  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned POST mcms/users/
  #  @Purpose                              : Creating a new user

  def create
    
    build_resource # This helper is defined in devise which is building the resource (here user) so that we can have resource to be accessed here


    @all_roles = Role.all # fetch all roles

    if resource.save # saving the resource (here user)
      
      if resource.active_for_authentication? # (we are not bother about active which is done after confirmation.In our case user is active upon registartion.No confirmation is needed. )

        # saving the roles

        @all_roles.each do |role|

          tmp = role.id.to_s + VALUE
          
         

          RolesUser.create!(:user_id => resource.id , :role_id => Role.find_by_title(role.title).id) if params[tmp] == "1"
         
        end

        flash[:notice] = t(:user_create_success,:user_email => resource.email ,:default => "#{resource.email} successfully created")
        
        redirect_to mcms_users_path
      else

        @all_roles.each do |role|

          tmp = role.id.to_s + VALUE

          RolesUser.create!(:user_id => resource.id , :role_id => Role.find_by_title(role.title).id) if params[tmp] == "1"

        end
        
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?

        expire_session_data_after_sign_in!

        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        
      end
      
    else
      
      clean_up_passwords resource
      
      respond_with resource
      
    end
    
  end

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned POST mcms/users/1/edit
  #  @Purpose                              : Editing an existing user

  def edit
    
    @all_roles = Role.all
     
    @user = User.find(params[:id]) # finding the user to be edited
    
    respond_to do |f|
      f.html   #HTML response
      f.json {render :json => @user} # JSON response
    end
    
  end

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned POST mcms/users/1/edit
  #  @Purpose                              : Updating an existing user

  def update
   
    @user = User.find(params[:id]) # Finding the user to be updated

    @all_roles = Role.all

    # Following we are checking whether password field is kept blank ;so the old password stays.

    params[:user].delete(:password) if params[:user][:password].blank?

    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    # Updating the attributes of users

    if @user.update_attributes(params[:user])

      # Assigning updated roles
      
      @all_roles.each do |role|

        tmp = role.id.to_s + VALUE

        RolesUser.create!(:user_id => resource.id , :role_id => Role.find_by_title(role.title).id) if params[tmp] == "1" && RolesUser.find_by_role_id_and_user_id(Role.find_by_title(role.title).id,resource.id).nil?

      end
        
      flash[:notice] = t(:user_update_success,:user_email => @user.email,:default => "#{@user.email} successfully updated")
      
      redirect_to mcms_users_path

    else

      render :action => 'edit'

    end


  end

  # If the user needs to be destroyed
  
  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned DELETE mcms/users/1
  #  @Purpose                              : Destroying an existing user

  def destroy_user
    
    @user = User.find(params[:id]) # Find the user to be destroyed
   
    @user.destroy # destroy it

    flash[:notice] = t(:user_destroy_success,:user_email => @user.email,:default => "#{@user.email} successfully deleted")

    redirect_to mcms_users_path #go to all users list 
    
  end

  
end
