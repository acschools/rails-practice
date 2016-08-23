class GameController < ActionController::Base

  def start_game
    @user_guess = params[:guess].to_i

  if cookies[:counter].nil?
    cookies[:counter] = 0
  end

  cookies[:counter] = cookies[:counter].to_i + 1

  end


def get_random
  prng = Random.new
  @secret_number = prng.rand(100)
end


def results
  get_random
  @user_guess = params[:guess].to_i

        if @user_guess > @secret_number
          @results =  "Your guess is too high"

        elsif @user_guess < @secret_number
          @results = "Your guess is too low"

        elsif @user_guess == @secret_number
          @results = "you win"
          cookies[:counter] = 0

        elsif
          cookies[:counter] == 5
          @results = "You lose"
          cookies[:counter] = 0
        end

end

end
