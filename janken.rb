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
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
      enemy_hand = rand(3)
    # グー、チョキ、パーの値をランダムに出力させます。
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
   # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
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
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
next_game = true
# 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
# 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
 while next_game
# 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
  #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
next_game = janken.pon(player.hand, enemy.hand)
 # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了します。「true」が返ってくると、その回数だけ繰り返し続けます。
 end
