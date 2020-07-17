# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "[0]グー\n[1]チョキ\n[2]パー"
    player_hand = gets.chomp

    while true

      if(player_hand == "0" || player_hand == "1" || player_hand == "2")
        return player_hand.to_i

      else
        puts "0〜2の数字を入力してください"
          player_hand = gets.chomp
      end
    end
  end
end

class Enemy
  def hand
      enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
   jankens = ["グー", "チョキ", "パー"]

   if (player_hand-enemy_hand + 3) % 3 == 0
     puts "相手の手は#{jankens[enemy_hand]}です。あいこです。"
      return true

    elsif (player_hand-enemy_hand + 3) % 3 == 2
      puts "相手の手は#{jankens[enemy_hand]}です。あなたの勝ちです。"

    elsif (player_hand-enemy_hand + 3) % 3 == 1
      puts "相手の手は#{jankens[enemy_hand]}です。あなたの負けです。"

    else
      puts "0~2の数字を入力してください。"
        return true
    end
  end
end

class Jikou
  def play
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true

    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
jikou = Jikou.new
jikou.play
