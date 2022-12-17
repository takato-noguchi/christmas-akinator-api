case ENV['SECTION']
  when "2"
  presents = Present.create!([
    { title: 'クリスマスケーキ', category: '食べ物', genre: '甘い スイーツ 分けて食べる'},
    { title: 'クッキー', category: '食べ物', genre: '固い スイーツ 焼き物'},
    { title: 'チキン', category: '食べ物', genre: '肉 焼き物'},
    { title: 'ピザ', category: '食べ物', genre: '焼き物 分けて食べる パンに似た'},
    { title: 'クリームシチュー', category: '食べ物', genre: 'スープ 温かい'},
    { title: 'Switch', category: 'ゲーム', genre: '任天堂 ゲーム機器'},
    { title: 'マリオ', category: 'ゲーム', genre: 'キノコが出てくる 赤い帽子 アクションゲーム'},
    { title: 'スプラトゥーン', category: 'ゲーム', genre: 'イカ シューティングゲーム チーム戦'},
    { title: 'ポケットモンスター', category: 'ゲーム', genre: 'ロールプレイング RPG モンスター'},
    { title: '動物の森', category: 'ゲーム', genre: 'かわいい 動物 生活する'},
    { title: '漫画', category: '本', genre: '絵がある 海外人気 シリーズもの'},
    { title: '絵本', category: '本', genre: '絵がある 子供向け かわいい'},
    { title: '参考書', category: '本', genre: '活字 勉強'},
  ])
end
if presents.present?
  presents.each do |present|
    Present.create!(present)
  end
end
