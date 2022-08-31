# Day Two


require 'set'
def length_of_longest_substring(s)
    # O(n^3) - check every possible substring
    # result = 0
    # i = 0
    # while i < s.length

    #     j = i
    #     while j < s.length
    #         substr = s[i...j+1]
    #         if substr.chars.uniq.length == substr.length
    #             p result
    #             result = substr.length > result ? substr.length : result 
    #         end
    #         j+=1
    #     end
    #     i+=1
    # end
    # return result


    # O(n) - Solved using sliding window.
    # Our "window" in this case is substr which is a set containing the non-repeating characters
    # Anytime we reach a character that's in substr, we remove every element up until the repeated character, 
    # essentially sliding our window over
    # max will keep track of our longest substr and we can check that against our current substring's length
    
    # This video explains the concept pretty well
    # https://www.youtube.com/watch?v=4i6-9IzQHwo
    substr = Set.new
    max = 0
    i = 0
    j = 0

    while j < s.length

        # Remove every character until the duplicate string
        while substr.include?(s[j])
            substr.delete(s[i])
            i+=1
        end
        substr.add(s[j])
        max = (j-i+1)> max ? (j-i+1) : max
        j+=1
    end
    return max
        
end

p length_of_longest_substring("bbbbb")
