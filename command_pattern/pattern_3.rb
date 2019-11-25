require 'fileutils'
require 'byebug'

class Command
	attr_reader :description

	def initialize(description)
		@description = description
	end

	def execute

	end

	def unexecute

	end
end


### Create file command

class CreateFile < Command

	def initialize(path,  contents)
		super("Create file: #{path}")
		@path = path
		@contents = contents
	end

	def execute
		f = File.open(@path, 'w')
		f.write(@contents)
		f.close
	end

	def unexecute
		File.delete(@path)
	end
end

class DeleteFile < Command

	def initialize(path)
		super("Delete File: #{path}")
		@path = path
	end

	def execute
		if File.exists?(@path)
			@contents = File.read(@path)
		end
		File.delete(@path)
	end

	def unexecute
		if @contents
			f = File.open(@path, 'w')
			f.write(@contents)
			f.close
		end
	end
end

## a little bit of composite pattern

class CompositeCommand < Command
	def initialize
		@commands = []
	end

	def add_command(cmd)
		@commands << cmd
	end

	def execute
		@commands.each {|cmd| cmd.execute}
	end

	def unexecute
		@commands.reverse.each {|cmd| cmd.unexecute}
	end

	def description
		description = ""
		@commands.each {|cmd| description += cmd.description + "\n"}
		description
	end
end

cmds = CompositeCommand.new

cmds.add_command(CreateFile.new('file1.txt', "Hello world \n"))
#cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
#cmds.add_command(DeleteFile.new('file1.txt'))

puts("Executing commands")
cmds.execute
puts(cmds.description)
puts("Unexecuting commands")
#cmds.unexecute

# queuing up commands like in yes/no installer

# example of command pattern in ruby codebase
# Active record

class CreateBookTable < ActiveRecord::Migration
	def self.up
		create_table :books do |t|
			t.column :title, :string
			t.column :author, :string
		end
	end

	def self.down
		drop_table :books
	end
end