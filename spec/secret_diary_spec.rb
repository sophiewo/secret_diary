require 'secret_diary'

describe SecretDiary do

  it 'should start locked' do
    expect(subject.locked).to eq true
  end

  describe "#unlock" do
    it 'should respond to unlock' do
      expect(subject).to respond_to(:unlock)
    end

    it 'changes locked status to false' do
      expect(subject.unlock).to eq false
    end
  end  

  describe "#lock" do
    it { is_expected.to respond_to(:lock)}
  end
  
  describe '#add_entry' do
    it 'allows and entry to be added to diary' do
      expect(subject).to respond_to(:add_entry).with(1).argument
    end

    it 'raises error if diary is locked' do
      expect { subject.add_entry(1)}.to raise_error "Diary locked, unlock to continue" 
    end

    it 'allows entry to be added to diary' do
      subject.unlock
      expect(subject.add_entry("my Makers Goals are:")).to eq(["my Makers Goals are:"])
    end

    it 'checks diary pages includes an entry' do
      subject.unlock
      subject.add_entry("Today I am happy")
      expect(subject.diary_pages).to include "Today I am happy"
    end   
  end

  describe "#get_entries" do
    it "raises an error if diary is locked" do
      expect {subject.get_entries}.to raise_error "Diary locked, unlock to see what you've written" 
    end

    it 'shows diary entries' do
      subject.unlock
      subject.add_entry("This is my first diary entry")
      expect{ subject.get_entries }.to output {"This is my first diary entry"}.to_stdout
    end
  end
end