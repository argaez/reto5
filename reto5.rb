
=begin
1. Cómo representamos un archivo con las preguntas y las respuestas?
2. Cómo poner la primera pregunta
=end

class Questionary

    attr_reader :file

    def initialize(file)
        @file = file
        @question_list = []
        read
    end

    def take!
        @question_list.shift.strip
    end

    private

    def read
        if File.exist?(@file)
        @question_list = IO.readlines(@file)
        else
        puts "El archivo con las preguntas no existe"
        end
    end

end

=begin
2. Como leer las lineas del cuestionario
=end

class ReadLine

    def initialize(questionary)
        @questionary = questionary
        @question_answer_list = []
    end

    def hit!
        @question_answer_list.push(@questionary.take!)
    end

end

questionary = Questionary.new('pr.txt')
readline = ReadLine.new(questionary)

=begin
    Bienvenida al jugador
=end

puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino 
correcto para cada una de las definiciones, Listo? Vamos!"
print "Cual es tu Nombre?"
name = gets.chomp
puts "Aquí Vamos #{name}"

=begin
    lógica del juego
=end

val = 0;
cicles = 5

cicles.times do |i|
    puts val += 1
    puts "#{val} Pregunta:"
    puts "#{readline.hit!.last}"
    print "Respuesta: "
    answer = gets.chomp
    ultimo = readline.hit!.last


while answer != ultimo
    print "Respuesta Incorrecta, intenta nuevamente"
    puts    
    puts "Respuesta: "
    answer = gets.chomp
end
    puts "Respuesta correcta"
end
