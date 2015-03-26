module ChefHelpers
  def self.symbolize_keys_deep!(h)
    Chef::Log.debug("#{h.inspect} is a hash with string keys, make them symbols")
    h.keys.each do |k|
      ks    = k.to_sym
      h[ks] = h.delete k
      symbolize_keys_deep! h[ks] if h[ks].kind_of? Hash
    end
  end
end

#
# Module for evaluating whether or not to execute a resource
# during compile phase. based on the attribute
# default['provisioner']['compile_time']
#
module ChefProvisioner
  module Timing

    def run_at_compile_time(&block)
      if compile_time?
        CompileTime.new(self).evaluate(&block)
      else
        instance_eval(&block)
      end
    end

    private

    #
    # Checks if the Resource should be evaluated
    # at compile time.
    # @return [true, false]
    #
    def compile_time?
      !!node['provisioner']['compile_time']
    end

    #
    # A class taken from Chef Sugar for evaluating a resource at
    # compile time in a block.
    #
    class CompileTime
      def initialize(recipe)
        @recipe = recipe
      end

      def evaluate(&block)
        instance_eval(&block)
      end

      def method_missing(m, *args, &block)
        resource = @recipe.send(m, *args, &block)
        if resource.is_a?(Chef::Resource)
          actions  = Array(resource.action)
          resource.action(:install)

          actions.each do |action|
            resource.run_action(action)
          end
        resource
        end
      end
    end
  end
end

# Include these into the
Chef::Recipe.send(:include, ChefProvisioner::Timing)