require 'spec_helper'
require 'exam'

describe Examen do
	before :each do
		@examen = Examen.new("Que hora es?")
	end
	describe "Pruebas de inicializacion" do
		it "Se crea la pregunta?" do
			@examen.question.should eq("Que hora es?")
		end
	end
end
