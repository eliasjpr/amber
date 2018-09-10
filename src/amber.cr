require "http"
require "logger"
require "json"
require "colorize"
require "random/secure"
require "kilt"
require "kilt/slang"
require "redis"
require "environment"

require "./amber/controller"
require "./amber/version"
require "./amber/cookies"
require "./amber/session"
require "./amber/context"

require "./amber/dsl/**"
require "./amber/pipes/**"
require "./amber/exceptions/**"
require "./amber/extensions/**"
require "./amber/websockets/**"

require "./amber/server"

module Amber
  include Environment
end
