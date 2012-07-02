=begin
*************************************************************************************************************
  FileName:                                          models.rb

	Company Name and Copyright information:            Mindfire Solutions Pvt. Ltd.

	Creator name and date:                             Indranil Mukherjee 12/06/2012

	Description of the file contents:                  Defining all the routes

*************************************************************************************************************
=end

module Models

=begin

        get_models                  : public

        The method is responsible for returning all existing models

        returns models as an array

=end

  
  def get_models
    
    models = []
   
    # @models = Dir[MODEL_DIR].map {|f| File.basename(f, '.*').camelize.constantize.name } # getting existing models
    Rails.application.eager_load!

    @models = ActiveRecord::Base.descendants.collect(&:name)

    @models.reject!{|m| m.constantize.superclass != ActiveRecord::Base } #removing non models
    
    @models.each do |model|
      
      models << model
      
    end

    models.uniq # returning as array
    
  end


=begin

        get_all_plugins                  : public

        The method is responsible for defining all existing modules in current application

        returns modules as an array

=end

  def get_all_plugins

    plugin = []
    
    i = 0
    
    get_models.each do |model|

      unless get_relations(model).empty?
        
        plugin[i] =  get_relations(model) << model
        
        i = i + 1
      end
    end

    plugin = manipulated_array(plugin)

    plugin = manipulated_array(plugin)

    return plugin
    
  end

  #  @Params                               : Array
  #  @Returns                              : Array
  #  @Purpose                              : Returns array of arrays which are unique and compact

  def manipulated_array(arr)

    for i in 0..arr.length - 1
      for j in (i+1)..arr.length - 1
        unless arr[j].nil?

          if((arr[i]&arr[j]).any?)

            tmp = (arr[i] + arr[j]).uniq
            arr.delete(arr[j])
            arr[i] = tmp

          end

        end
      end

    end

    return arr
  end

=begin

        get_relations                  : public

        The method is responsible for defining a module based on the passed model and its association

        returns modules as an array

=end

  def get_relations model

    #the following line of code is actually deciding the module of the particular model associated
    
    m = model.constantize.reflect_on_all_associations.map{|mac| mac.class_name if mac.macro==:has_many || mac.macro == :has_and_belongs_to_many}.compact
   
    m
  end
  
end