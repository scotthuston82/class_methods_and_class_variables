class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.create(title,author,isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def self.browse
    @@on_shelf.sample
  end

  def lent_out?(book)
    @@on_loan.include?(book)
  end

  def current_due_date(due_date)
    @due_date = Time.now + 700_000
  end

  def borrow
    if Book.available.include?(self)
      @@on_loan << self
      @@on_shelf.delete(self)
      @due_date = Time.now + 700_000
      return true
    else
      return false
    end
  end

  def return_to_library
    if Book.borrowed.include?(self)
      @@on_shelf << self
      @@on_loan.delete(self)
      @due_date = nil
      return true
    end
  end

  def self.over_due
    @@on_loan.each do |book|
      if book.due_date < Time.now
        puts book
      end
    end
  end

  def due_date
    @due_date
  end

  def due_date=(due_date)
    @due_date = due_date
  end
end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

p Book.browse
p Book.available
p Book.borrowed
puts sister_outsider.lent_out?(sister_outsider)
puts sister_outsider.borrow
puts sister_outsider.lent_out?(sister_outsider)
puts sister_outsider.borrow
puts sister_outsider.due_date
p Book.available
p Book.borrowed
p Book.over_due
puts sister_outsider.return_to_library
p sister_outsider.lent_out?(sister_outsider)
p Book.available
p Book.borrowed
