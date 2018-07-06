class RandomPerformance
  N     =         16
  LOOPS = 10_000_000
  MAX   = (2 ** 16)

  def self.settings
    puts "FILE    : #{File.basename(__FILE__)}"
    puts "LOOPS   : #{RandomPerformance::LOOPS}"
    puts "N       : #{RandomPerformance::N} (used for `hex`, `base64` and `random_bytes`)"
    puts "MAX     : #{RandomPerformance::MAX} (used for `rand`)"
    puts ""
  end

  def hex
    run(->{ Random.new.hex(N) })
  end

  def base64
    run(->{ Random.new.base64(N) })
  end

  def rand
    run(->{ Random.new.rand(MAX) })
  end

  def random_bytes
    run(->{ Random.new.random_bytes(N) })
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

puts RandomPerformance.settings
puts "#hex            : #{RandomPerformance.new.hex}"
puts "#base64         : #{RandomPerformance.new.base64}"
puts "#rand           : #{RandomPerformance.new.rand}"
puts "#random_bytes   : #{RandomPerformance.new.random_bytes}"
