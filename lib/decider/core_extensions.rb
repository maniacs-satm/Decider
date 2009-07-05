# encoding: UTF-8

module Math
  
  # Variance of a population. If computing the variance of the entire 
  # population, defaults are fine. If computing the variance of a sample of the
  # population, enable the "Bessel Correction" with <tt>:sample => true</tt>
  def variance(population, opts={:sample=>false})
    n, mean, s = 0, 0.0, 0.0
    population.each do |x|
      n += 1
      delta = x - mean
      mean += (delta / n)
      s += delta * (x - mean)
    end
    return opts[:sample] ? s / (n - 1.0) : s / n
  end
  
  # Standard Deviation of a population. For a sample of a population, you need
  # to provide <tt>:sample => true</tt> (See #variance for more)
  def stddev(population, opts={:sample=>false})
    sqrt(variance(population, opts))
  end
  

  def avg(pop)
    total = pop.inject(0) { |sum, n| sum + n }
    total.to_f / pop.count.to_f
  end
  
  module_function :variance, :avg, :stddev
  
end