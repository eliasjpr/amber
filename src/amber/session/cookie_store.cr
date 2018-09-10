require "./session_hash"

module Session
  include Cookies

  class CookieStore < AbstractStore
    property key : String
    property expires : Int32
    property store : Cookies::SignedAndEncrypted
    property session : SessionHash

    forward_missing_to session

    def self.build(store, settings)
      new(store, settings[:key].to_s, settings[:expires].to_i)
    end

    def initialize(@store, @key, @expires)
      @session = current_session
    end

    def id
      session["id"] ||= UUID.random.to_s
    end

    def changed?
      session.changed
    end

    def destroy
      session.clear
    end

    def update(hash : Hash(String | Symbol, String))
      hash.each { |key, value| session[key.to_s] = value }
      session
    end

    def set_session
      store.set(key, session.to_json, expires: expires_at, http_only: true)
    end

    def expires_at
      Time.now + expires.seconds if @expires > 0
    end

    def current_session
      SessionHash.from_json(store[key] || "{}")
    rescue e : JSON::ParseException
      SessionHash.new
    end
  end
end
