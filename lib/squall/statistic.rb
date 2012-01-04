module Squall
  # OnApp Statistic
  class Statistic < Base
    # Returns statitics for a given VirtualMachine
    def daily_stats(id)
      response = request(:get, "/usage_statistics.json")
      response.first['vm_hourly_stat']
    end
    
    # Returns CPU usage statitics for a given VirtualMachine
    def cpu_usage(id, from = nil, to = nil)
      response = request(:get, "/virtual_machines/#{id}/cpu_usage.json?from=#{from}&till=#{to}")
      response.collect {|r| r['cpu_hourly_stat']}
    end
    
    # Returns network usage statitics for a given Network Interface
    def network_usage(id, network_interface_id, from = nil, to = nil)
      response = request(:get, "/virtual_machines/#{id}/network_interfaces/#{network_interface_id}/usage.json?from=#{from}&till=#{to}")
      response.collect {|r| r['net_hourly_stat']}
    end
  end
end
