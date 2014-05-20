# definitions for logic primitives
#
#   Author: Devon Finninger
#   Date:   2014-05-19

require_relative 'exceptions'

module Primitives
  # - Wire Definition
  ####################
  class Wire
    @@count = 0
    attr_accessor :input, :output
    attr_reader   :value, :id
    
    def initialize(input = nil, output = nil)
      @id     = "#{self.class.name}_#{self.object_id}"
      @input  = input
      @output = output
      @value  = :unknown
      @@count += 1
    end
    
    def update
      if [:high,:low,:float,:unknown].include?(@input.value)
        @value = @input.value
        @output.update if @output
      else
        raise IllegalLogicValue, "Value of '#{@input.value}' from '#{@input.id}' is unrecognized"
      end
    end
  end
  
  # - Register Definition
  ########################
  class Reg
    @@count = 0
    attr_accessor :output
    attr_reader   :value, :id
    
    def initialize(output = nil, value = :unknown)
      @id     = "#{self.class.name}_#{self.object_id}"
      @output = output
      @value  = value
      @@count += 1
    end
    
    def value=(new_val)
      if [:high,:low,:float,:unknown].include?(new_val)
        @value = new_val
        @output.update if @output
      else
        raise IllegalLogicValue, "Value of '#{new_val}' is unrecognized"
      end
    end
  end
end


















