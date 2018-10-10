require "./Gt"
require "date"

today = Date.today

gt1 = Gt.new(name:"Fender", hp:180, attk:32, defen:8)
gt2 = Gt.new(name:"Gibson", hp:170, attk:41, defen:3)
gt3 = Gt.new(name:"YAMAHA", hp:175, attk:30, defen:10)
gt4 = Gt.new(name:"PRS",    hp:190, attk:35, defen:2)

gts = [gt1,gt2,gt3,gt4]


puts <<~text
---------------------------------------
　　　　　　伝説のギタリスト
---------------------------------------


＊名前を入力してください

text

my_name = gets.chomp


gts.each.with_index do |gt,i|
  puts "#{i}. #{gt.info}"
end

puts <<~text

＊使用するギターを番号で選んで下さい

text

gt_num = gets.chomp.to_i

my_gt = gts[gt_num]

enemy_gt_num = rand(0..3)

enemy_gt = gts[enemy_gt_num]

enemy = "謎のギタリスト"



puts <<~text
#{my_name}は#{my_gt.name}のギターを選んだ！

#{today}

#{my_name}は伝説のギタリストを目指し旅に出た


どうやら敵が現れた


#{enemy}だ
持っているのはの#{enemy_gt.name}のギターのようだ



さあ！ギターバトル開始！！



text

battle_nemus = ["ギターをかき鳴らす","チューニングをする"]

attk_num = rand(0..2)
defen_num = rand(0..2)

enemy_damege = my_gt.attk_lv(attk_num) - enemy_gt.defen_lv(defen_num)
my_damege = enemy_gt.attk_lv(attk_num) - my_gt.defen_lv(defen_num)

word = my_gt.attk_word(attk_num)



while my_gt.hp > 0 && enemy_gt.hp > 0
  battle_nemus.each.with_index do |menu,i|
    puts "#{i}. #{menu}"
  end
    puts
    puts "＊どちらを選択しますか？"

    battle_select_num = gets.chomp.to_i

  if battle_select_num == 1

     my_gt.hp += my_gt.defen

    puts <<~text

    #{my_name}はチューニングを直した！
    #{my_name}は#{my_gt.defen}回復した！
    #{my_name}の残りHPは#{my_gt.hp}

    text

  else battle_select_num == 0



    puts <<~text

    #{my_name}はギターをかき鳴らす！！
    #{word}
    #{enemy}は#{enemy_damege}のダメージ

    text

    enemy_gt.hp -= enemy_damege

  end



  if enemy_gt.hp <= 0
     enemy_gt.hp = 0
  end

  puts "#{enemy}の残りHPは#{enemy_gt.hp}"
  puts

  if enemy_gt.hp > 80
    puts"「ぬははははは！そんな演奏では俺を倒せないぞ！！」"
  elsif enemy_gt.hp <= 80 && enemy_gt.hp > 50
    puts"「ほう。少しはやるようだな。」"
  elsif enemy_gt.hp <= 50 && enemy_gt.hp > 30
    puts"「くそっ、この私が、、、、」"
  elsif enemy_gt.hp <= 30 && enemy_gt.hp > 0
    puts"「、、、はぁ、、、はぁ、、、」"
  else
    puts"「ぐわわわあああああああ、、、、、」"
  end

  if enemy_gt.hp <= 0
    break
  end

  my_gt.hp -= my_damege

  if my_gt.hp <= 0
     my_gt.hp = 0
  end

  puts <<~text

  #{enemy}の攻撃

  「くらえっ！！」

  ギュイイィィィーン！！

  #{my_name}は#{my_damege}のダメージをおった

  #{my_name}の残りHPは#{my_gt.hp}

  text

  if my_gt.hp <= 0
    break
  end



end

puts "熾烈な戦いは幕を閉じた"

if my_gt.hp <= 0
  puts "勝ったのは#{enemy}だ"
else
  puts "勝ったのは#{my_name}だ"
end

puts <<~text

そして彼は伝説のギタリストとして、その名を歴史へ刻んだ



----------------END-------------------
text

puts my_gt.hp
puts my_gt.attk
puts my_gt.defen
