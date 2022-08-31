class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end


def add_two_numbers(l1, l2)
    # O(n) - n is length of longer list
    # Note that a ruby array only accomodates 3 elements until it has to copy it's elements to another array of bigger size
    # What it does is copies the elements to another array and increases the capacity (i.e. uses more memory) so that we can store more
    # elements without having to copy to another array.
    cur1 = l1
    cur2 = l2
    carry = 0
    # result = []
    dummy = ListNode.new
    result = dummy
    while (cur1 || cur2 || carry > 0)
        cur1_val = cur1 == nil ? 0 : cur1.val
        cur2_val = cur2 == nil ? 0 : cur2.val
        
        total_sum = cur1_val + cur2_val + carry
        
        
        cur_digit = total_sum % 10
        carry = total_sum/10
        # result.push(cur_digit)
        result.next = ListNode.new(cur_digit)
        result = result.next
        cur1 = cur1.next if cur1
        cur2 = cur2.next if cur2
    end
    
    
            
    # return result
    return dummy.next

end
l1 = ListNode.new(2, ListNode.new(4))
l2 = ListNode.new(2, ListNode.new(4))
p add_two_numbers(l1,l2)