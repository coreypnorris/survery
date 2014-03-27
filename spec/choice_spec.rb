require 'spec_helper'

describe Choice do
  it { should belong_to :question }
  it { should have_many :answers }
  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_most(50) }
  it { should ensure_length_of(:description).is_at_least(2) }
end
