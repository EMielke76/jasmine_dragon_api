# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Eric",
            last_name: "Mielke",
            street_address: "123 Fake Street",
            city: "Anytown",
            state: "CO",
            zipcode: "80120",
            password_digest: "29dhj2083hhoi8st7g2" ,
            email: "faker@thisisfake.net")

Subscription.create(user_id: 1,
                    tea_id: "5fa3fd48d5ba620017ec1c09",
                    tea_name: "green",
                    status: "active",
                    frequency: "weekly")
Subscription.create(user_id: 1,
                    tea_id: "5fa3fd48d5ba620017ec1c09",
                    tea_name: "green",
                    status: "active",
                    frequency: "bi_weekly")
Subscription.create(user_id: 1,
                    tea_id: "5fa3fd48d5ba620017ec1c09",
                    tea_name: "green",
                    status: "active",
                    frequency: "monthly")
