class GameController < ActionController::Base

  def try


    cookies[:secret_number] = params[:secret_number] unless params[:secret_number].nil?
    @secret_number = cookies[:secret_number].to_i

    @user_guess = params[:guess].to_i

  if cookies[:count].nil?
    cookies[:counter] = 0
  end

  cookies[:counter] = cookies[:counter].to_i + 1

          if @user_guess > @secret_number
            @results =  "Your guess is too high"

          elsif @user_guess < @secret_number
            @results = "Your guess is too low"

          elsif @user_guess == @secret_number
            @results = "you win"
            cookies[:counter] = 0

          elsif cookies[:counter] == 5
            @results = "You lose"
            cookies[:counter] = 0
          end


    end
end
