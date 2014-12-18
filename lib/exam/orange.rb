class OrangeTree
	def initialize
		@height = 0
		@orange_count = 0
		@alive = true
	end

	def height
		if @alive
			@height
		else
			'A dead tree is not very tall. :('
		end
	end

	def count_the_oranges
		if @alive
			@orange_count
		else
			'A dead tree has no oranges. :('
		end
	end

end