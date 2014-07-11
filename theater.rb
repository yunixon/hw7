class Actor
  
  attr_accessor :name, :sex, :age, :actions
  
  def initialize(name, sex, age, actions = [])
		@name, @sex, @age, @actions = name, sex, age, actions = []
  end 
  
  # Лучшая роль для выступающего
  def best_role
    tmp_rate = 0
    tmp = nil
    self.actions.each do |a|
      if a.rate > tmp_rate
				tmp_rate = a.rate
        tmp = a
      end
    end
		tmp
  end
  
  # Общая продолжительность выступлений
  def sum_duration
    sum = self.actions.inject(0) { |s, a| s += a.duration }
  end
end

class Role
  
  attr_accessor :name, :sex, :range, :actors, :juri
  
  def initialize(name, sex, range, actors = [], juri = [])
  	@actors = actors || []
  	@juri = juri || []
  	@name = name
  	@sex = sex
  	@range = range
  end
	
  # Подходящие к роли актеры выступают по 1-му разу
  def do_actions
    puts "======== ROLE #{self.name} ========="
    self.actors.each do |a|
      print "Actor: #{a.name} - "
			if a.sex == self.sex && self.range.include?(a.age)
        action = Action.new(self.name, "role " + self.name, rand(10), 'textext', 0)        
        # Присваиваем оценки жюри актеру за выступление по этой роли
				self.juri.each do |j|
					tmp_rate = rate(a, j, action)
					action.rate += tmp_rate
          print "Juri(#{j.sex}) : #{tmp_rate} "
        end
        action.rate = (action.rate/juri.size).to_i
        puts " RATE: " + action.rate.to_s
        # Фиксируем выступление актера с его рейтингом
        a.actions << action
      else
        puts "not suitable"
      end
    end
    puts "========= END role: #{self.name} ========"
  end

	def rate(actor, juri, action)
		return rand(7..10) if juri.sex == "man" && actor.sex == "woman" && (18..25).include?(actor.age)
		return rand(0..7) if juri.sex == "woman" && action.text.split.size < 30
		return rand(0..10)
	end

end

class Juri

  attr_accessor :sex

  def initialize(sex)
    @sex = sex
  end

end

class Action

  attr_accessor :role_name, :theme, :duration, :text, :rate

  def initialize(role_name = '', theme, duration, text, rate)
  	@role_name = role_name || ''
  	@theme = theme
  	@duration = duration
  	@text = text
    @rate = rate
    puts "Action: Role: #{self.role_name} Theme: #{self.theme} Dur: #{self.duration.to_s} Text: #{self.text}"
  end
  
end
