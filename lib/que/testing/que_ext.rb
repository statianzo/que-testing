module Que
  class Job
    def self.jobs
      Que.adapter.jobs[self]
    end
  end
end
