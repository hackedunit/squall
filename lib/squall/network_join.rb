module Squall
  # OnApp Network Joins
  class NetworkJoin < Base

    # Returns a list of all Network Joins in a Hypervisor
    def list(hypervisor_id)
      req = request(:get, "/settings/hypervisors/#{hypervisor_id}/network_joins.json")
      req.collect { |nw| nw['network_join'] }
    end
  end
end