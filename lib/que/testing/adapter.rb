module Que
  module Testing
    class JobParams < Struct.new(:queue, :priority, :run_at, :job_class, :args)
    end

    class Adapter
      def checkout(&block)
      end

      def execute(command, params = [])
        return [] unless command == :insert_job

        job = JobParams.new(*params)
        klass = class_for(job.job_class)
        klass.jobs << job
        params
      end

      def wake_worker_after_commit
        false
      end

      def class_for(str)
        str.split('::').reduce(Object, &:const_get)
      end
    end
  end
end
