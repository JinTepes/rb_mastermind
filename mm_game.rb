require_relative 'mm_GameElements.rb'

def gameStart
    #clearing prev screen cause annoying texts
    system "clear"
    #clearing secret code
    $secretCode.clear
    #intro
    puts "TO WIN: Guess the 4 color code combination of 1-6 [ex. 1622].\n\n"
    showColors #showing colors
    puts "Let's play Mastermind!"
    puts "[1] Code Breaker"
    puts "[2] Code Maker"
    puts "[3] Exit\n\n"
    #choice loop
    loop=true
    while loop == true
        print "Enter Number of Choice: "
        choice = gets.chomp
        case choice.to_s
        when '1'
            system "clear"
            genSecretCode #making the secret code the player has to guess correctly
            $daPlayer = Player.new #new player
            codeBreakerGame #starting code breaker game mode 
            loop=false #stops the loop
        when '2'
            system "clear"
            $daAI = Player.new #new ai player
            codeMakerGame #starting code maker game
            loop=false #stops the loop
        when '3'
            #just ending loop
            loop=false
        else
            puts "Invalid choice!"
        end
    end
    #game has ended run game end function
    gameEnd
end

def gameEnd
    puts "Do you want to play again?"
    puts "[1]Yes"
    puts "[2]No"
    #looping input
    loop=true
    while loop == true
        print "\nChoice: "
        choice = gets.chomp
        #cases
        case choice.to_s
        when '1'
            loop = false
            gameStart
        when '2'
            loop = false
            puts "\n\nTHANK YOU FOR PLAYING!!\n\n"
        else 
            puts "Wrong Input!"
        end
    end
end

gameStart #starting Game

