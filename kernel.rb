# a pseudo number generator for a normal distribution.
#
# uses the Box-Muller transform to generate a normal distribution from 
# two uniform random distributions
def rand_normal(mean, std, min, max)
  random_num = Math.sqrt(-2 * Math.log(rand)) * Math.cos(2 * Math::PI * rand) * std + mean
  return random_num.round.limit(min, max)
end
