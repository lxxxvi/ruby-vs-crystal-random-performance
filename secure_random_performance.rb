require 'securerandom'

class SecureRandomPerformance
  N     =         16
  LOOPS = 10_000_000
  MAX   = (2 ** 16)

  def self.settings
    puts "FILE    : #{File.basename(__FILE__)}"
    puts "LOOPS   : #{SecureRandomPerformance::LOOPS}"
    puts "N       : #{SecureRandomPerformance::N} (used for `hex`, `base64` and `random_bytes`)"
    puts "MAX     : #{SecureRandomPerformance::MAX} (used for `rand`)"
    puts ""
  end

  def hex
    run(->{ SecureRandom.hex(N) })
  end

  def base64
    run(->{ SecureRandom.base64(N) })
  end

  def rand
    run(->{ SecureRandom.rand(MAX) })
  end

  def random_bytes
    run(->{ SecureRandom.random_bytes(N) })
  end

  private def run(generator)
    start_time = Time.now
    i = 0
    while i < LOOPS
      result = generator.call
      i = 1 + i
    end
    (Time.now - start_time)
  end
end

puts SecureRandomPerformance.settings
puts "#hex              : #{SecureRandomPerformance.new.hex}"
puts "#base64           : #{SecureRandomPerformance.new.base64}"
puts "#rand             : #{SecureRandomPerformance.new.rand}"
puts "#random_bytes     : #{SecureRandomPerformance.new.random_bytes}"
