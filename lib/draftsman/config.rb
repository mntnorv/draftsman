require 'singleton'

module Draftsman
  class Config
    include Singleton
    attr_accessor :serializer, :timestamp_field
    attr_reader :serialized_attributes

    def initialize
      @timestamp_field = :created_at
      @serializer      = Draftsman::Serializers::Yaml

      # This setting only defaults to false on AR 4.2+, because that's when
      # it was deprecated. We want it to function with older versions of
      # ActiveRecord by default.
      if ::ActiveRecord::VERSION::STRING < '4.2'
        @serialized_attributes = true
      end
    end

    def serialized_attributes=(value)
      if ::ActiveRecord::VERSION::MAJOR >= 5
        warn("DEPRECATED: ActiveRecord 5.0 deprecated `serialized_attributes` "  +
          "without replacement, so this Draftsman config setting does " +
          "nothing with this version, and is always turned off")
      end
      @serialized_attributes = value
    end
  end
end
