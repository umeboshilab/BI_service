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
            reqestID: 1, 
            userID: 1, 
            comment: 'ええやんけ', 
            isAccepted: true, 
            isDeleted: false, 
            isDone: false, 
            follower: 2 
        },
        {    
            reqestID: 2,
            userID: 1,
            comment: 'うるせえカス',
            isAccepted: false,
            isDeleted: false,
            isDone: false,
            follower: 5
        }
    ]
)

User.create!(
    [
        {
            name: 'root', 
            position: 'CEO', 
            password: 'password', 
        },
        {    
            name: 'hage',
            position: '人事部長',
            password: 'password',
        }
    ]
)