class MyStack
	def initialize
		@store = []
	end

	def push(object)
		@store << object
	end

	def pop
		@store.pop
	end

	def peek
		@store.last
	end

	def size
		@store.size
	end

	def empty?
		@store.empty?
	end
end