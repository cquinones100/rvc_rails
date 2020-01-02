module Rvc
  class Wrapper
    def initialize(method_name: nil, block:, base:)
      @method_name = method_name
      @block = block
      @render_elements = []
      @block_is_string = true
      @base = base
    end
  
    def to_s
      string = instance_eval(&@block)
  
      string = @render_elements.join('') if !@block_is_string
    
      if @method_name
        "<#{@method_name}>#{string}</#{@method_name}>"
      else
        string
      end
    end
    
    def method_missing(method_name, *args, &block)
      @block_is_string = false
    
      @render_elements << Wrapper.new(
        method_name: method_name,
        block: block,
        base: @base
      )
        .to_s
    end
  
    private
    
    attr_reader :base
  
    alias component base
  end
end