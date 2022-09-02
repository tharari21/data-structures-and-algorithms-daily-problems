def median_of_two_sorted_arrays
    # This is my solution and it is O((n+m) * log(n+m)) - they want us to solve in O(log(n+m))
    
    # Adding two arrays in ruby is O(n+m) time - the reason for this is that
    # behind the scenes, arrays can only hold the number of items you give it.
    # If you want to add more items, ruby will need to copy all the elements into a new
    # memory location that can fit the extended array. So when you add two arrays together, 
    # ruby is copying the elements of both arrays into another location.
    # Ruby arrays are what's known as dynamic array - in languages like javascript and python the arrays are also dynamic
    # but if you were to use a lower level language like java (although there is also a dynamic array in java) or c++, 
    #you'd need to specify how many elements you want the array to have before you give it any elements and if you want more 
    # elements in that array, you'd need to copy all elements into a new array with a new size.

    #The sorting takes O(log(n+m)) since behind the scenes ruby uses quick sort algorithm which takes O(log(n+m))
    combined_array = (nums1+nums2).sort
    if combined_array.length % 2 == 0
        return (combined_array[(combined_array.length/2)-1].to_f + combined_array[(combined_array.length/2)].to_f) / 2
    else
        return combined_array[combined_array.length/2]
    end
end

def more_efficient_median_of_two_sorted_arrays(nums1,nums2)
    # Explained - https://www.youtube.com/watch?v=q6IEA26hvXc
    # O(log(n+m))
    x,y = nums1,nums2
    total = x.length + y.length
    half = total / 2
    # x is the smaller array
    if y.length < x.length
        x,y = y,x
        # temp = x
        # x = y
        # y = x
    end
    
    l = 0
    r = x.length-1

    # we return from this loop the median so it's fine to just say while true
    while true
        partition_x = (l+r) / 2
        partition_y = half - partition_x - 2 # half is not 0-indexed and neither is i so subtract 2

        # These can be out of bounds so we need to check
        left_x = partition_x > -1 ? x[partition_x] : -10000000.0
        left_y = partition_y > -1 ? y[partition_y] : -10000000.0
        right_x = partition_x+1 < x.length ? x[partition_x+1] : 10000000.0
        right_y = partition_y+1 < y.length ? y[partition_y+1] : 10000000.0
        
        # partition is correct
        if left_x <= right_y && left_y <= right_x
            # odd
            if total % 2 == 1
                return [right_x, right_y].min
            end
            return ([left_x,left_y].max.to_f + [right_x,right_y].min.to_f) / 2.0
            
        elsif left_x > right_y
            r = partition_x - 1
        else
            l = partition_x + 1
        end

    end


end

# def more_efficient_median_of_two_sorted_arrays(x,y)

# end