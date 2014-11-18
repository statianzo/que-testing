module Que
  class Job
    def self.jobs
      @jobs ||= []
    end
  end
end
