test_file = Proc.new { Rails.root.join('spec', 'support', 'files', 'test.jpg') }

FactoryGirl.define do
  factory :card do
		image { fixture_file_upload(test_file.call, 'iamge/jpg') }
  end
end
