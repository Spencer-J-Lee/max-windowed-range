require 'byebug'
require_relative '6_min_max_stack_queue'

def woke_max_windowed_range(arr, window_size)
	return nil if window_size > arr.length

	arr			  = arr.dup
	queue     = MinMaxStackQueue.new
	max_range = nil

	until arr.empty?
		queue.enqueue(arr.shift) until queue.size == window_size

		range = queue.max - queue.min

		max_range = range if max_range.nil? || range > max_range

		queue.dequeue
	end

	max_range
end