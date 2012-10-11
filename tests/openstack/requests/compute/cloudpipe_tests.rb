Shindo.tests('Fog::Compute[:openstack] | cloudpipe requests', ['openstack']) do

  @tenant_id = "t3n4nt1d"

  @cloudpipe_format = {
     'internal_ip'=>String, 
     'created_at'=>String, 
     'project_id'=>String, 
     'instance_id'=>String, 
     'public_port'=>Integer, 
     'public_ip'=>String, 
     'state'=>String            
  }

  tests('success') do
    tests('#list_cloudpipes').formats({'cloudpipes' => [@cloudpipe_format]}, false) do
      Fog::Compute[:openstack].list_cloudpipes.body
  	end

    tests("#create_cloudpipe('#{@tenant_id}')").formats({'instance_id' => String}, false) do
      Fog::Compute[:openstack].create_cloudpipe(@tenant_id).body
  	end
  end
end