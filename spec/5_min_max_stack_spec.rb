require 'rspec'
require '5_min_max_stack'

describe MinMaxStack do
	subject(:minmaxstack) { MinMaxStack.new }

	describe "#initialize" do
		it "instantiates empty arrays held in @store, @maxes, and @mins" do
			expect(minmaxstack.instance_variable_get(:@store)).to eq([])
			expect(minmaxstack.instance_variable_get(:@maxes)).to eq([])
			expect(minmaxstack.instance_variable_get(:@mins)).to eq([])
		end
	end

	describe "#push" do
		it "adds an element onto the top of the stack" do
			minmaxstack.push(1)
			minmaxstack.push(2)
			expect(minmaxstack.instance_variable_get(:@store).last).to eq(2)
		end
	end

	let(:minmaxstack_123) do
		minmaxstack.push(1)
		minmaxstack.push(2)
		minmaxstack.push(3)
		minmaxstack
	end

	describe "#pop" do
		it "removes an element from the top of the stack" do
			minmaxstack_123.pop
			expect(minmaxstack_123.instance_variable_get(:@store).last).to eq(2)
		end
	end

	describe "#max" do
		it "returns the maximum value in the stack" do
			expect(minmaxstack_123.max).to eq(3)
		end
	end
	
	describe "#min" do
		it "returns the minimum value in the stack" do
			expect(minmaxstack_123.min).to eq(1)
		end
	end

	describe "#peek" do
		it "returns the element on top of the stack" do
			expect(minmaxstack_123.peek).to eq(3)
		end

		it "doesn't remove the element" do
			minmaxstack_123.peek
			expect(minmaxstack_123.instance_variable_get(:@store)).to include(2)
		end
	end

	describe "#size" do
		it "returns the size of the stack" do
			expect(minmaxstack_123.size).to eq(3)
			minmaxstack_123.pop
			minmaxstack_123.pop
			minmaxstack_123.pop
			expect(minmaxstack_123.size).to eq(0)
		end
	end

	describe "#empty?" do
		it "determines if the stack is empty or not" do
			expect(minmaxstack_123.empty?).to be(false)
			minmaxstack_123.pop
			minmaxstack_123.pop
			minmaxstack_123.pop
			expect(minmaxstack_123.empty?).to be(true)
		end
	end
end