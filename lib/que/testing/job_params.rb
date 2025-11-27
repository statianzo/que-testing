module Que
  module Testing
    if Que::VERSION >= Gem::Version.new("2")
      # kwargs added in Que 2.0.0
      class JobParams < Struct.new(:queue, :priority, :run_at, :job_class, :args, :kwargs, :data)
        def args
          Que.deserialize_json(super)
        end

        def kwargs
          Que.deserialize_json(super)
        end

        def data
          Que.deserialize_json(super)
        end
      end
    else
      class JobParams < Struct.new(:queue, :priority, :run_at, :job_class, :args, :data)
        def args
          Que.deserialize_json(super)
        end

        def data
          Que.deserialize_json(super)
        end
      end
    end
  end
end
