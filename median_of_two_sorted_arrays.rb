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
    if y.length < x.length
        x,y = y,x
    end
    total = x.length + y.length
    # partition x + partition y must add up to half
    half = total / 2

    l,r = 0, x.length-1
    while true
        # px + py must eqal half
        # partition x - the smaller array
        px = (l+r) / 2
        # partition y - the larger array. We need px+py to equal to half
        py = half - px - 2

        # get elements to left of px - if we are out of bounds then let's call it a really small number
        lx = px > -1 ? x[px] : -1000000000.0
        ly = py > -1 ? y[py] : -1000000000.0
        # get elements to right of px - if we are out of bounds then let's call it a really large number
        rx = px + 1 < x.length ? x[px+1] : 1000000000.0
        ry = py + 1 < y.length ? y[py+1] : 1000000000.0

        # if element to the left of px is smaller than element to right of py
        # and element to the left of py is smaller than element to right of px
        if lx <= ry && ly <= rx
            # Partitions are in the right place, find median
            if total % 2 == 1
                return [rx,ry].min
            return ([lx,ly].max.to_f + [rx,ry].min.to_f) / 2.0
            end
        elsif lx > ry
            r = px - 1
        elsif ly < rx # else
            l = px + 1
        end
        
    end
end
p more_efficient_median_of_two_sorted_arrays([-1,0,0,7,9], [0,1,3,5])