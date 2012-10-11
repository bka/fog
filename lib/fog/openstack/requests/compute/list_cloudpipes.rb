module Fog
  module Compute
    class OpenStack
      class Real
        def list_cloudpipes
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => 'os-cloudpipe.json'
          )
        end
      end

      class Mock
        def list_cloudpipes
          cloudpipes = []
          cloudpipes << {
            "internal_ip"=>"10.0.34.2", 
            "created_at"=>"2012-10-08T13:55:06Z", 
            "project_id"=>"808ce97c821244b9a573203d2a585c56", 
            "instance_id"=>"04a268d8-5c35-4103-8155-010c2f3e34b9", 
            "public_port"=>1194, 
            "public_ip"=>"91.202.41.156", 
            "state"=>"running"            
          }

          response = Excon::Response.new
          response.status = [200, 203][rand(1)]
          response.body = { 'cloudpipes' => cloudpipes }
          response 
        end
      end
    end
  end
end
