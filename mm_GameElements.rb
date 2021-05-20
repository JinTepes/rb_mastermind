#global variables
$secretCode = Array.new

class Player
    attr_accessor :turns, :guessCode

    def initialize
        @guessCode = Array.new
        @turns=12
    end
end

def genSecretCode
    for i in 1..4
        $secretCode.append(rand(1..6).to_s)
    end
end

def showColors
    #puts "for testing, secret code is: #{$secretCode}"
    puts "COLORS"
    puts "(1) Red | (2) Orange | (3) Green | (4) Blue | (5): Yellow | (6) Violet\n\n"
end

def checkWin(guessed, seccode)
    $score = 0
    system "clear"
    puts "HINTS:" 
    for ads in 0...4
        #for testing
        ##puts "#{guessed[ads]} is in code? #{seccode.include?(guessed[ads])}"
        ##puts "Guess Slot #{ads} Value: #{guessed[ads]} |is the same with| Secret Code Slot #{ads} Value: #{seccode[ads]} "
        
        if seccode.include?(guessed[ads]) == true and seccode[ads] == guessed[ads]
            puts ("#{guessed[ads]} is right and in correct order")
            $score += 1
        elsif seccode.include?(guessed[ads]) == true and seccode[ads] != guessed[ads]
            puts ("#{guessed[ads]} is right but not in correct order")
        end
    end
    puts "\n"
    #print "\nScore: #{score}"
    #print "\n\nHints: #{hints}"
end

def codeBreakerGame
    ongoing = true
    while ongoing == true
        showColors #showing the colors
        puts "Turns Left: #{$daPlayer.turns.to_s}"
        #looping user to get correct input
        loop = true
        while loop == true
            puts "Previous Guess: #{$daPlayer.guessCode}"
            print "\nCode: "
            guess=gets.chomp
            if guess.length == 4 and guess.to_i.is_a?(Numeric) == true
                loop = false
            else
                puts "Invalid Code"
            end
        end
        #end of loop, beyond this user code input is already correct.
        #storing the input guess into player guess object
        $daPlayer.guessCode.clear
        for char in guess.split("")
            $daPlayer.guessCode.append(char.to_s)
        end
        #reducing turns
        $daPlayer.turns -= 1
        puts "\n\n"
        checkWin($daPlayer.guessCode, $secretCode) #checking to see if win. also give hints
        if $score == 4 and $daPlayer.turns>0
            ongoing = false #stops game
            system "clear"
            puts "YOU WON!!\n\n"
        elsif $daPlayer.turns == 0
            ongoing = false #stops game
            system "clear"
            puts "YOU LOSE SADT!!\n\n"
        end
    end
end

def codeMakerGame
    showColors
    #looping secret code input
    loop = true
    while loop == true
        print("\n\nEnter Secret Code: ")
        tsecode = gets.chomp
        if tsecode.length == 4 and tsecode.to_i.is_a?(Numeric) == true
            tsecode = tsecode.split("") #i split ang code aron ma array para ma iterate nato
            #gina append ang array sa secret code
            for i in tsecode
                $secretCode.append(i.to_s)
            end
            system "clear" #clearing screen
            loop = false
        else
            puts "Invalid Secret Code!"
        end
    end
    #secret code established. time  for the AI to guess IT
    aiPlay
end

def aiPlay
    ingame = true
    while ingame == true
        showColors
        puts "Turns Left: #{$daAI.turns.to_s}"
        puts "Previous Guess: #{$daAI.guessCode}"
        #generate guess code and delete prev guessed code
        $daAI.guessCode.clear
        for i in 1..4
            $daAI.guessCode.append(rand(1..6).to_s)
        end
        puts "AI's Current Guess Code: #{$daAI.guessCode}"
        puts "\nEvaluating....."
        sleep 4 #pausing for 4 sec
        $daAI.turns -= 1
        checkWin($daAI.guessCode, $secretCode) #checking to see if win. also give hints
        if $score == 4 and $daAI.turns>0
            ingame = false #stops game
            system "clear"
            puts "AI WINS!!\n\n"
        elsif $daAI.turns == 0
            ingame = false #stops game
            system "clear"
            puts "AI LOST!!\n\n"
        end

    end
end