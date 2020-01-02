require 'rvc_rails/wrapper'

module Rvc
  class Component
    private

    def return_render(&block)
      Wrapper.new(base: self, block: block).to_s
    end
  end
end