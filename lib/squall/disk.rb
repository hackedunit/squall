module Squall
  # OnApp Disk
  class Disk < Base
    
    # Returns list of all Disks in a VM
    def list(virtual_machine_id)
      req = request(:get, "/virtual_machines/#{virtual_machine_id}/disks.json")
      req.collect { |disk| disk['disk'] }
    end
  end
end