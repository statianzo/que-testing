require "que"
require "que/testing/que_ext"
require "que/testing/adapter"
require "que/testing/version"

Que.adapter = Que::Testing::Adapter.new
