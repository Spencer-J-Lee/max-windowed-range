require 'rspec'
require 'windows'

describe 'naive_max_windowed_range' do
	subject(:arr) { [4,2,7,6,1] }
	let(:negative_arr) { [-4,-2,-7,-6,-1] }

	it "returns the max range of the given window length" do
		expect(naive_max_windowed_range(arr, 3)).to eq(6)
	end

	it "handles varying window lengths" do
		expect(naive_max_windowed_range(arr, 1)).to eq(0)
		expect(naive_max_windowed_range(arr, 2)).to eq(5)
		expect(naive_max_windowed_range(arr, 4)).to eq(6)
		expect(naive_max_windowed_range(arr, 5)).to eq(6)
	end

	it "handles an array of negative numbers" do
		expect(naive_max_windowed_range(negative_arr, 3)).to eq(6)
	end

	it "returns nil if length given is greater than arr length" do
		expect(naive_max_windowed_range(arr, 6)).to eq(nil)
	end
end

describe MyQueue do
	subject(:queue) { MyQueue.new }

	describe "#initialize" do
		it "instantiates an empty array held in @store" do
			expect(queue.instance_variable_get(:@store)).to be_empty
		end
	end
	
	describe "#enqueue" do
		it "adds an element to the end of @store" do
			queue.enqueue("first")
			queue.enqueue("second")
			store = queue.instance_variable_get(:@store)
			expect(store.last).to eq("second")
		end
	end

	describe "#dequeue" do
		before(:each) do
			queue.enqueue("front")
			queue.enqueue("front was removed")
		end

		it "removes an element from the front of @store" do
			queue.dequeue
			store = queue.instance_variable_get(:@store)
			expect(store.first).to eq("front was removed")
		end
	end

	describe "#peek" do
		before(:each) do
			queue.enqueue("front")
			queue.enqueue("not front")
		end

		it "returns the element at the front of the queue" do
			expect(queue.peek).to eq("front")
		end

		it "doesn't remove the element" do
			queue.peek

			store = queue.instance_variable_get(:@store)
			expect(store.first).to eq("front")
		end
	end

	describe "#size" do
		it "returns the size of @store" do
			queue.enqueue(1)
			queue.enqueue(2)
			queue.enqueue(3)
			expect(queue.size).to eq(3)
		end
	end

	describe "#empty?" do
		it "returns true if @store is empty" do
			expect(queue.empty?).to be(true)
		end

		it "returns false if @store is not empty" do
			queue.enqueue("something")
			expect(queue.empty?).to be(false)
		end
	end
end

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