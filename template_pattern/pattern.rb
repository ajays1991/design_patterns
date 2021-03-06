class Report
	def initialize
		@title = 'Monthly Report'
		@text = ['Things are going', 'really', 'really well']
	end

	def output_report
		plain_head
		output_start
		output_head
		@text.each do |line|
			output_line(line)
		end
		output_end
	end

	def plain_head
		puts("plain head")
	end

	def output_start
	end


	def output_head
		raise 'called abstract method: output_head'
	end

	def output_body_start
	end

	def output_line(line)
		raise 'called abstract method: output_line'
	end

	def output_body_end
		raise 'called abstract method: output_body_end'
	end

	def output_end
		raise 'called abstract method: output_end'
	end
end


class PlainTextReport < Report

	def output_head
		puts ("**********#{@title}************")
	end

	def output_line(line)
		puts(line)
	end

	def output_body_end
	end

	def output_end
	end
end

class HTMLReport < Report
	def output_start
		puts("<html>")
	end

	def output_head
		puts("	<head>")
		puts("		<title>#{@title}</title>")
		puts("	</head>")
	end

	def output_body_start
		puts("<body>")
	end

	def output_line(line)
		puts("	<p>#{line}</p>")
	end

	def output_body_end
		puts("</body>")
	end

	def output_end
		puts("</html>")
	end
end

report = HTMLReport.new
report.output_report

report = PlainTextReport.new
report.output_report


















########## Drawbacks##
#1. Template pattern is build around inheritance which lead to subclassed tangled up with super class however we design the code.
#2. It limits runtime flexibility. 
######################