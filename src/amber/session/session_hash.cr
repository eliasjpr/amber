module Session
  class SessionHash
    property changed = false

    @store : Hash(String, String)
    forward_missing_to @store

    def initialize(pull : JSON::PullParser)
      @store = Hash(String, String).new(pull)
    end

    def initialize
      @store = {} of String => String
    end

    def []=(key : String | Symbol, value)
      if @changed |= (value != @store.fetch(key.to_s, nil))
        if value.nil?
          @store.delete(key)
        else
          @store[key.to_s] = value.to_s
        end
      end
    end

    def []?(key : Symbol)
      @store[key.to_s]?
    end

    def [](key)
      @store.fetch(key.to_s, nil)
    end

    def delete(key)
      @changed = true
      @store.delete(key.to_s)
    end
  end
end
