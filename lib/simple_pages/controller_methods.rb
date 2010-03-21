module SimplePages
  
  module ControllerMethods
  
    def self.included(base)
      base.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods
    
      def show_page
        target = params[:page]
        render_options = {:template => "simple_pages/#{target.to_s}"}
        render_options[:layout] = params[:layout] if params[:layout]
        render(render_options)
      end
        
    end

  end

end