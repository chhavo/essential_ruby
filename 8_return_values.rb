# Return values

# Suppose we want to do some data analysis.
# Eventually, I want to print the STANDARD DEVIATION of a set of numbers.
# In other words, if I have a set of numbers like this:

#     first_dataset = [93, 65, 87, 68, 2, 64, 36, 96, 45, 47]

# Then I want to be able to do something like this:

#     stdev1 = standard_deviation(first_dataset)

# And have it work.

# In order to find the STANDARD DEVIATIONS of sets of numbers, we have
# to be able to find VARIANCES. In order to find VARIANCES, we have to be
# able to find SUMS and MEANS.

# So, let us first define some tools that will be helpful in taking the
# intermediate steps:

# SUM
# ===
# To find the sum of a set of numbers,
#  - we start with 0
#  - for each number in the set,
#   - we add it to the running total
#  - after we've looked at every number, the running total is the sum

def sum(list_of_numbers)
  puts "in sum #{list_of_numbers.inspect}"
  running_total = 0.0
  list_of_numbers.each do |number|
    running_total = running_total + number
  end

  return running_total
end


def mean(list_of_numbers)
  puts "in mean #{list_of_numbers.inspect}"
  sum_of_arr = sum(list_of_numbers)
  mean_of_arr = sum_of_arr/list_of_numbers.length
  return mean_of_arr
end

# VARIANCE
# ========
# To find the variance of a set,
#  - we find the mean of the set
#  - for each number in the set,
#   - we find the difference between the number and the mean
#   - we square the difference
#  - the variance is the mean of the squared differences

def variance(list_of_numbers)
  puts "in variance #{list_of_numbers.inspect}"
  diff_square = 0.0
  mean_of_arr = mean(list_of_numbers)
  list_of_numbers.each  do |number|
    diff_square = (number - mean_of_arr)**2 + diff_square
  end

  diff_square = diff_square/list_of_numbers.length
  return diff_square
end

# STANDARD DEVIATION
# ==================
# To find the standard deviation of a set,
#  - take the square root of the variance

def standard_deviation(list_of_numbers)
  puts "in std dev #{list_of_numbers.inspect}"
  std_dev = variance(list_of_numbers)
  std_dev = std_dev**0.5
  return std_dev
end


# Finally, everything above allows us to do:

first_dataset = [93, 65, 87, 68, 2, 64, 36, 96, 45, 47]
stdev1 = standard_deviation(first_dataset)
puts "The standard deviation of the first dataset is #{stdev1.round(2)}."

second_dataset = [2, 9, 405, 562, 740, 133, 346, 509, 21, 93]
stdev2 = standard_deviation(second_dataset)
puts "The standard deviation of the second dataset is #{stdev2.round(2)}."
