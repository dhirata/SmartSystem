FactoryGirl.define do
	factory :user do 
		sequence :username do |n|
	      "user#{n}"
	    end
	    password "secret"
	    password_confirmation "secret"
	    role "customer"
	    active true
	end

	factory :customer do 
		association :user
		first_name "John"
		last_name "Doe"
		email "abcd@example.com"
		phone "111-222-3333"
		active true
	end

	factory :company do 
		name "Generic company name"
		description "This company does something"
		ticker "DERP"
		active true
	end

	factory :financial_datum do 
		stock_price 42
		data_date Date.today
		association :company
	end 

	factory :twitter_datum do 
		data_date Date.today
		favorites 100
		retweets 1000
		followers 600
		polarity 0
		association :company
	end

	factory :smarty do
		association :company
		association :customer
		description "After a significant acquisition, this company is on the up and up."
		analysis "hold" 
	end
end