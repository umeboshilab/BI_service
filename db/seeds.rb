# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.create!({
    name: 'hoge',
    code: '0000-0000-0000',
})

Request.create!( # !をつけると例外処理にできるらしい。
    [
        {
            title: 'ディスプレイを一人あたり2枚欲しい',
            message: '1つでは作業スベースが狭くなり、画面遷移が多くなり効率が悪い。集中できない。',
            isChecked: false,
            good: 3,
            group_id: 1,
        },
        {
            title: 'hoge', 
            message: 'fuga', 
            isChecked: false, 
            good: 9, 
            group_id: 1,
        },
        {
            title: '机ごとにパーティションで視界を区切ってほしい', 
            message: 'コロナの飛沫が怖いので。チョロチョロ歩き回っている人がうざい。消音性もありそう。', 
            isChecked: false, 
            good: 12, 
            group_id: 1,
        }
    ]
)

(1..10).each do |i|
    Request.create!({
        title: "タイトル#{i}",
        message: "メッセージ#{i}",
        isChecked: i % 2 == 0,
        good: 10,
        group_id: 1,
    })
end    

User.new({
    name: 'root', 
    email: 'root@email.com',
    password: 'rootpass', 
    password_confirmation: 'rootpass',
    group_id: 1,
}).save!

User.new({    
    name: 'test',
    email: 'test@email.com',
    password: 'testpass',
    password_confirmation: 'testpass',
}).save!

User.new({    
    name: 'general',
    email: 'general@email.com',
    password: 'generalpass',
    password_confirmation: 'generalpass',
    group_id: 1,
}).save!

HostUser.create!(
    [
        {
            user_id: 1,
            position: 'CEO',
        },
        {
            user_id: 2,
            position: 'sugoi',
        },
    ]
)

flag = true
Request.where(isChecked: true).each do |user|
    Task.create({
        request_id: user.id,
        host_user_id: flag ? 2 : 1,
        comment: flag ? '承認' : '否承認',
        isAccepted: flag,
        isDone: false,
        group_id: 1,
    })
    flag = !flag
end