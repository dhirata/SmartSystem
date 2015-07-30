namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    # Need gem to make this work when adding students later: faker
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    require 'factory_girl_rails'

    # Step 1: Create admins and customers
    derek_user = User.new
    derek_user.username = "dhirata"
    derek_user.password = "password"
    derek_user.password_confirmation = "password"
    derek_user.role = "admin"
    derek_user.save!
    derek = customer.new
    derek.first_name = "Derek"
    derek.last_name = "Hirata"
    derek.email = "dhirata@andrew.cmu.edu"
    derek.phone = "310-544-1057"
    derek.user_id = derek_user.id
    derek.active = true
    derek.save!

    # Step 2: Create some companies
    google = FactoryGirl.create(:company,
        name: "Google",
        description: "Google is an American multinational technology company specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, and software.",
        ticker: "GOOG",
        active: true)

    apple = FactoryGirl.create(:company,
      name: "Apple",
      description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, online services, and personal computers.",
      ticker: "AAPL",
      active: true)

    companies = [google, apple]

    # Step 3: For each company, create a set of stock prices
    gf1 = FactoryGirl.create(:financial_data, company: google, stock_price: 624.37, data_date: 3.days.ago.to_date)
    gf2 = FactoryGirl.create(:financial_data, company: google, stock_price: 627.97, data_date: 2.days.ago.to_date)
    gf3 = FactoryGirl.create(:financial_data, company: google, stock_price: 628.00, data_date: 1.days.ago.to_date)
    gf4 = FactoryGirl.create(:financial_data, company: google, stock_price: 631.93, data_date: 0.days.ago.to_date)

    af1 = FactoryGirl.create(:financial_data, company: apple, stock_price: 124.48, data_date: 3.days.ago.to_date)
    af2 = FactoryGirl.create(:financial_data, company: apple, stock_price: 122.83, data_date: 2.days.ago.to_date)
    af3 = FactoryGirl.create(:financial_data, company: apple, stock_price: 123.32, data_date: 1.days.ago.to_date)
    af4 = FactoryGirl.create(:financial_data, company: apple, stock_price: 122.99, data_date: 0.days.ago.to_date)

    # Step 4: For each company, create some twitter data
    gt1 = FactoryGirl.create(:twitter_data, company: google, data_date: Date.today, favorites: 367, retweets: 6956, followers: 12100000, polarity: 0.78)

    at1 = FactoryGirl.create(:twitter_data, company: apple, data_date: Date.today, favorites: 500, retweets: 7000, followers: 13000000, polarity: 0.52)

    # Step 5: Create Smarties
    derek_smarty1 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: apple,
      description: "Due to the inevitable release of the new iPhone, Apple's stock is primed to grow. Buy now.",
      analysis: "buy")

    derek_smarty2 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: google,
      description: "Despite new acquisitions, Google has not made any huge moves. Hold steady for now.",
      analysis: "stay")

    # Step 4: Create 120 customers and their associated users
    # 120.times do
    #   first_name = Faker::Name.first_name
    #   last_name = Faker::Name.last_name
    #   this_user = FactoryGirl.create(:user)
    #   FactoryGirl.create(:customer, user: this_user, first_name: first_name, last_name: last_name)
    # end

    # #Step 5: for each customer associate some addresses
    # all_customers.each do |customer|
    #   billing = FactoryGirl.create(:address, customer: customer, 
    #     recipient: "#{customer.proper_name}",
    #     street_1: "#{Faker::Address.street_address}",
    #     city: "#{Faker::Address.city}",
    #     state: "#{Address::STATES_LIST.to_h.values.sample}",
    #     zip: "#{rand(100000).to_s.rjust(5,"0")}",
    #     is_billing: true)

    #   if rand(3).zero?
    #     address_2 = FactoryGirl.create(:address, customer: customer,
    #       recipient: "James T. Kirk", 
    #       street_1: "#{Faker::Address.street_address}",
    #       city: "#{Faker::Address.city}",
    #       state: "#{Address::STATES_LIST.to_h.values.sample}",
    #       zip: "#{rand(100000).to_s.rjust(5,"0")}")          
    #   end

    #   if rand(4).zero?
    #     address_3 = FactoryGirl.create(:address, customer: customer, 
    #       recipient: "Jean Luc Picard",
    #       street_1: "#{Faker::Address.street_address}",
    #       street_2: "#{Faker::Address.secondary_address}",
    #       city: "#{Faker::Address.city}",
    #       state: "#{Address::STATES_LIST.to_h.values.sample}",
    #       zip: "#{rand(100000).to_s.rjust(5,"0")}")          
    #   end
    # end
    # # Step 6: Create some orders for each customer
    # # create credit cards to be used for order payments
    # next_year = Date.today.year + 1
    # credit_cards = [
    #   CreditCard.new(4123456789012, next_year, 12),
    #   CreditCard.new(4123456789012345, next_year, 12),
    #   CreditCard.new(5123456789012345, next_year, 12),
    #   CreditCard.new(5412345678901234, next_year, 12),
    #   CreditCard.new(6512345678901234, next_year, 12),
    #   CreditCard.new(6011123456789012, next_year, 12),
    #   CreditCard.new(30012345678901, next_year, 12),
    #   CreditCard.new(30312345678901, next_year, 12),
    #   CreditCard.new(341234567890123, next_year, 12),
    #   CreditCard.new(371234567890123, next_year, 12)
    # ]
    # all_customers.each do |customer|
    #   c_address_ids = customer.addresses.map(&:id)
    #   customer_selections = all_items.shuffle
    #   [1,1,1,2,2,2,2,3,3,3,3,4,4,5,6,7,9,10,12].sample.times do |i|
    #   # (1..12).to_a.sample.times do |i|
    #     order = Order.new
    #     order.customer_id = customer.id
    #     order.address_id = c_address_ids.sample
    #     order.date = (5.months.ago.to_date..2.days.ago.to_date).to_a.sample
    #     order.save!
    #     total = 0
    #     [1,1,2,2,2,3,3,4,5,6].sample.times do |j|
    #       this_item = customer_selections.pop
    #       oi = OrderItem.new
    #       oi.item_id = this_item.id
    #       oi.order_id = order.id
    #       oi.quantity = [1,2,3,4].sample
    #       oi.save!
    #       total += oi.subtotal(order.date)
    #     end
    #     # record total and payment
    #     total += order.shipping_costs
    #     order.update_attribute(:grand_total, total)
    #     # set credit card info
    #     credit_card = credit_cards.sample
    #     order.credit_card_number = credit_card.number
    #     order.expiration_year = credit_card.expiration_year
    #     order.expiration_month = credit_card.expiration_month
    #     # pay
    #     order.pay
    #     # ship the items
    #     order.order_items.each{|oi2| oi2.shipped_on = order.date + 1; oi2.save! }
    #     # reset the selection options
    #     customer_selections = all_items.shuffle
    #   end
    # end
  end
end