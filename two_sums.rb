# Day One

def two_sum(nums, target)
#     O(n) - This way is more efficient since we iterate once
    ## hash to store what we've seen so far
    seen = {}
    ## iterate over nums
    nums.each_with_index do |num, index|
        ## subtract target minus current num to see what number we need that will add to target
        search_item = target-num
        ## Check if we've seen that number
        if (seen.key?(search_item))
            # return the index of that number if we saw it
             return [seen[search_item], index]
        end
        ## add current num to seen
        seen[num] = index
    end
    
    
    # O(n^2) - This way is slower since we must iterate over element for each element
    
    # # iterate over each item in nums
    # nums.each_with_index do |value, i|
        # # iterate from i + 1 til the end of the array
    #     ((i+1)..(nums.length-1)).each do |j|
            # # if value (which is the same as nums[i]) == nums[j] then return the two indices i and j
    #         return [i,j] if value+nums[j] == target
    #     end
    # end
end

