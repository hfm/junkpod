#!/usr/bin/env ruby

require 'facter'

interfaces = Facter.value(:interfaces).split(",")

ips = []
interfaces.each do |interface|
  ip = Facter.value("ipaddress_#{interface}".to_sym)
  ips << ip if ip != nil
end

# private ip address except for 127.0.0.1
#   ^10\.
#   ^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-1]\.
#   ^192\.168\.
ips.each do |ip|
  ip if ip.match(/^10\.|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-1]\.|^192\.168\./) != nil
end
