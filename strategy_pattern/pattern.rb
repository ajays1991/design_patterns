# Delegate, delegate, delegate
# what if instead of creating subclasses for each variation, we tear out the whole chunk of code and isolate it in its own class.

class Formatter
	def output_report(title, text)
		raise 'abstract method called'
	end
end

class HTMLFormatter < Formatter
	def output_report(context)
		puts("<html>")
		puts("	<head>")
		puts("		<title>#{context.title}</title>")
		puts("	</head>")
		puts("	<body>")
		context.text.each do |line|
			puts("		<p>#{line}</p>")
		end
		puts("	</body>")
		puts("</html>")
	end
end

class PlainFormatter < Formatter
	def output_report(title, text)
		puts("********#{title}***********")
		text.each do |line|
			puts(line)
		end
	end
end

class Report
	attr_reader :title, :text
	attr_accessor :formatter

	def initialize(formatter)
		@title = 'Monthly Report'
		@text = ['Things are going', 'really', 'really well']
		@formatter = formatter
	end

	def output_report
		@formatter.output_report(self)
	end
end


report = Report.new(HTMLFormatter.new)
report.output_report



report = Report.new(PlainFormatter.new)
report.output_report