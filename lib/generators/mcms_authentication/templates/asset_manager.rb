=begin

  @File Name                            :asset_manager.rb

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-06-04

  @Date Modified                        :2012-06-15

  @Last Modification Details            :Making it as mcms project standard

  @Purpose                              :Dynamically include assets

=end

class AssetManager

  #Class methods start here

  #include_css
  #checking the file type if array then loop to include neither simple includes
  def self.include_css file
    if file.class == Array
      file.each do |f|
        include_css_file_individual f
      end
    else
      include_css_file_individual file
    end
  end

  #include_contrib_library
  #includes the javascripts in contrib folder those are the mandatory libraries
  def self.include_contrib_library library
    include_js_library library, :contrib
  end


  #include_local_library method
  #includes the javascripts those are localy added
  def self.include_local_library library
    include_js_library library, :local
  end

  #include_js_library method
  #includes the javascripts those are localy added
  def self.include_js_library library, type = :local
    Rails.logger.debug library.inspect
    if library.class == Array
      library.each do |l|
        include_js_library_individual l, type
      end
    else
      include_js_library_individual library, type
    end
  end


  #get_libraries method
  #return all javscripts included array
  def self.get_libraries
    return @@js_includes
  end

  #get_css method
  #return css_includes array
  #gloabal varibale
  def self.get_css
    return @@css_includes
  end

  #Private methods started here
  private
  @@js_includes = []
  @@css_includes = []

  #Pushing javascript libraries in the gloabal @@js_includes variable
  def self.include_js_library_individual library, type

    file = ""

    case type
      when :local
        if library.class == Symbol
          file = library.to_s + ".js"
        else
          file = library
        end
      when :contrib
        file = "contrib/" + @@libraries[library]
    end

    @@js_includes << file unless file.blank? or @@js_includes.include? file

  end

#pushing individual css files
  def self.include_css_file_individual file

    if file.class == Symbol
      file = file.to_s + '.css'
    end

    @@css_includes << file  unless file.blank? or @@css_includes.include? file
  end

#Registering javascript libraries
  @@libraries = {
    :core_ui            => "ui.core.js",
    :jquery_widget      => "ui.widget.js",
    :jquery_tab         => "ui.tabs.js"
  }

end
