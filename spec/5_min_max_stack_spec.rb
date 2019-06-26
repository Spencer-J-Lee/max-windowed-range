require 'rspec'
require '5_min_max_stack'

describe MinMaxStack do
	subject(:minmaxstack) { MinMaxStack.new }

	describe "#initialize" do
		it "instantiates an empty array held in @store" do
			expect(minmaxstack.instance_variable_get(:@store)).to eq([])
		end
	end

	describe "#push" do
		it "adds an element onto the top of the stack" do
			minmaxstack.push("bottom")
			minmaxstack.push("top")
			expect(minmaxstack.instance_variable_get(:@store).last).to eq("top")
		end
	end

	describe "#pop" do
		it "removes an element from the top of the stack" do
			minmaxstack.push("bottom")
			minmaxstack.push("top")
			minmaxstack.pop
			expect(minmaxstack.instance_variable_get(:@store).last).to eq("bottom")
		end
	end

	describe "#max" do
		it "returns the maximum value in the stack" do
			minmaxstack.push(1)
			minmaxstack.push(2)
			minmaxstack.push(3)
			expect(minmaxstack.max).to eq(3)
		end
	end
	
	describe "#min" do
		it "returns the minimum value in the stack" do
			minmaxstack.push(1)
			minmaxstack.push(2)
			minmaxstack.push(3)
			expect(minmaxstack.min).to eq(1)
		end
	end

	describe "#peek" do
		before(:each) do
			minmaxstack.push("bottom")
			minmaxstack.push("top")
		end

		it "returns the element on top of the stack" do
			expect(minmaxstack.peek).to eq("top")
		end

		it "doesn't remove the element" do
			minmaxstack.peek
			expect(minmaxstack.instance_variable_get(:@store)).to include("top")
		end
	end

	describe "#size" do
		it "returns the size of the stack" do
			expect(minmaxstack.size).to eq(0)
			minmaxstack.push(1)
			minmaxstack.push(2)
			minmaxstack.push(3)
			expect(minmaxstack.size).to eq(3)
		end
	end

	describe "#empty?" do
		it "determines if the stack is empty or not" do
			expect(minmaxstack.empty?).to be(true)
			minmaxstack.push("something")
			expect(minmaxstack.empty?).to be(false)
		end
	end
end