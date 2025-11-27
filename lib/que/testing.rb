require "que"
require "que/testing/que_ext"
require "que/testing/connection_pool"
require "que/testing/version"

Que.pool = Que::Testing::ConnectionPool.new
