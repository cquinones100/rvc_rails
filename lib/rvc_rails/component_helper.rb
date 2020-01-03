module Rvc
  module ComponentHelper
    COMPONENT_PATH = './app/components'.freeze

    COMPONENT_PATHS = Dir["#{COMPONENT_PATH}/**/*.rb"]

    COMPONENT_PATHS.each do |path|
      name = path.split('/').last.gsub('.rb', '').camelcase

      define_method(name) do
        klass = name.constantize

        render inline: klass.new.render
      end
    end
  end
end