class Zombie
# names of zombies
  @@horde = []
# rate at which zombies are spawned
  @@plague_level =  10
  # values that don't change
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength >= @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def encounter
    outran_zombie = self.outrun_zombie?
    survived_attack = self.survive_attack?
    if outran_zombie == true && survived_attack == true
      return "You survived!"
    elsif outran_zombie == true && survived_attack == false
      return "You survived!"
    elsif outran_zombie == false && survived_attack == false
      return "You is ded."
    elsif outran_zombie == false && survived_attack == true
      total_zombies = @@horde.size
      total_zombies += 1
      return "You're a zombie now."
    end
  end

  def outrun_zombie?
    my_speed = rand(@@max_speed)
    if my_speed > @speed
      return true
    else
      return false
    end
  end


  def survive_attack?
    my_strength = rand(@@max_strength)
    if my_strength > @strength
      return true
    else
      return false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def self.some_die_off
    total_zombies = @@horde.size
    total_zombies.times do
      @@horde.delete_at(0)
    end
  end


  def self.spawn
    new_zombies = rand(1..@@plague_level)
    new_zombies.times do
      @@horde << self.new(rand(@@max_speed), rand(@@max_strength))
    end
  end

  def self.increase_plague_level
    return @@plague_level += rand(0..2)
  end


end

puts Zombie.new_day
puts Zombie.all.inspect
puts "---------------------"
zombie1 = Zombie.all[0]
puts zombie1.inspect

puts zombie1.encounter
