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
    derek = Customer.new
    derek.first_name = "Derek"
    derek.last_name = "Hirata"
    derek.email = "dhirata@andrew.cmu.edu"
    derek.phone = "310-544-1057"
    derek.user_id = derek_user.id
    derek.active = true
    derek.save!

    # Step 2: Create some companies
    # google = FactoryGirl.create(:company,
    #     name: "Google",
    #     description: "Google is an American multinational technology company specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, and software.",
    #     ticker: "GOOG",
    #     active: true)

    apple = FactoryGirl.create(:company,
      name: "Apple",
      description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, online services, and personal computers.",
      ticker: "AAPL",
      active: true)

    amazon = FactoryGirl.create(:company,
        name: "Amazon",
        description: "Amazon.com, Inc. is an American electronic commerce and cloud computing company with headquarters in Seattle, Washington. It is the largest Internet-based retailer in the United States.",
        ticker: "AMZN",
        active: true)

    disney = FactoryGirl.create(:company,
        name: "Disney",
        description: "The Walt Disney Company, commonly known as Disney, is an American diversified multinational mass media and entertainment conglomerate headquartered at the Walt Disney Studios in Burbank, California.",
        ticker: "DIS",
        active: true)

    netflix = FactoryGirl.create(:company,
        name: "Netflix",
        description: "Netflix, Inc. is an American provider of on-demand Internet streaming media available to viewers in all of North America,[5] Australia, New Zealand, South America and parts of Europe (Denmark, France, Germany, The Netherlands, Norway, Sweden, Finland, Switzerland, Austria, Belgium, Luxembourg, Ireland and United Kingdom),[6] and of flat rate DVD-by-mail in the United States, where mailed DVDs and Blu-ray are sent via Permit Reply Mail. ",
        ticker: "NFLX",
        active: true)

    chipotle = FactoryGirl.create(:company,
        name: "Chipotle",
        description: "Chipotle Mexican Grill, Inc. is a chain of restaurants in the United States, United Kingdom, Canada, Germany, and France, specializing in Mission burritos and tacos.",
        ticker: "CMG",
        active: true)

    mcdonalds = FactoryGirl.create(:company,
        name: "McDonald's",
        description: "McDonald's is the world's largest chain of hamburger fast food restaurants, serving around 68 million customers daily in 119 countries across 35,000 outlets. ",
        ticker: "MCD",
        active: true)

    companies = [apple, amazon, disney, netflix, chipotle, mcdonalds]

    # Step 3: For each company, create a set of stock prices
    # gf1 = FactoryGirl.create(:financial_datum, company: google, stock_price: 624.37, data_date: 3.days.ago.to_date)
    # gf2 = FactoryGirl.create(:financial_datum, company: google, stock_price: 627.97, data_date: 2.days.ago.to_date)
    # gf3 = FactoryGirl.create(:financial_datum, company: google, stock_price: 628.00, data_date: 1.days.ago.to_date)
    # gf4 = FactoryGirl.create(:financial_datum, company: google, stock_price: 631.93, data_date: 0.days.ago.to_date)

    af1 = FactoryGirl.create(:financial_datum, company: apple, stock_price: 124.48, data_date: 3.days.ago.to_date)
    af2 = FactoryGirl.create(:financial_datum, company: apple, stock_price: 122.83, data_date: 2.days.ago.to_date)
    af3 = FactoryGirl.create(:financial_datum, company: apple, stock_price: 123.32, data_date: 1.days.ago.to_date)
    af4 = FactoryGirl.create(:financial_datum, company: apple, stock_price: 122.99, data_date: 0.days.ago.to_date)

    amf1 = FactoryGirl.create(:financial_datum, company: amazon, stock_price: 524.02, data_date: 0.days.ago.to_date)
    df1 = FactoryGirl.create(:financial_datum, company: disney, stock_price: 111.01, data_date: 0.days.ago.to_date)
    nf1 = FactoryGirl.create(:financial_datum, company: netflix, stock_price: 123.03, data_date: 0.days.ago.to_date)
    cf1 = FactoryGirl.create(:financial_datum, company: chipotle, stock_price: 743.93, data_date: 0.days.ago.to_date)
    mf1 = FactoryGirl.create(:financial_datum, company: mcdonalds, stock_price: 99.36, data_date: 0.days.ago.to_date)

    # Step 4: For each company, create some twitter data
    # gt1 = FactoryGirl.create(:twitter_datum, company: google, data_date: Date.today, favorites: 367, retweets: 6956, followers: 12100000, polarity: 0.78)

    at1 = FactoryGirl.create(:twitter_datum, company: apple, data_date: Date.today, favorites: 500, retweets: 7000, followers: 13000000, polarity: 0.52)
    amt1 = FactoryGirl.create(:twitter_datum, company: amazon, data_date: Date.today, favorites: 511, retweets: 7000, followers: 14200000, polarity: 0.72)
    dt1 = FactoryGirl.create(:twitter_datum, company: disney, data_date: Date.today, favorites: 3, retweets: 3000, followers: 4200000, polarity: 0.92)
    nt1 = FactoryGirl.create(:twitter_datum, company: netflix, data_date: Date.today, favorites: 4276, retweets: 10000, followers: 1480000, polarity: 0.75)
    ct1 = FactoryGirl.create(:twitter_datum, company: chipotle, data_date: Date.today, favorites: 130000, retweets: 100000, followers: 638000, polarity: 0.52)
    mt1 = FactoryGirl.create(:twitter_datum, company: mcdonalds, data_date: Date.today, favorites: 2680, retweets: 768000, followers: 2950000, polarity: 0.32)

    # Step 5: Create Smarties
    derek_smarty1 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: apple,
      description: "Due to the inevitable release of the new iPhone, Apple's stock is primed to grow. Recommended to buy now.",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 11, 15, 10, 35),
      category: "Product"
    )

    derek_smarty2 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: apple,
      description: "Details of the new iPhone have leaked. Apple is reinforcing some weak points with this year’s new iteration.",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 10, 20, 32, 48),
      category: "Product"
    )

    derek_smarty3 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: apple,
      description: "Apple announces acquisition of controversal music quality control company.",
      analysis: "sell",
      timestamp: DateTime.new(2015, 8, 11, 5, 23, 18),
      category: "Acquisition"
    )

    derek_smarty4 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: apple,
      description: "Apple announces new head of board of directors.",
      analysis: "hold",
      timestamp: DateTime.new(2015, 8, 11, 12, 34, 59),
      category: "Executive"
    )

    derek_smarty5 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: amazon,
      description: "Amazon gives customers new subscription based service that allows users to receive gift packages.",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 11, 13, 32, 51),
      category: "Product"
    )

    derek_smarty6 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: amazon,
      description: "Amazon lets go of lead managers for development lab.",
      analysis: "sell",
      timestamp: DateTime.new(2015, 8, 9, 1, 53, 12),
      category: "Miscellaneous"
    )

    derek_smarty7 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: disney,
      description: "New Pixar movie announced featuring Tom Cruise",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 9, 3, 34, 15),
      category: "Product"
    )

    derek_smarty8 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: disney,
      description: "Starwars movie set to be delayed for at least a few months.",
      analysis: "hold",
      timestamp: DateTime.new(2015, 8, 11, 12, 31, 59),
      category: "Product"
    )

    derek_smarty9 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: netflix,
      description: "Seinfeld to be featured on Netflix.",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 11, 3, 43, 19),
      category: "Miscellaneous"
    )

    derek_smarty10 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: netflix,
      description: "CEO of Netflix gives speech at Carnegie Mellon University",
      analysis: "buy",
      timestamp: DateTime.new(2015, 8, 10, 15, 45, 04),
      category: "Executive"
    )

    derek_smarty11 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: chipotle,
      description: "Chipotle announces nationwide refill of carnitas.",
      analysis: "hold",
      timestamp: DateTime.new(2015, 8, 11, 12, 32, 13),
      category: "Product"
    )

    derek_smarty12 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: chipotle,
      description: "Chipotle acquires small, Midwest sitdown restuarant chain.",
      analysis: "sell",
      timestamp: DateTime.new(2015, 8, 10, 23, 14, 07),
      category: "Acquisition"
    )

    derek_smarty13 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: mcdonalds,
      description: "E Coli breakout stemming from McDonald's suppliers. Outbreak has affects thousands.",
      analysis: "sell",
      timestamp: DateTime.new(2015, 8, 11, 10, 37, 38),
      category: "Miscellaneous"
    )

    derek_smarty14 = FactoryGirl.create(:smarty, 
      customer: derek,
      company: mcdonalds,
      description: "McDonald's publicly announces sponsorship of Special Olympics.",
      analysis: "hold",
      timestamp: DateTime.new(2015, 8, 10, 21, 15, 43),
      category: "Miscellaneous"
    )

    # derek_smarty2 = FactoryGirl.create(:smarty, 
    #   customer: derek,
    #   company: google,
    #   description: "Despite new acquisitions, Google has not made any huge moves. Hold steady for now.",
    #   analysis: "hold",
    #   timestamp: Date.today,
    #   category: "Acquisition"
    # )

    # derek_smarty3 = FactoryGirl.create(:smarty, 
    #   customer: derek,
    #   company: google,
    #   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse placerat eros tincidunt cursus auctor. Quisque a erat vel sapien feugiat posuere.",
    #   analysis: "sell",
    #   timestamp: Date.today,
    #   category: "Executive"
    # )

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