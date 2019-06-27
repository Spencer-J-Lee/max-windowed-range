require_relative '3_my_stack'

class MinMaxStack < MyStack
	def initialize
		@store = []
		@maxes = []
		@mins  = []
	end

	def push(value)
		@store << value

		return set_max_and_min(value) if @maxes.empty? && @mins.empty?

		@maxes << ( value > max ? value : max )
		@mins  << ( value < min ? value : min )
	end

	def pop
		[@maxes, @mins].each(&:pop)
		return @store.pop
	end

	def max
		@maxes.last
	end

	def min
		@mins.last
	end

	def empty?
		@store.empty?
	end

	private
	def set_max_and_min(value)
		@maxes << value
		@mins  << value
	end
end
