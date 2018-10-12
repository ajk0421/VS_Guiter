

class Gt
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

  def attk_lv(attk_num)
    if attk_num == 0
      return @attk

    elsif attk_num == 1
      return @attk += 5

    else attk_num
      return @attk -= 3
    end

  end

  def attk_lv_flat(attk_num)
    if attk_num == 0
      return @attk

    elsif attk_num == 1
      return @attk -= 5

    else
      return @attk += 3


    end
  end



  def attk_word(attk_num)
    if attk_num == 0
      return "いつも通りのプレイが出来た！"

    elsif attk_num == 1
      return "そのとき！神降臨！奇跡の演奏"

    else
      return "なんだか腑抜けたプレイになってしまった"

    end

  end


  def defen_lv(defen_num)
    if defen_num == 0
      return @defen
    elsif defen_num == 1
      return @defen += 3
    else
      return @defen -= 3
    end
  end

  def defen_lv_flat(defen_num)
    if defen_num == 0
      return @defen
    elsif defen_num == 1
      return @defen -= 3
    else
      return @defen += 3
    end
  end




end
