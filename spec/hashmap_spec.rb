require 'rspec'
require_relative '../TrevorsHashMap'

RSpec.describe TrevorsHashMap do

	context "initialize" do
		it "should initialize with the proper size" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.size).to eq(4)
		end

		it "should initialize with the proper current size" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.current_size).to eq(0)
		end

		it "should initialize with the proper number of buckets" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.num_buckets).to eq(1)
		end

		it "should initialize with the proper number of buckets" do
			@hash = TrevorsHashMap.new(5)
			expect(@hash.num_buckets).to eq(2)
		end

	end

	context "set" do
		it "should set and save values" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.set("trevor", 42)).to be true
		end

		it "should increment our current size" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			expect(@hash.current_size).to eq(1)
		end

		it "should not save more than the alotted size" do
			@hash = TrevorsHashMap.new(2)
			@hash.set("rick", 15)
			@hash.set("morty", 33)
			expect(@hash.set("trevor", 42)).to be false
		end
	end

	context "get" do
		it "should get a saved value" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			expect(@hash.get("trevor")).to eq(42)
		end

		it "should get nil if we're getting something that's not there" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.get("trevor")).to be_nil
		end
	end

	context "delete" do
		it "should delete a make sure it's not accessable" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			@hash.delete("trevor")
			expect(@hash.get("trevor")).to be_nil
		end

		it "should decrement our current size" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			expect(@hash.current_size).to eq(1)
			@hash.delete("trevor")
			expect(@hash.current_size).to eq(0)
		end

		it "should delete a value and return it's value" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			expect(@hash.delete("trevor")).to eq(42)
		end

		it "should return nil if there's nothing to delete" do
			@hash = TrevorsHashMap.new(4)
			expect(@hash.delete("trevor")).to be_nil
		end
	end

	context "load" do
		it "should give us an accurate load float" do
			@hash = TrevorsHashMap.new(4)
			@hash.set("trevor", 42)
			expect(@hash.load()).to eq(0.25)
		end
	end

end
