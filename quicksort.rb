def quicksort(sequence)
  tmp = sequence.clone
  # tmp = sequence
  if tmp.count <= 1 
    return tmp
  else
    pivot_index = (tmp.count / 2)
    pivot = tmp[pivot_index]
    # pull the pivot out of the array.
    tmp.delete_at(pivot_index)
    
    # create 2 sub-sequences, one < pivot, one >= pivot
    sub_sequence_a = []
    sub_sequence_b = []
    tmp.each do |element|
      if element < pivot
        sub_sequence_a << element
      elsif element >= pivot
        sub_sequence_b << element
      end
    end

    # quicksort sub-sequence 1
    new_sub_sequence_a = quicksort(sub_sequence_a)
    
    # quicksort sub-sequence 2
    new_sub_sequence_b = quicksort(sub_sequence_b)
    
    # return sub1 plus pivot plus sub2
    new_sub_sequence_a + [pivot] + new_sub_sequence_b
  end
end

def q(s);t=s.dup;t.size<=1 ? t :(p=t[i=t.size/2];t.delete_at(i);x,y=[],[];t.each{|e|e<p ? x<<e : y<<e};n=q(x);m=q(y);n+[p]+m)end
