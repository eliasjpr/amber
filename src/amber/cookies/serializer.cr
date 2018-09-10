module Cookies
  module Serializer
    protected def serialize(value)
      serializer.dump(value)
    end

    protected def deserialize(value)
      serializer.load(value).to_s
    end

    protected def serializer
      JsonSerializer
    end

    protected def digest
      :sha256
    end
  end
end
