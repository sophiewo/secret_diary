class SecretDiary

  attr_reader :locked, :diary_pages
  #not sure adding diary pages here is good practice even though it satisfys test?

  def initialize
    @locked = true
    @diary_pages = []
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

  def add_entry(entry)
    fail "Diary locked, unlock to continue" if diary_locked?
    @diary_pages << entry
  end

  def get_entries
    fail "Diary locked, unlock to see what you've written" if diary_locked?
    puts @diary_pages
  end

  private

  def diary_locked?
    @locked == true
  end

end