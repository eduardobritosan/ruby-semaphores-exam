require_relative 'lib/exam/orange'	
require 'thread'

@arbol = OrangeTree.new	
@cv = ConditionVariable.new

recolector = Thread.new do
	until(@arbol.alive == false)
		@delay = rand(0..1)
		puts "Orange picker goes to sleep for #{@delay}s\n"
		sleep(@delay)
		puts "Orange picker wakes up after #{@delay}s\n"
			puts(@arbol.pick_an_orange)
			puts "Orange picker waits...\n"
			@cv.wait(@semaphore)
	end
end

crecimiento = Thread.new do
	until(@arbol.alive == false )
		@delay = rand(0..1)
		puts "Orange ager goes to sleep for #{@delay}s\n"
		sleep(@delay)
		puts "Orange picker wakes up after #{@delay}s\n"
			puts(@arbol.one_year_passes)
			@cv.signal
	end
end

until (@arbol.alive == false)
end





