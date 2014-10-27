module Draftsman
  module Serializers
    module Hstore
      extend self # makes all instance methods become module methods as well

      def load(string)
        string
      end

      def dump(object)
        object
      end
    end
  end
end
