#!/usr/bin/ruby
# iBeacon Scan by Radius Networks

require 'pty'
interrupted = nil
`sudo hciconfig hci0 reset`

fork do
  loop do
  # `sudo hcitool lescan --duplicates 1>/dev/null`
   `sudo hciconfig hci0 reset`
  # sleep 0.5
    scan_pid = Process.spawn("sudo hcitool lescan --duplicates 1>/dev/null")#2>/dev/null")
    sleep 10
    #puts "About to kill scan process #{scan_pid} inside the loop"
    `sudo kill #{scan_pid}`
#    sleep 1
#  trap("INT") { puts "Trapped inside loop, exiting now" ; exit }
  end
#trap("INT") { puts "Trapped inside loop, exiting now" ; exit }
end

#scan_pid = Process.spawn("sudo hcitool lescan --duplicates 1>/dev/null")
#trap("INT") { `kill #{pid}` ; exit }
#trap("INT") { exit }
cmd = "sudo hcidump --raw" 
begin 
  PTY.spawn( cmd ) do |stdin, stdout, pid|
    begin
      trap("INT") { `sudo kill #{pid}` ; exit } #puts "Trapped, about to kill scan pid: #{@scan_pid} and dump pid: #{pid}" ; `sudo kill #{@scan_pid}` ; exit }
      packet = nil
      capturing = nil
      stdin.each do |line|
	line = line.gsub(/\s*$/, '')
        if capturing
          if line =~ /^  [0-9a-fA-F]{2} [0-9a-fA-F]{2}/
            line = line.gsub(/^\s(.*)$/, '\1')
            packet << "#{line}"
          else 
            if packet =~ /^04 3E 2A 02 01 .{26} 02 01 .{14} 02 15/
              uuid = packet.gsub(/^.{69}(.{47}).*$/, '\1').gsub(/\s+/, '').gsub(/^(.{8})(.{4})(.{4})(.{4})(.{12})$/, '\1-\2-\3-\4-\5')
              major = packet.gsub(/^.{117}(.{5}).*$/, '\1').gsub(/\s+/, '').to_i(16)
              minor = packet.gsub(/^.{123}(.{5}).*$/, '\1').gsub(/\s+/, '').to_i(16)
              power = packet.gsub(/^.{129}(.{2}).*$/, '\1').to_i(16) - 256  
              if ARGV[0] == "-b"
                puts "#{uuid} #{major} #{minor} #{power}"
              else
                puts "UUID: #{uuid} MAJOR: #{major} MINOR: #{minor} POWER: #{power}"
              end
	      STDOUT.flush
            end
            capturing = nil
            packet = nil
          end
        else
          if line =~ /^> /
            packet = line.gsub(/^> (.*$)/, '\1')
            capturing = true
          end
        end
      end
    rescue Errno::EIO
#      puts "Errno:EIO error, but this probably just means " +
#            "that the process has finished giving output"
    end
  end
rescue PTY::ChildExited
#  puts "The child process exited!"
end
