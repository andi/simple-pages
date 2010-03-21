require File.dirname(__FILE__) + '/../spec_helper'

describe SimplePages do
  
  describe 'self.add_route' do
    before(:each) do
      @map = stub :map
    end
    it "should call route_name on map with correct params" do
      @map.should_receive('pages').with("pages/:page", :controller => 'simple_pages', :action => 'show_page')
    end
    after(:each) do
      SimplePages.add_route(@map, 'pages')
    end
  end
  
  
  def self.add_route(map, route_name)
    map.send(route_name, "#{route_name}/:page", :controller => 'simple_pages', :action => 'show_page')
  end
  
  
end