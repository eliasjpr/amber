require "http"
require "./support/*"
require "./cookies/store"

# Defines a better cookie store for the request
# The cookies being read are the ones received along with the request,
# the cookies being written will be sent out with the response.
# Reading a cookie does not get the cookie object itself back, just the value it holds.
module Amber
  include Cookies
end
