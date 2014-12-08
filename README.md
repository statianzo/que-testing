# que-testing [![Build Status](https://travis-ci.org/statianzo/que-testing.svg?branch=master)](https://travis-ci.org/statianzo/que-testing)

Testing support for the [Que](https://github.com/chanks/que) queue. que-testing allows you to enqueue jobs without a database, and without synchronous running.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'que-testing', :require => false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install que-testing

## Usage

In your test, `require 'que/testing'` and enqueue jobs as normal. Jobs are
stored under a `MyJob.jobs` array. Because they're static, the stored jobs
should be cleared between test runs.

```ruby
require "que/testing"

describe "Testing" do
  after { MyJob.jobs.clear }

  it "Stores a job" do
    MyJob.enqueue("foo")

    js = MyJob.jobs
    js.length.must_equal 1
    js.first["args"].must_equal ["foo"]
    js.first["job_class"].must_equal "MyJob"
  end
end
```
