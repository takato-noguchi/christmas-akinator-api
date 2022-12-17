case ENV['SECTION']
  when "2"
    presents = [
    { title: 'クリスマスケーキ', category: '食べ物', genre: '甘い スイーツ 分けて食べる'},
    { title: 'クッキー', category: '食べ物', genre: '固い スイーツ 焼き物'},
    { title: 'チキン', category: '食べ物', genre: '肉 焼き物'},
    { title: 'ピザ', category: '食べ物', genre: '焼き物 分けて食べる パンに似た'},
    { title: 'クリームシチュー', category: '食べ物', genre: 'スープ 温かい'},
    { title: 'Switch', category: 'ゲーム', genre: '任天堂の機器 ゲーム機器'},
    { title: 'マリオ', category: 'ゲーム', genre: 'キノコが出てくる 赤い帽子 アクションゲーム'},
    { title: 'スプラトゥーン', category: 'ゲーム', genre: 'イカ シューティングゲーム チーム戦'},
    { title: 'ポケットモンスター', category: 'ゲーム', genre: 'ロールプレイング RPG モンスター'},
    { title: '動物の森', category: 'ゲーム', genre: 'かわいい 動物 生活する'},
    { title: '漫画', category: '本', genre: '絵がある 海外人気 シリーズもの'},
    { title: '絵本', category: '本', genre: '絵がある 子供向け かわいい'},
    { title: '参考書', category: '本', genre: '活字 勉強'}
  ]

  when "3"
    presents = [
      { title: 'チキン', category: '食べ物', genre: '肉 焼き物'},
    ]

    questions = [
      { content: '食べられるものですか？', algorithm: 'category_match', eval_value: '食べ物' }, 
      { content: '肉料理ですか？', algorithm: 'genre_match', eval_value: '肉' }
    ]

  when "7"
    questions = [
      { content: '肉料理ですか？', algorithm: 'genre_match', eval_value: '肉' },
      { content: '甘いですか？', algorithm: 'genre_match', eval_value: '甘い' },
      { content: 'スイーツですか？', algorithm: 'genre_match', eval_value: 'スイーツ' },
      { content: 'パンに似たものですか？', algorithm: 'genre_match', eval_value: 'パンに似た' },
      { content: '焼き物ですか？', algorithm: 'genre_match', eval_value: '焼き物' },
      { content: 'スープですか？', algorithm: 'genre_match', eval_value: 'スープ' },
      { content: '任天堂の機器ですか？', algorithm: 'genre_match', eval_value: '任天堂の機器' },
      { content: 'キノコが出てきますか？', algorithm: 'genre_match', eval_value: 'キノコ' },
      { content: 'イカが出てきますか？', algorithm: 'genre_match', eval_value: 'イカ' },
      { content: 'ロールプレイングですか？', algorithm: 'genre_match', eval_value: 'ロールプレイング' },
      { content: 'かわいいものですか？', algorithm: 'genre_match', eval_value: 'かわいい' },
      { content: '登場人物が動物ですか？', algorithm: 'genre_match', eval_value: '動物' },
      { content: '絵がありますか？', algorithm: 'genre_match', eval_value: '絵' },
      { content: '活字がありますか？', algorithm: 'genre_match', eval_value: '活字' },
      { content: '勉強に関係ありますか？', algorithm: 'genre_match', eval_value: '勉強' },
      { content: 'シリーズものが多いですか？', algorithm: 'genre_match', eval_value: 'シリーズ' },
      { content: '海外人気ですか？', algorithm: 'genre_match', eval_value: '海外人気' },
      { content: 'チーム戦ですか？', algorithm: 'genre_match', eval_value: 'チーム戦' },
      { content: '子供向けですか？', algorithm: 'genre_match', eval_value: '子供向け' },
      { content: 'ゲーム機器ですか？', algorithm: 'genre_match', eval_value: 'ゲーム機器' },
      { content: 'それは本ですか？', algorithm: 'category_match', eval_value: '本' },
      { content: 'それはゲームですか？', algorithm: 'category_match', eval_value: 'ゲーム' }
    ]
end

if presents.present?
  presents.each do |present|
    Present.create!(present)
  end
end

if questions.present?
    questions.each do |question|
      Question.create!(question)
  end
end
