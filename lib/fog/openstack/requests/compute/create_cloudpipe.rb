module Fog
  module Compute
    class OpenStack
      class Real
        def create_cloudpipe(project_id)
          data = {
            'cloudpipe' => {
              'project_id'  => project_id,
            }
          }
          request(
            :body     => MultiJson.encode(data),
            :expects  => [200, 202],
            :method   => 'POST',
            :path     => '/os-cloudpipe'
          )
        end
      end

      class Mock

        def create_cloudpipe(project_id)
          response = Excon::Response.new
          response.status = [200, 203][rand(1)]
          response.body = { 'instance_id' => "1257ef1b-d6e4-4369-a9ac-96fbc7df6005" }
          response 
        end
      end
    end
  end
end
