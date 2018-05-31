class Vampire

  @@coven = []
  def self.coven
    @@coven
  end

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def in_coffin
    @in_coffin
  end

  def drank_blood_today
    @drank_blood_today
  end


  def self.create(name, age)
    new_vampire = self.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end


  def self.sunrise
    @@coven= @@coven.select do |vampire|
      vampire.in_coffin == true && vampire.drank_blood_today == true
    end
  end

  def in_coffin=(bool)
    @in_coffin = bool
  end

  def drank_blood_today=(bool)
    @drank_blood_today = bool
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
    end
  end

  def go_home
    @in_coffin = true
  end
end


dracula = Vampire.create("Dracula", 26)
yumee = Vampire.create("Yumee", 21)
sacha = Vampire.create("Sacha", 35)

Vampire.sunset

dracula.drink_blood
sacha.drink_blood
dracula.go_home

Vampire.sunrise
puts Vampire.coven
