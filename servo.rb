require 'bundler/setup'
require 'dino'
require './components/Motor.rb'

board = Dino::Board.new(Dino::TxRx::Serial.new)
servo = Dino::Components::Servo.new(pin: 9, board: board)
motor = Dino::Components::Motor.new(pin: 10, board: board)


# Create a random range fro 180 degree sweep, give it an ending point of 50 so it doesn't just go on forever
random_ranges = 50.times.map{ rand(180) }

# Cycle through each item in the range and use it as the angle for servo
random_ranges.each do |random|
	motor.on
	[0,random].cycle(rand(5)) do |angle|
		servo.position = angle
  		sleep 1
	end
	motor.off
end