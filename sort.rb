# Bubble Sort. Walk through list, compare two adjacent elements, swap
# if first > second. O(n^2), but space complexity is O(1) since the
# sort is "in place".
def bubble_sort(arr)
  n = arr.length
  loop do
    puts "loop"
    swapped = false
    (n - 1).times do |i|
      puts "inner loop"
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end

    break if not swapped
  end

  arr
end


# Merge Sort. Divide and conquer, split original array into smaller
# arrays recursively. Terminate when array length is 1. Then
# combine the smaller arrays. O(nlog2n).
def mergesort(arr)
  # merge two sorted arrays (e.g., [1, 3, 5] and [2, 4, 6]) into a
  # single sorted array (e.g., [1, 2, 3, 4, 5, 6]).
  def merge(left, right)
    result = []
    l = 0
    r = 0

    loop do
      break if r >= right.length and l >= left.length

      # push the smaller of two options into result
      if r >= right.length or (l < left.length and left[l] < right[r])
        result << left[l]
        l += 1
      else
        result << right[r]
        r += 1
      end
    end

    return result
  end

  # recursively split array into smaller arrays to sort and merge
  def mergesort_iter(arr_sliced)
    return arr_sliced if arr_sliced.length <= 1

    mid = arr_sliced.length/2 - 1
    left_sorted = mergesort_iter(arr_sliced[0..mid])
    right_sorted = mergesort_iter(arr_sliced[mid+1..-1])
    return merge(left_sorted, right_sorted)
  end

  mergesort_iter(arr)
end


# Mark Sort. Initialize count array of [min..max] (e.g., for array
# [7, 4, 9], initialize markings to array of six zeros, corresponding
# to [4..9]). Iterate through original array and increment count at
# each appropriate index (e.g., [1, 0, 0, 1, 0, 1], incremented for
# the 4, 7, and 9 index). Create result array translating the count
# array into sorted array ([4, 7, 9]). O(n), but space complexity is
# poor (need to allocate an array of length array.max, which could be
# massive).
def mark_sort(arr)
  arr_max = arr.max
  arr_min = arr.min
  count = [0] * (arr_max - arr_min + 1)
  puts count
  arr.each do |a|
    count[a - arr_min] += 1
  end
  puts count
  result = []
  count.length.times do |i|
    count[i].times do
      result << i + arr_min;
    end
  end

  result
end