def mergesort(arr)
  return arr if arr.length <= 1

  mid   = arr.length / 2
  left  = arr[0..mid-1]
  right = arr[mid..-1]
  merge(mergesort(left), mergesort(right))
end


def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left[0] <= right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted + left + right
end
