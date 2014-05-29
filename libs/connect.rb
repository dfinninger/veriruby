# module that connects wires together

module Connect
  def connect(input,output)
    input.output = output
    output.input = input
  end
end