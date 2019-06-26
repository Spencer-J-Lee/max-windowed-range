require_relative '3_my_stack'

class StackQueue
	def initialize
		@in_stack  = MyStack.new
		@out_stack = MyStack.new
	end

	def enqueue(object)
		@in_stack.push(object)
	end

	def dequeue
		transfer_queue if @out_stack.empty?

		@out_stack.pop
	end

	def size
		@in_stack.size + @out_stack.size
	end

	def empty?
		@in_stack.empty? && @out_stack.empty?
	end

	private
	def transfer_queue
		@out_stack.push(@in_stack.pop) until @in_stack.empty?
	end
end