require "./enemy_gt"
require "date"

today = Date.today

my_gt1 = My_gt.new(name:"Fender", hp:180, attk:32, defen:8)
my_gt2 = My_gt.new(name:"Gibson", hp:170, attk:41, defen:4)
my_gt3 = My_gt.new(name:"YAMAHA", hp:175, attk:30, defen:10)
my_gt4 = My_gt.new(name:"PRS",    hp:190, attk:35, defen:3)

my_gts = [my_gt1,my_gt2,my_gt3,my_gt4]

enemy_gt1 = Enemy_gt.new(name:"EDWARDS", hp:180, attk:32, defen:8)
enemy_gt2 = Enemy_gt.new(name:"GRETSCH", hp:170, attk:41, defen:4)
enemy_gt3 = Enemy_gt.new(name:"IBANEZ", hp:175, attk:30, defen:10)
enemy_gt4 = Enemy_gt.new(name:"SCHECTER", hp:190, attk:35, defen:3)

enemy_gts = [enemy_gt1,enemy_gt2,enemy_gt3,enemy_gt4]


puts <<~text
---------------------------------------
　　　　　　　ギターバトル
---------------------------------------


＊名前を入力してください

text

my_name = gets.chomp


my_gts.each.with_index do |gt,i|
  puts "#{i}. #{gt.info}"
end

puts <<~text

＊使用するギターを番号で選んで下さい

text

gt_num = gets.chomp.to_i

my_gt = my_gts[gt_num]

enemy_gt_num = rand(0..3)

enemy_gt = enemy_gts[enemy_gt_num]

enemy = "謎のギタリスト"


puts <<~text
#{my_name}は#{my_gt.name}のギターを選んだ！

#{today}

#{my_name}は伝説のギタリストを目指し旅に出た


どうやら敵が現れた


#{enemy}だ
持っているのはの#{enemy_gt.name}のギターのようだ

#{enemy_gt.info}

さあ！ギターバトル開始！！



text

battle_menus = ["ギターをかき鳴らす","チューニングをする"]





while my_gt.hp > 0 && enemy_gt.hp > 0
  battle_menus.each.with_index do |menu,i|
    puts "#{i}. #{menu}"
  end
    puts
    puts "＊どちらを選択しますか？"


    battle_select_num = gets.chomp.to_i

    my_attk_num = rand(0..2)
    my_defen_num = rand(0..2)
    enemy_attk_num = rand(0..2)
    enemy_defen_num = rand(0..2)

    enemy_damege = my_gt.my_attk_lv(my_attk_num) - enemy_gt.enemy_defen_lv(enemy_defen_num)
    my_damege = enemy_gt.enemy_attk_lv(enemy_attk_num) - my_gt.my_defen_lv(my_defen_num)

    my_word = my_gt.my_attk_word(my_attk_num)
    enemy_word = enemy_gt.enemy_attk_word(enemy_attk_num)


  if battle_select_num == 1


     my_gt.hp += my_gt.my_attk_lv(my_attk_num)

    puts <<~text

    #{my_name}はチューニングを直した！
    #{my_name}は#{my_gt.my_attk_lv(my_attk_num)}回復した！
    #{my_name}の残りHPは#{my_gt.hp}

    text

  else battle_select_num == 0



    puts <<~text

    #{my_name}はギターをかき鳴らす！！
    #{my_word}
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

  #{enemy_word}

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
