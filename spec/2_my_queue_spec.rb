require 'rspec'
require '2_my_queue'

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