require 'spec_helper'

describe Schedule do
  it { should belong_to :station }
  it { should belong_to :bus }
end
