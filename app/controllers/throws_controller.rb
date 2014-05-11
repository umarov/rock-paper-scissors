class ThrowsController < ApplicationController
  
  def index
    @signs = ["Rock", "Paper", "Scissors"] #initializing array of signs for the select option in index.html
  end
  
  def result
    @signs = ["Rock", "Paper", "Scissors"] #for local result use
    @sign = params[:sign]
    
    r = Random.new
    choice = r.rand(0...3) #random number between 0 and 2 (inclusive) to select a value from signs array
    
    @user_pick = @sign
    @computer_pick = @signs[choice]
    
    #This if block will determine who won
    if (@user_pick == @computer_pick)
      @game_result = "You had a tie with the Computer"
    else
      
      if (@user_pick == "Rock")
        
        if (@computer_pick == 'Scissors')
          @game_result = "You won"
        else
          @game_result = "You lost, the Computer won"
        end 
        
      elsif (@user_pick == "Paper")
          
          if (@computer_pick == 'Rock')
            @game_result = "You won"
          else
            @game_result = "You lost, the Computer won"
          end 
          
      elsif (@user_pick == "Scissors")
            
          if (@computer_pick == 'Paper')
              @game_result = "You won"
          else
              @game_result = "You lost, the Computer won"
          end 
            
      end     
      render 'result'
    end
  end
end
  

