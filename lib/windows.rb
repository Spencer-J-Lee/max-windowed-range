system 'clear'
require 'byebug'


# O(n) linear time
def naive_max_windowed_range(arr, length)
	max_range = nil

	arr.each_index do |i|
		break if (i+length) > arr.length

		window = arr[i...i+length]
		range  = window.max - window.min

		max_range = range if max_range.nil? || range > max_range
	end

	max_range
end

class MyQueue
	def initialize
		@store = []
	end

	def enqueue(object)
		@store << object
	end

	def dequeue
		@store.shift
	end

	def peek
		@store.first
	end

	def size
		@store.size
	end

	def empty?
		@store.empty?
	end
end

class MyStack
end