require 'rspec'
require '3_my_stack'

describe MyStack do
	subject(:stack) { MyStack.new }

	describe "#initialize" do
		it "instantiates an empty array held in @store" do
			expect(stack.instance_variable_get(:@store)).to eq([])
		end
	end

	describe "#push" do
		it "adds an element to the top of the stack" do
			stack.push("bottom")
			stack.push("top")
			expect(stack.instance_variable_get(:@store).last).to eq("top")
		end
	end

	describe "#pop" do
		it "removes an element from the top of the stack" do
			stack.push("bottom")
			stack.push("top")
			stack.pop
			expect(stack.instance_variable_get(:@store).last).to eq("bottom")
		end
	end

	describe "#peek" do
		before(:each) do
			stack.push("bottom")
			stack.push("top")
		end

		it "returns the element at the top of the stack" do
			expect(stack.peek).to eq("top")
		end

		it "doesn't remove the element" do
			stack.peek
			expect(stack.instance_variable_get(:@store)).to include("top")
		end
	end

	describe "#size" do
		it "returns the size of the stack" do
			stack.push(1)
			stack.push(2)
			stack.push(3)
			expect(stack.size).to eq(3)
		end
	end

	describe "#empty?" do
		it "returns true if the stack is empty" do
			expect(stack.empty?).to be(true)
		end

		it "returns false if the stack is not empty" do
			stack.push("something")
			expect(stack.empty?).to be(false)
		end
	end
end