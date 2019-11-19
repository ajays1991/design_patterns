class Task
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time_required
		0.0
	end
end


class AddDryIngredientsTask < Task

	def initialize
		super('Add dry ingredients')
	end

	def get_time_required
		5.0
	end
end

class MixTask < Task

	def initialize
		super('Mix that batter up')
	end 

	def get_time_required
		10
	end
end

class MakeBatterTask < Task

	def initialize
		super('Make batter')
		@sub_tasks = []
		add_sub_task(AddDryIngredientsTask.new)
		add_sub_task(MixTask.new)
	end

	def add_sub_task(task)
		@sub_tasks << task
	end

	def remove_sub_task(task)
		@sub_tasks.delete(task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each { |task| time += task.get_time_required}
	end
end

class FillPanTask < Task
	def initialize
		super('Filling pan')
	end 

	def get_time_required
		14
	end
end

class BakeTask < Task
	def initialize
		super('Baking')
	end 

	def get_time_required
		100
	end
end

class MakeCakeTask < Task
	def initialize
		super('Make Cake')
		@sub_tasks = []
		add_sub_task(MakeBatterTask.new)
		add_sub_task(FillPanTask.new)
		add_sub_task(BakeTask.new)
	end

	def add_sub_task(task)
		@sub_tasks << task
	end

	def remove_sub_task(task)
		@sub_tasks.delete(task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each { |task| time += task.get_time_required}
	end
end