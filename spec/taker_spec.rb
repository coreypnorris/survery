require 'spec_helper'

describe Taker do
  it { should have_many :answers }
  it { should have_many :responses }
  it { should have_many :questions }
  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(50) }
  it { should ensure_length_of(:name).is_at_least(2) }
end
