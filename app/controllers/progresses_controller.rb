class ProgressesController < ApplicationController

  # ここで新しく、進捗開始され質問が出される
  def new
    progress = Progress.new
    if progress.save
        render json: progress
    else
        render json: progress.errors, status: 422
    end
    
    current_game = Game.find(params[:game_id])
    @question = Question.next_question(current_game)
  end

  def create
    current_game = Game.find(params[:game_id])
    
    # 回答した内容を保存する 
    progress = current_game.progresses.new(create_params)
    progress.assign_sequence
    progress.save!

    next_question = Question.next_question(current_game)
    if next_question.blank?

      current_game.status = 'finished'
      current_game.result = 'incorrect'
      current_game.save!

      redirect_to give_up_game_path(current_game)
      return
    end  

    render json: progress
  end

    # 絞り込みを実行
    @extract_presents = ExtractionAlgorithm.new(current_game).compute

    # 絞り込み結果が0件の場合、ギブアップ画面へ遷移
    if @extract_presents.count == 0
      redirect_to give_up_game_path(current_game) #リダイレクト先変更
      return
    end

    # 絞り込み結果が1件の場合、チャレンジ(正解を当てにいく)へ遷移
    if @extract_presents.count == 1
      render '' # リダイレクト先変更
      return
    end

    if @extract_presents.count >= 2
      next_question = Question.next_question(current_game)
      if next_question.blank?

        current_game.status = 'finished'
        current_game.result = 'incorrect'
        current_game.save!

        redirect_to give_up_game_path(current_game)
        return
      end

       redirect_to new_game_progresses_path(current_game) # jsonを調べる
      return
    end
  end

  private

  def create_params
    params.require(:progress).permit(:question_id, :answer)
  end

end
