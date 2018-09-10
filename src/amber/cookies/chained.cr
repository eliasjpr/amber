module Cookies
  module Chained
    def permanent
      @permanent ||= Permanent.new(self)
    end

    def encrypted
      @encrypted ||= Encrypted.new(self, @secret)
    end

    def signed
      @signed ||= Signed.new(self, @secret)
    end
  end
end
