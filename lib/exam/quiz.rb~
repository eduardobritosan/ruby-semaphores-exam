# -*- encoding : utf-8 -*-
require "exam/version"

class Quiz
  RIGHT = :right
  WRONG = :wrong

  attr_accessor :name, :questions
  
  def initialize(name = "", &block)
    self.name = name
    self.questions = []

    @counter = 0
    instance_eval &block
  end

  def question(text, preguntas)
    q = SelSim.new(text, preguntas)
    #questions << q 
    #puts q if $DEBUG
    #@counter = 0
  end

  def to_s
    out = <<"EOQUIZ"
#{self.name}

#{self.questions.join("\n")}
EOQUIZ
  end

  def wrong
    @counter += 1
    [@counter, WRONG]
  end

  def right
    @counter+= 1
    [@counter, RIGHT]
  end

  def title(title)
    @name = title
  end

  def run
    counter=0
    puts self.name+"\n\n"
    self.questions.each { |q| counter += 1 if q.ask }
    puts "#{counter} respuestas correctas de un total de #{@questions.size}."
  end
end

if __FILE__ == $0
  quiz = Quiz.new("Cuestionario de PFS 10/12/2011") do
    question '¿En que año Cristobal Colón descubrió América?',
      wrong =>'1942',
      right =>'1492',
      wrong =>'1808',
      wrong =>'1914'
    
    a = rand(10)
    b = rand(10)
    question "#{a}+#{b} = ",
      wrong =>"44",
      wrong =>"#{a + b + 2}",
      right =>"#{a + b}",
      wrong =>"#{a + b - 2}"
  end

  puts quiz
  puts "************************"
  quiz.run
end