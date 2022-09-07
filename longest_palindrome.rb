# def longest_palindrome(s)
#     # Terrible solution: O(n^3) 
#     i = 0
#     longest_pal = ''
#     while i < s.length
#         j = s.length-1
#         while j >= i
#             puts s[i..j]
#             if is_palindrome?(s[i..j])
#                 longest_pal = s[i..j] if s[i..j].length > longest_pal.length
#             end
#             j-=1
#         end
#         i+=1
        
#     end
#     return longest_pal
    
# end

# def is_palindrome?(string)
#     i = 0
#     j = string.length-1
#     while i < j
#         if string[i] != string[j]
#             return false
#         end
#         i+=1
#         j-=1
#     end
#     return true
# end
def longest_palindrome(s)
  # start + end will be the start + end indices of our longest 
    # palindrome so far.
    start = 0
    # end is a keyword in ruby so added "_"
    _end = 0
    # for each iteration, i will be the middle of our palindrome.
    (0...s.length).each do |i|
        # Our string s can be odd length or even length.
        # To account for both we need two different checks.
        # For even length we need our left in expand_from_middle
        # to start on the left center + right to start at right center
        # For odd length we need to start from dead center.
        
        # odd length substring
        len1 = expand_from_middle(s, i, i)
        # even length substring
        len2 = expand_from_middle(s,i,i+1)
        # If the palindrome that was found
        # from expand_from_middle was odd then len2 will be 0
        # which means it will be ignored by our check on
        # of which is greater
        # If palindrome was even then len1 would be 0 and it would
        # be ignored by our check
        len = len1 > len2 ? len1 : len2
        # If len, which is the length of our current palindrome 
        # is greater than our greatest palindrome so far
        # then we can update start and end
        if (len > _end-start+1)
            # start must be set to beginning of our palindrome
            # i is currently the middle of our palindrome
            # len is the length of the palindrome
            # so we use the middle index and the length of our 
            # palindrome to calculate start and end indices
             start = i-((len-1)/2)
             _end = i+(len/2)
        end
    end
    return s[start.._end]
end

def expand_from_middle(s, left, right)
    # expand outward until we no longer have a palindrome
    # or we are out of bounds
    while left >= 0 && right < s.length && s[left] == s[right]
        left-=1
        right+=1
    end
    # by the end of the while loop, right will be one index
    # after the palindrome ends and left will be one
    # index before the palindrome starts.This is because
    # the last run of the while loop will decrement left and 
    # increment right and then the while condition will evaluate to
    # false. Now to get the length of the substring from index left to
    # index right we'd need to take right-left+1 since right and left
    # are 0-indexed. As I mentioned though we need to account for the 
    # extra beginning + end characters so our length of our palindrome
    # is right-left+1-2, again the subtracting of 2 is to eliminate the
    # extra end characters
    return right-left-1
end
puts longest_palindrome('cbbd')
