=begin

  @File Name                            :roles_controller.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-14

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :This controller is responsible for creating,
                                         editing,destroying roles

=end

class RolesController < ApplicationController


  
  prepend_before_filter :authenticate_user!  #Need authentication for each actions
  
  load_and_authorize_resource # Need authorized users for each actions

  layout HOME_LAYOUT # Following a particular layout.not default one

  include Models # We need helps of a custom library which is defined in lib/mcms_authentication/models.rb

  

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned GET mcms/roles
  #  @Purpose                              : Showing all existing roles
  
  def index
    
    @roles = Role.all # fetching all roles

    respond_to do |f|

      f.html  # output as HTML
      
      f.json {render :json => @roles} # output as json
      
    end
    
  end

  

  #  @Params                               : No parameter
  #  @Returns                              : Nothing is returned GET mcms/roles/new
  #  @Purpose                              : Instantiating a new role

  def new

    @all_plugins = get_all_plugins # getting all plugins(modules) in current application

    @role = Role.new # instantiating a new role

    respond_to do |f|

      f.html # output as HTML
      
      f.json {render :json => @role} # output as json

    end
    
  end

  

  #  @Params                               : Hash
  #  @Returns                              : Nothing is returned POST mcms/roles/
  #  @Purpose                              : Instantiating a new role
  
  def create
    # instantiating a role with passed parameters
    @role = Role.new(params[:role]) 

    # getting all plugins(modules) in current application
    @all_plugins = get_all_plugins 

    
    #    for i in 0..@all_plugins.length - 1
    #
    #      if((@all_plugins[i]&@all_plugins[i+1]).any?)
    #        @all_plugins[i] = (@all_plugins[i] + @all_plugins[i+1]).uniq
    #      end
    #
    #    end

    respond_to do |format|
      
      if @role.save # saving the role

        # iterating existing plugins and creating plugin access for the role being saved
        # we have used conditional statements to set boolean values for crud access to each module.

        @all_plugins.each do |plugin|

          p = Plugin.new
          
          p.role_module = plugin.last

          models = ExistingModel.find_by_plugin_name(plugin.last)
          
          if models.nil?
            plugin.each do |pl|

              existing_model = ExistingModel.new
              existing_model.plugin_name = plugin.last
              existing_model.model_name = pl
              existing_model.save
             
            end
            
          end

          all = plugin.last + ALL
           
          read = plugin.last + READ

          create = plugin.last + CREATE

          update = plugin.last + UPDATE

          destroy = plugin.last + DESTROY

          if params[all] == "1"

            p.role_manage  = true # setting access control
                                 
          else

            p.role_manage = false # resetting access control

          end

           
          if params[read] == "1" || params[all] == "1"

            p.role_read = true

          else

            p.role_read = false

          end

          if params[create] == "1" || params[all] == "1"

            p.role_create = true

          else

            p.role_create = false

          end

          if params[update] == "1" || params[all] == "1"

            p.role_update = true

          else

            p.role_update = false
              
          end

          if params[destroy] == "1" || params[all] == "1"

            p.role_destroy = true

          else

            p.role_destroy = false
              
          end
          
          p.role_id = @role.id # associating the role being saved

          p.save # saving each plugin access control

        end

        format.html  { redirect_to(roles_path,
            :notice => t(:role_create_success,:default => 'Role was successfully created.')) } # HTML response

        format.json  { render :json => @role,
          :status => :created, :location => @role } # json response
      else

        # if any exception occured recreate the role
        format.html  { render :action => "new" } # HTML response
        
        format.json  { render :json => @role.errors,
          :status => :unprocessable_entity } # json response
        
      end
      
    end
    
  end


  #  @Params                               : Integer
  #  @Returns                              : Nothing is returned PUT mcms/roles/1/edit
  #  @Purpose                              : Updating an existing role

  def edit

    @all_plugins = get_all_plugins # fetching all the plugins
    
    @role = Role.find(params[:id]) # fetching the role to be updated

    respond_to do |f|

      f.html      #HTML response
      
      f.json {render :json => @role} #JSON response
      
    end
    
  end


  #  @Params                               : Integer
  #  @Returns                              : Nothing is returned PUT mcms/roles/1/edit
  #  @Purpose                              : Updating an existing role

  def update
    
    # Finding the role to be updated by ID
    @role = Role.find(params[:id])
    
    # Fetching all the available plugins
    @all_plugins = get_all_plugins 

    respond_to do |format|
      
      if @role.update_attributes(params[:role]) # updating the role

        # plugins access control is also updated with conditional checks.
        
        @all_plugins.each do |plugin|

          p = Plugin.find_by_role_module(plugin.last)

          if p.nil?

            p = Plugin.new
            
          end
          models = ExistingModel.find_by_plugin_name(plugin.last)

          if models.nil?
            
            plugin.each do |pl|

              existing_model = ExistingModel.new
              existing_model.plugin_name = plugin.last
              existing_model.model_name = pl
              existing_model.save

            end

          end
          
          p.role_module = plugin.last

          all = plugin.last + ALL

          read = plugin.last + READ

          create = plugin.last + CREATE

          update = plugin.last + UPDATE

          destroy = plugin.last + DESTROY

          if params[all] == "1"

            p.role_manage  = true
          else
            p.role_manage = false
          end


          if params[read] == "1" || params[all] == "1"

            p.role_read = true
          else
            p.role_read = false
          end

          if params[create] == "1" || params[all] == "1"

            p.role_create = true
          else
            p.role_create = false
          end

          if params[update] == "1" || params[all] == "1"

            p.role_update = true

          else

            p.role_update = false

          end

          if params[destroy] == "1" || params[all] == "1"

            p.role_destroy = true

          else

            p.role_destroy = false

          end

          p.role_id = @role.id

          p.save

        end


        format.html  { redirect_to(roles_path,
            :notice => t(:role_update_success,:default => 'Role was successfully updated.')) } # HTML response
        
        format.json  { head :no_content } # JSON Response
        
      else

        format.html  { render :action => "edit" } # Failed HTML response to update again

        format.json  { render :json => @role.errors,
          :status => :unprocessable_entity } # Failed JSON response to update again

      end

    end
    
  end



  #  @Params                               : Integer
  #  @Returns                              : Nothing is returned DELETE mcms/roles/1/
  #  @Purpose                              : Destroying an existing role

  def destroy

    @role = Role.find(params[:id]) # Select a role to be destroyed

    @role.destroy # delete the role

    respond_to do |format|

      format.html { redirect_to roles_url } # HTML response

      format.json { head :no_content }  # JSON response

    end
    
  end
  
end
