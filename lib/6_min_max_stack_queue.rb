require_relative '5_min_max_stack'

class MinMaxStackQueue
	def initialize
		@in_stack  = MinMaxStack.new
		@out_stack = MinMaxStack.new
	end

	def enqueue(value)
		@in_stack.push(value)
	end

	def dequeue
		transfer_queue if @out_stack.empty?

		@out_stack.pop
	end

	def max
		maxes = []
		maxes << @in_stack.max  unless @in_stack.empty?
		maxes << @out_stack.max unless @out_stack.empty?
		maxes.max
	end

	def min
		mins = []
		mins << @in_stack.min  unless @in_stack.empty?
		mins << @out_stack.min unless @out_stack.empty?
		mins.min 
	end

	def size
		@in_stack.size + @out_stack.size
	end

	def empty?
		@in_stack.empty? && @out_stack.empty?
	end

	def inspect
		{ in_stack:  @in_stack,
			out_stack: @out_stack }.inspect
	end
	
	private
	def transfer_queue
		@out_stack.push(@in_stack.pop) until @in_stack.empty?
	end
end