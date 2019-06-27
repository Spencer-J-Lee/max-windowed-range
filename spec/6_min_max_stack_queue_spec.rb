require 'rspec'
require '6_min_max_stack_queue'

describe MinMaxStackQueue do
	subject(:stackqueue) { MinMaxStackQueue.new }

	describe "#initialize" do
		it "instantiates two MinMaxStack classes held in @in_stack and @out_stack" do
			expect(stackqueue.instance_variable_get(:@in_stack)).to be_kind_of(MinMaxStack)
			expect(stackqueue.instance_variable_get(:@out_stack)).to be_kind_of(MinMaxStack)
		end
	end

	describe "#enqueue" do
		it "adds the argument given onto the end of @in_stack" do
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			in_stack = stackqueue.instance_variable_get(:@in_stack)
			expect(in_stack.instance_variable_get(:@store).last).to eq(2)
		end
	end

	describe "#dequeue" do
		it "removes the element on top of @out_stack" do
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.dequeue
			out_stack = stackqueue.instance_variable_get(:@out_stack)
			expect(out_stack.instance_variable_get(:@store).first).to eq(2)
		end

		it "calls #transfer_queue when empty" do
			stackqueue.dequeue
			expect(stackqueue).to receive(:transfer_queue)

			stackqueue.enqueue(1)
			stackqueue.dequeue
			expect(stackqueue).to_not receive(:transfer_queue)
		end
	end

	describe "#transfer_queue" do
		it "pops all element of @in_stack onto @out_stack one by one" do
			stackqueue.enqueue(0) # this gets popped off
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.enqueue(3)
			stackqueue.dequeue
			out_stack = stackqueue.instance_variable_get(:@out_stack)
			expect(out_stack.instance_variable_get(:@store)).to eq([3,2,1])
		end
	end

	describe "#max" do
		it "returns the maximum value between @in_stack and @out_stack" do
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.enqueue(3)
			expect(stackqueue.max).to eq(3)
		end

		it "returns nil if @in_stock and @out_stock are empty" do
			expect(stackqueue.max).to be(nil)
		end
	end

	describe "#min" do
		it "returns the minimum value between @in_stack and @out_stack" do
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.enqueue(3)
			expect(stackqueue.min).to eq(1)
		end
		
		it "returns nil if @in_stock and @out_stock are empty" do
			expect(stackqueue.max).to be(nil)
		end
	end

	describe "#size" do
		it "returns the size of @in_stock and @out_stock combined" do
			expect(stackqueue.size).to eq(0)
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.enqueue(3)
			expect(stackqueue.size).to eq(3)
		end
	end

	describe "#empty?" do
		it "returns true if both @in_stock and @out_stock are empty" do
			expect(stackqueue.empty?).to be(true)
		end
		
		it "returns false if either @in_stock or @out_stock are not empty" do
			stackqueue.enqueue(1)
			expect(stackqueue.empty?).to be(false)
		end
	end
end