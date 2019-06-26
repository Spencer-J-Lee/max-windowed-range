require 'rspec'
require '4_stack_queue'

describe StackQueue do
	subject(:stackqueue) { StackQueue.new }

	describe "#initialize" do
		it "instantiates two MyStack classes held in @in_stack and @out_stack" do
			expect(stackqueue.instance_variable_get(:@in_stack)).to be_kind_of(MyStack)
			expect(stackqueue.instance_variable_get(:@out_stack)).to be_kind_of(MyStack)
		end
	end

	describe "#enqueue" do
		it "adds the argument given onto the end of @in_stack" do
			stackqueue.enqueue("bottom")
			stackqueue.enqueue("top")
			in_stack = stackqueue.instance_variable_get(:@in_stack)
			expect(in_stack.instance_variable_get(:@store).last).to eq("top")
		end
	end

	describe "#dequeue" do
		it "removes the element on top of @out_stack" do
			stackqueue.enqueue("second")
			stackqueue.enqueue("first")
			stackqueue.dequeue
			out_stack = stackqueue.instance_variable_get(:@out_stack)
			expect(out_stack.instance_variable_get(:@store).first).to eq("first")
		end

		it "calls #transfer_queue when empty" do
			stackqueue.dequeue
			expect(stackqueue).to receive(:transfer_queue)

			stackqueue.enqueue("something")
			stackqueue.dequeue
			expect(stackqueue).to_not receive(:transfer_queue)
		end
	end

	describe "#transfer_queue" do
		it "pops all element of @in_stack onto @out_stack one by one" do
			stackqueue.enqueue("this gets popped off")
			stackqueue.enqueue(1)
			stackqueue.enqueue(2)
			stackqueue.enqueue(3)
			stackqueue.dequeue
			out_stack = stackqueue.instance_variable_get(:@out_stack)
			expect(out_stack.instance_variable_get(:@store)).to eq([3,2,1])
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
			stackqueue.enqueue("something")
			expect(stackqueue.empty?).to be(false)
		end
	end
end