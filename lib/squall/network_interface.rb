module Squall
  # OnApp Network Interfaces
  class NetworkInterface < Base

    # Returns a list of all Network Interfaces in a VirtualMachine
    def list(virtual_machine_id)
      req = request(:get, "/virtual_machines/#{virtual_machine_id}/network_interfaces.json")
      req.collect { |nw| nw['network_interface'] }
    end
    
    # Add a new Network Interface to a VirtualMachine
    def create(virtual_machine_id, options = {})
      params.required(:label, :network_join_id, :rate_limit).validate!(options)
      req = request(:post, "/virtual_machines/#{virtual_machine_id}/network_interfaces.json", default_params(options))
      req.first[1]
    end
    
    # Get a list of all free IP addresses for a Network Intrerface
    def unassigned_ip_addresses(network_interface_id)
      req = request(:get, "/network_interfaces/#{network_interface_id}/ip_addresses.json?used_ip=no")
      req.collect { |ip| ip }
    end
  end
end