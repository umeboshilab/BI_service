# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Request.create!( # !をつけると例外処理にできるらしい。
    [
        {
            title: 'ディスプレイを一人あたり2枚欲しい',
            message: '1つでは作業スベースが狭くなり、画面遷移が多くなり効率が悪い。集中できない。',
            isChecked: false,
            good: 3,
        },
        {
            title: 'hoge', 
            message: 'fuga', 
            isChecked: false, 
            good: 9, 
        },
        {
            title: '机ごとにパーティションで視界を区切ってほしい', 
            message: 'コロナの飛沫が怖いので。チョロチョロ歩き回っている人がうざい。消音性もありそう。', 
            isChecked: false, 
            good: 12, 
        }
    ]
)

Task.create!(
    [
        {    
            request_id: 1, 
            hostUser_id: 1, 
            comment: 'ええやんけ', 
            isAccepted: true, 
            isDone: false, 
        },
        {    
            request_id: 1, 
            hostUser_id: 2, 
            comment: 'うるせえカス',
            isAccepted: false,
            isDone: false,
        }
    ]
)

User.create!(
    [
        {
            name: 'root', 
            password: 'password', 
        },
        {    
            name: 'hage',
            password: 'password',
        }
    ]
)

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