require 'simple_pages/controller_methods'

module SimplePages
  
  def self.add_route(map, route_name)
    map.send(route_name, "#{route_name}/:page", :controller => 'simple_pages', :action => 'show_page')
  end
  
end