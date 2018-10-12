require "./my_gt"


class Enemy_gt < My_gt
  attr_accessor :name,:hp,:attk,:defen

  def initialize(name:,hp:,attk:,defen:)
    super(name: name, hp: hp, attk: attk, defen: defen)
  end


  def enemy_attk_lv(enemy_attk_num)
    if enemy_attk_num == 0
      return @attk

    elsif enemy_attk_num == 1
      return @attk += 5

    else enemy_attk_num
      return @attk -= 3
    end

  end

  def enemy_attk_lv_flat(enemy_attk_num)
    if enemy_attk_num == 0
      return @attk

    elsif enemy_attk_num == 1
      return @attk -= 5

    else
      return @attk += 3


    end
  end



  def enemy_attk_word(enemy_attk_num)
    if enemy_attk_num == 0
      return "なかなかなプレイだ"

    elsif enemy_attk_num == 1
      return "もの凄いプレイに圧倒された"

    else
      return "どうやら調子が悪そうだ"

    end

  end


  def enemy_defen_lv(enemy_defen_num)
    if enemy_defen_num == 0
      return @defen
    elsif enemy_defen_num == 1
      return @defen += 3
    else
      return @defen -= 3
    end
  end

  def enemy_defen_lv_flat(enemy_defen_num)
    if enemy_defen_num == 0
      return @defen
    elsif enemy_defen_num == 1
      return @defen -= 3
    else
      return @defen += 3
    end
  end



end
