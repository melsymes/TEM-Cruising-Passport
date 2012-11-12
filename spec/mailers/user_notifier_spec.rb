require "spec_helper"

describe UserNotifier do
  describe "accepted" do
    let(:mail) { UserNotifier.accepted }

    it "renders the headers" do
      mail.subject.should eq("Accepted")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "manager_accepted" do
    let(:mail) { UserNotifier.manager_accepted }

    it "renders the headers" do
      mail.subject.should eq("Manager accepted")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "rejected" do
    let(:mail) { UserNotifier.rejected }

    it "renders the headers" do
      mail.subject.should eq("Rejected")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "expired_user" do
    let(:mail) { UserNotifier.expired_user }

    it "renders the headers" do
      mail.subject.should eq("Expired user")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "expired_manager" do
    let(:mail) { UserNotifier.expired_manager }

    it "renders the headers" do
      mail.subject.should eq("Expired manager")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
