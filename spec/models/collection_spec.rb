require "rails_helper"

describe Collection do
	it { should validate_presence_of :title }
end
