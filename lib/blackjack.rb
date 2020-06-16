def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
  # code #display_card_total here
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  return gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  initial_card = deal_card
  initial_hand = initial_card + deal_card
  display_card_total(initial_hand)
  return initial_hand
end

def hit?(card_total)
  prompt_user
  player_decision = get_user_input
  if player_decision == 's'
    return card_total
  elsif player_decision == 'h'
    card_total += deal_card
    return card_total
  elsif player_decision != 's' || 'h'
    invalid_command
    prompt_user
    player_decision = get_user_input
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  hand_total = initial_round
  until hand_total > 21
    hand_total = hit?(hand_total)
    display_card_total(hand_total)
  end  
  end_game(hand_total)
end
    
