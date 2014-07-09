class Actor
  
  attr_accessor :name, :sex, :age, :actions
  
  def initialize(name, sex, age, actions = [])
  	@actions = actions || []
  	@name = name
  	@sex = sex
  	@age = age
  end 
  
  # Лучшая роль для выступающего
  def best_role
    tmp_rate = 0
    tmp = nil
    self.actions.each do |a|
      if a.rate > tmp_rate
        tmp = a
      end
    end
    puts "Best role for #{self.name}: " + tmp.role_name
  end
  
  # Общая продолжительность выступлений
  def sum_duration
    sum = 0
    self.actions.each { |a| sum = sum + a.duration }
    puts "Actor #{@name} duration: " + sum.to_s
  end
  
  def age=(age)
    @age = age
  end
  def age
  	@age
  end
  def sex=(sex)
  	@sex = sex
  end
  def sex
  	@sex
  end
  def name=(name)
    @name = name
  end
  def name
    @name
  end
end

class Role
  
  attr_accessor :name, :sex, :range1, :range2, :actors, :juri
  
  def initialize(name, sex, range1, range2, actors = [], juri = [])
  	@actors = actors || []
  	@juri = juri || []
  	@name = name
  	@sex = sex
  	@range1 = range1
  	@range2 = range2
  end
  def name=(name)
    @name = name
  end
  def name
    @name
  end
  def sex=(sex)
  	@sex = sex
  end
  def sex
  	@sex
  end
  def range1=(range1)
  	@range1 = range1
  end
  def range1
  	@range1
  end
  def range2=(range2)
  	@range2 = range2
  end
  def range2
  	@range2
  end

  # Подходящие к роли актеры выступают по 1-му разу
  def do_actions
    puts "======== ROLE #{self.name} ========="
    self.actors.each do |a|
      print "Actor: #{a.name} - "
      if a.sex == self.sex && a.age.between?(self.range1, self.range2)
        action = Action.new(self.name, "role " + self.name, 1 + rand(9), 'textext', 0)        
        # Присваиваем оценки жюри актеру за выступление по этой роли
        self.juri.each do |j|
          tmp_rate = 0
          if j.sex == 'man'
            if a.sex == 'woman' && a.age.between?(18,25)
              tmp_rate = tmp_rate + 7 + rand(3)
            else
              tmp_rate = tmp_rate + 1 + rand(9)
            end
          elsif j.sex == 'woman'
            if action.text.size < 30
              tmp_rate = tmp_rate + 1 + rand(6)
            else
              tmp_rate = tmp_rate + 1 + rand(9)
            end
          else
            puts 'Juri sex error'
          end
          action.rate = action.rate + tmp_rate
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
  
  def theme=(theme)
    @theme = theme
  end
  def theme
    @theme
  end
  def duration=(duration)
    @duration = duration
  end
  def duration
    @duration
  end
  def text=(text)
    @text = text
  end     
  def text
    @text
  end
  def rate=(rate)
    @rate = rate
  end
  def rate
    @rate
  end     
end
