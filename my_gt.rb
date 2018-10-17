

class My_gt
  attr_accessor :name,:hp,:attk,:defen

  def initialize(name:,hp:,attk:,defen:)
    @name = name
    @hp = hp
    @attk = attk
    @defen = defen
  end

  def info
   return <<~text
   メーカー:#{@name}　
   HP:#{@hp}
   音圧:#{@attk}
   耐久性#{@defen}



   text

  end


  def my_attk_lv(my_attk_num)
    if my_attk_num == 0
      return @attk

    elsif my_attk_num == 1
      return @attk + rand(5..10)

    else my_attk_num
      return @attk - rand(3..5)
    end

  end


  def my_attk_word(my_attk_num)
    if my_attk_num == 0
      return "いつも通りのプレイが出来た！"

    elsif my_attk_num == 1
      return "そのとき！神降臨！奇跡の演奏"

    else
      return "なんだか腑抜けたプレイになってしまった"

    end

  end


  def my_defen_lv(my_defen_num)
    if my_defen_num == 0
      return @defen
    elsif my_defen_num == 1
      return @defen + rand(3..5)
    else
      return @defen - rand(3..5)
    end
  end


end
