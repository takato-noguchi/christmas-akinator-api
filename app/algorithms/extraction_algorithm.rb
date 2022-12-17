class ExtractionAlgorithm
    attr_reader :game
    attr_reader :query
  
    def initialize(game)
      Rails.logger.debug('ExtractionAlgorithm initialized.')
      @game = game
      @query = Present.all
    end
    
    def compute
      progresses = @game.progresses
      progresses.each do |progress|
        # question
        question = progress.question
  
        case question.algorithm
          when ''
            ?(progress)
          else
            raise Exception('Invalid algorithm. --> ' + question.algorithm.to_s)
        end
  
        Rails.logger.debug('On the way query is ' + @query.to_sql.to_s)
        Rails.logger.debug('On the way presents are ' + @query.pluck(:title).to_a.to_s)
      end
      @query
    end

    private 
  
    def serialization_end?(progress)
  
      if progress.positive_answer?
        @query = @query.where.not("presents. is null")
      end
  
      if progress.negative_answer?
        @query = @query.where("presents. is null")
      end
  
    end
  end
  