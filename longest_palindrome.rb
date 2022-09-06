def longest_palindrome(s)
    # Terrible solution: O(n^3) 
    i = 0
    longest_pal = ''
    while i < s.length
        j = s.length-1
        while j >= i
            puts s[i..j]
            if is_palindrome?(s[i..j])
                longest_pal = s[i..j] if s[i..j].length > longest_pal.length
            end
            j-=1
        end
        i+=1
        
    end
    return longest_pal
    
end

def is_palindrome?(string)
    i = 0
    j = string.length-1
    while i < j
        if string[i] != string[j]
            return false
        end
        i+=1
        j-=1
    end
    return true
end

