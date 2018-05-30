
class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = due_date
  end

#reader
  def due_date
    @due_date
  end

# writer
  def due_date=(date)
    @due_date = date
  end

  def lent_out?
    @@on_loan.each do |book|
      if book == self
        return true
      else
        return false
      end
    end
  end
  # binding.pry

  def borrow
    if self.lent_out? == true
      return false
    else
      @due_date = Time.new
      @@on_loan << self
      @@on_shelf.delete(self)
      return true
    end
  end


  def return_to_lib
    if self.lent_out? == false
      return false
    else
      @@on_shelf << self
      @@on_loan.delete(self)
      @due_date = nil
      return true
    end
  end


  def self.create(title, author, isbn)
    new_book = self.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end


  def self.current_due_date
    @due_date = Time.now + 604800
    return @due_date
  end


  def self.overdue_books
    overdue_books = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        overdue_books << book
      end
      return overdue_books
    end
  end

  def self.browse
    return @@on_shelf.sample
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end
end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")


puts Book.browse.inspect
puts "------"
puts Book.available.inspect
puts "----"

puts Book.borrowed.inspect
puts "----"

aint_i.borrow
puts aint_i.lent_out?
# sister_outsider.borrow
puts sister_outsider.lent_out?

puts "------"

puts Book.available.inspect

puts if_they_come.return_to_lib

puts "====="

puts Book.overdue_books
