# definitions for logic gates
#
#   Author: Devon Finninger
#   Date:   2014-05-19

module Gates
  # - AND Definition
  ###################
  class And
    @@count = 0
    attr_accessor :input1, :input2, :output
    attr_reader   :value, :id
    def initialize(input1 = nil, input2 = nil, output = nil)
      @id     = "#{self.class.name}_#{self.object_id}"
      @input1 = input1
      @input2 = input2
      @output = output
      @value  = :unknown
      @@count += 1
    end
    
    def update
      if (@input1.value == @input2.value) and (@input1.value == :high)
        @value = :high
      else
        @value = :low
      end
      @output.update
    end
  end
  
  class Or
    @@count = 0
    attr_accessor :input1, :input2, :output
    attr_reader   :value, :id
    def initialize(input1 = nil, input2 = nil, output = nil)
      @id     = "#{self.class.name}_#{self.object_id}"
      @input1 = input1
      @input2 = input2
      @output = output
      @value  = :unknown
      @@count += 1
    end
    
    def update
      if (@input1.value == @input2.value) or (@input1.value == :high)
        @value = :high
      else
        @value = :low
      end
      @output.update
    end
  end
end