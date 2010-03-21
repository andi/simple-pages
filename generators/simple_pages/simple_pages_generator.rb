class SimplePagesGenerator < Rails::Generator::Base

  def manifest

    if options[:add_route]
      add_to_file "config/routes.rb", "ActionController::Routing::Routes.draw do |map|", "\n  SimplePages.add_route(map, '#{route_name}')\n"
    end
    
    record do |m|
      m.directory         File.join(%w(app controllers))
      m.directory         File.join(%w(app views simple_pages))
      m.file "simple_pages_controller.rb", File.join(%w(app controllers simple_pages_controller.rb))
    end
  end
  
  protected
  
  def add_to_file(filename, after_line, new_line)
    filename = File.join(RAILS_ROOT, filename)
    src = File.read filename
    unless src.include? new_line
      src.sub!(after_line, after_line + "\n" + new_line)
      File.open(filename, 'w') {|f| f.write(src) }
    end
  end
  
  def banner
    "Usage: #{$0} #{spec.name} [--add-route] [--route-name NAME]"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--add-route",
           "Add simple-pages route to config/routes.rb") { |v| options[:add_route] = v }
    opt.on("--route-name NAME ",
           "name for the simple-pages route in config/routes.rb") { |v| options[:route_name] = v }
  end
  
  def route_name
    options[:route_name] || "pages"
  end
  
  
end




