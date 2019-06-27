require 'byebug'
require_relative '6_min_max_stack_queue'

def woke_max_windowed_range(nums_arr, window_size)
	queue			 = MinMaxStackQueue.new
	best_range = nil

	nums_arr.each do |num|
		queue.enqueue(num)
		queue.dequeue if queue.size > window_size

		if queue.size == window_size
			range 		 = queue.max - queue.min
			best_range = range if !best_range || range > best_range
		end
	end

	best_range
end