FactoryGirl.define do
	factory :user do
		username "1337h4ck3r"
		email "1337hacker@gmail.com"
		password "password"
		password_confirmation "password"
	end

	factory :collaborator, class: :user do
		username "5ever"
		email "loveu@gmail.com"
		password "password"
		password_confirmation "password"
	end
end
