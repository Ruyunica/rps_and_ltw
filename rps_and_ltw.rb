class Rps_and_ltw

  def initialize
  @rps_result = 0
  end

  def rps(counter) # じゃんけん部分の設計
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    rps_type_user = gets.to_i

    if rps_type_user == 0 || rps_type_user == 1 || rps_type_user == 2

      counter += 1
      if counter == 1
        puts "ポン！"
      else
        puts "ショ！"
      end

      rps_type_system = rand(3)

      puts "----------"

      hands = ["グー", "チョキ", "パー"]
      puts "あなた：#{hands[rps_type_user]}を出しました"
      puts "相手：#{hands[rps_type_system]}を出しました"

      @rps_result = rps_type_user - rps_type_system #じゃんけんの結果を計算して格納
      return rps_type_user, rps_type_system, counter # ユーザーと相手の値を戻り値として返す

    elsif rps_type_user == 3
      puts "挑戦をお待ちしています"
      exit
    else
      puts "0〜3の数字を入力してください"
      return nil, nil, counter # エラーが発生した場合はnilを返す
    end
  end

  def ltw # あっち向いてホイ部分の設計
    loop do
      puts "0(上)1(下)2(左)3(右)"
        ltw_type_user = gets.to_i

        if ltw_type_user == 0 || ltw_type_user == 1 || ltw_type_user == 2 || ltw_type_user == 3
          puts "ホイ！"

          ltw_type_system = rand(4)
          
          puts "----------"
          
          direction = ["上", "下", "左", "右"]
          puts "あなた：#{direction[ltw_type_user]}"
          puts "相手：#{direction[ltw_type_system]}"
          
          puts "----------"

            if ltw_type_user == ltw_type_system
              if @rps_result == -1 || @rps_result == 2
                puts "あなたの勝ち！"
                exit
              elsif @rps_result == 1 || @rps_result == -2
                puts "相手の勝ち！"
                exit
              end
            else
              puts "じゃんけん…"
              return # ltwを抜けてrpsのループへ戻る
            end
        else
          puts "0〜3の数字を入力してください" # ltwのループの先頭へ戻る
        end
    end
  end

end

rps_and_ltw = Rps_and_ltw.new

puts "じゃんけん…"
  counter = 0
  loop do
    play_rps = rps_and_ltw.rps(counter)
    unless play_rps[0].nil? || play_rps[1].nil? # 0~3が入力されない場合は再度入力を促す
      rps_type_user, rps_type_system, counter = play_rps
      puts "----------"

      @rps_result = rps_type_user - rps_type_system
      
      if @rps_result == 0
        puts "あいこで…"
      else
        puts "あっち向いて…"
          rps_and_ltw.ltw
          counter = 0 #ltwのループを抜けた場合、カウンターを0へ戻す
      end
    end
  end

