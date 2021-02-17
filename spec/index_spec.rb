require_relative "../index.rb"

include Enumerable

RSpec.describe Enumerable do
    # describe "#my_each" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_each_with_index" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_select" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_all?" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_any?" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_none?" do
    #     it "" do
        
    #     end
    # end
    # describe "#my_inject" do
    #     it "" do
        
    #     end
    # end

    describe "#my_each" do
        it "Returns every value according to the yield" do
            expect([1,2,3,4].my_each { |x| "The number is #{x}" }).to eql([1,2,3,4].each { |x| "The number is #{x}" })
        end
    end

    describe "#my_each_with_index" do
        it "" do
            expect([1,2,3,4].my_each_with_index { |val, index| "index: #{index} for #{val}" }).to eql([1,2,3,4].each_with_index { |val, index| "index: #{index} for #{val}" })
        end
    end

    describe "#my_count" do
        it "Returns the amount of values in the array" do
            expect([1,2,3,4].my_count).to eql([1,2,3,4].count)
        end

        it "Returns the amount of values that match the argument" do
            expect([1,2,3,2].count(2)).to eql([1,2,3,2].count(2))
        end

        it "Returns the amount of values that match the yield" do
            expect([1,2,3,2].my_count { |x| x%2 == 0 }).to eql([1,2,3,2].count { |x| x%2 == 0 })
        end
    end

    describe "#my_map" do
        it "Returns the array adding the value of the yield" do
            expect([1,2,3,4].my_map { |i| i*i }).to eql([1,2,3,4].map { |i| i*i })
        end
    end

    describe "#multiply_els" do
        it "Returns the multiplication of all elements like in my_inject" do
            expect(multiply_els([1,2,3,4])).to eql([1,2,3,4].inject { |a, b| a * b })
        end
    end




end