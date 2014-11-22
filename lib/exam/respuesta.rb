# -*- encoding : utf-8 -*-
require "exam/version"

class Respuesta
	attr_accessor :string, :fidelity
	def initialize(string,fidelity)
		@string = string
		@fidelity = fidelity
	end
end