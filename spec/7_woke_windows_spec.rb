require 'rspec'
require '7_woke_windows'

describe 'woke_max_windowed_range' do
	subject(:arr) { [4,2,7,6,1] }
	let(:negative_arr) { [-4,-2,-7,-6,-1] }

	it "returns the max range of the given window length" do
		expect(woke_max_windowed_range(arr, 3)).to eq(6)
	end

	it "handles varying window lengths" do
		expect(woke_max_windowed_range(arr, 1)).to eq(0)
		expect(woke_max_windowed_range(arr, 2)).to eq(5)
		expect(woke_max_windowed_range(arr, 4)).to eq(6)
		expect(woke_max_windowed_range(arr, 5)).to eq(6)
	end

	it "handles an array of negative numbers" do
		expect(woke_max_windowed_range(negative_arr, 3)).to eq(6)
	end

	it "returns nil if length given is greater than arr length" do
		expect(woke_max_windowed_range(arr, 6)).to eq(nil)
	end
end