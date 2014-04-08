require 'spec_helper'

describe Station do
  it { should have_many :lines }
  it { should have_many :stops }
  it { should have_many :schedules }
end
