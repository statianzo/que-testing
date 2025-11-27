require_relative "job_params"

module Que
  module Testing
    class ConnectionPool < Que::ConnectionPool
      def checkout
        yield
      end

      def in_transaction?
        true
      end

      def execute(command, params = [])
        if command == :insert_job
          insert_job(params)

          params
        elsif command == :bulk_insert_jobs
          queue, priority, run_at, job_class, args_and_kwargs, data = params

          JSON.parse(args_and_kwargs).each do |hash|
            args, kwargs = hash.values_at("args", "kwargs").map { |x| JSON.dump(x) }

            insert_job([queue, priority, run_at, job_class, args, kwargs, data])
          end

          params
        else
          []
        end
      end

      private def insert_job(params)
        job = JobParams.new(*params)
        klass = class_for(job.job_class)
        jobs[klass] << job
      end

      private def class_for(str)
        str.split('::').reduce(Object, &:const_get)
      end

      def jobs
        @jobs ||= Hash.new { |h,k| h[k] = [] }
      end
    end
  end
end
