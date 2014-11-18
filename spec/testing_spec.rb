require "spec_helper"

class TestJob < Que::Job
  def run(a, b)
    a * b
  end
end

describe Que::Testing do
  after { TestJob.jobs.clear }

  it "stashes calls" do
    TestJob.jobs.count.must_equal 0
    TestJob.enqueue 1, 2
    TestJob.jobs.count.must_equal 1
    TestJob.jobs.first['args'].must_equal [1,2]
    TestJob.jobs.first.job_class.must_equal "TestJob"
    time = Time.now
    TestJob.enqueue 1, 2, run_at: time
    TestJob.jobs.last.run_at.must_equal time
  end

  it "responds empty for non-insert commands" do
    stats = Que.job_stats
    stats.must_be_empty
  end
end
