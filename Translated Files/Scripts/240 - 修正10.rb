class IO
  alias hima_write write
  def write(*a)
    hima_write(*a)
  rescue SystemCallError => e
    
  end
end
STDOUT.sync = true
