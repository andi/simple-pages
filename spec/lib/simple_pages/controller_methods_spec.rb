require File.dirname(__FILE__) + '/../../spec_helper'

describe SimplePages::ControllerMethods do
  
  before(:each) do
    @controller = Class.new {include SimplePages::ControllerMethods}.new
  end
  
  describe 'inclusion of module' do
    it "should have the show_page action" do
      @controller.should respond_to(:show_page)
    end
  end
  
  describe 'show_page' do
    context 'without layout specified' do
      before(:each) do
        @controller.stub!(:params => {:page => 'my_page'})
      end
      it {@controller.should_receive(:render).with(:template => 'simple_pages/my_page')}
    end
    context 'with layout specified' do
      before(:each) do
        @controller.stub!(:params => {:page => 'my_page', :layout => 'my_layout'})
      end
      it {@controller.should_receive(:render).with(:template => 'simple_pages/my_page', :layout => 'my_layout')}
    end
    after(:each) do
      @controller.show_page
    end
  end
  
end