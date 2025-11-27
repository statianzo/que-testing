module Que
  class Job
    def self.jobs
      Que.pool.jobs[self]
    end
  end
end
