module Cookies
  class JsonSerializer
    def self.load(value)
      JSON.parse(value)
    end

    def self.dump(value)
      value.to_json
    end
  end
end
