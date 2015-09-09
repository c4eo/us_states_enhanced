require 'us_states_enhanced'

describe State do
  describe ".normalize" do
    specify { State.normalize("Alabama").should == "AL" }
    specify { State.normalize("AL").should == "AL" }
    specify { State.normalize("texas").should == "TX" }
    specify do
      expect { State.normalize("south") }.to raise_error(State::InvalidState)
    end
    specify { State.normalize("tx").should == "TX" }
  end

  describe ".member?" do
    specify { State.member?("AL").should be_true }
    specify { State.member?("XT").should be_false }
    specify { State.member?("Alabama").should be_true }
  end
end
