require "spec_helper"

describe UserNotifier do
  before(:each) do
    @auser = double('auser')
    @marina = double('aMarina')
    @marina.stub(:name).and_return('Duxton')
    @auser.stub(:name).and_return('Charles')
    @auser.stub(:marina).and_return(@marina)
    @auser.stub(:email).and_return('charles@example.com')
  end

  describe "accepted" do
    let(:mail) { UserNotifier.accepted(@auser) }

    it "renders the headers" do
      mail.subject.should eq("en, email.accepted.subject")
      mail.to.should eq(["charles@example.com"])
      mail.from.should eq(["info@transeuropemarinas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("TransEurope")
    end
  end

  describe "manager_accepted" do
    let(:mail) { UserNotifier.manager_accepted(@auser) }

    it "renders the headers" do
      mail.subject.should eq("en, email.manager_accepted.subject")
      mail.to.should eq(["charles@example.com"])
      mail.from.should eq(["info@transeuropemarinas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("TransEurope")
    end
  end

  describe "rejected" do
    let(:mail) { UserNotifier.rejected(@auser) }

    it "renders the headers" do
      mail.subject.should eq("en, email.rejected.subject")
      mail.to.should eq(["charles@example.com"])
      mail.from.should eq(["info@transeuropemarinas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("TransEurope")
    end
  end

  describe "expired_user" do
    let(:mail) { UserNotifier.expired_user(@auser) }

    it "renders the headers" do
      mail.subject.should eq("en, email.expired_user.subject")
      mail.to.should eq(["charles@example.com"])
      mail.from.should eq(["info@transeuropemarinas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("TransEurope")
    end
  end

  describe "expired_manager" do


    let(:mail) { UserNotifier.expired_manager(@auser) }


    it "renders the headers" do
      mail.subject.should eq("en, email.expired_manager.subject")
      mail.to.should eq(["charles@example.com"])
      mail.from.should eq(["info@transeuropemarinas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("TransEurope")
    end
  end

end
