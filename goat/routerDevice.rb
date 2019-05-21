require 'socket'

# the virtual device.
class Device
  attr_accessor :id, :socket, :hostname, :port

  # new
  def initialize(id, hostname = 'localhost', port = 8888)
    @id = id
    @hostname = hostname
    @port = port
    @socket = TCPSocket.open(hostname, port)
  end

  # generate the data
  def normal_data
    # "*D##{@id}##{(Time.now.to_f*1000).to_i}#56#78#1#1300#28#67#19#0"
    "*D##{@id}##{(Time.now.to_f*1000).to_i}##{rand(80)}##{rand(80)}#1#1300#28#67#19#0"
  end

  # event data
  def event_data
    "*C##{@id}##{(Time.now.to_f*1000).to_i}##{rand(0..3)}#SC0001"
  end

  # send
  def send_data(str)
    @socket.puts str
  end

  def open_socket
    @socket.open(@hostname, @port)
  end

  def close_socket
    @socket.close
  end

end
