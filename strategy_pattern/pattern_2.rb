HTMLFormatter = lambda do |context|
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

PlainFormatter = lambda do |context|
	puts("********#{context.title}***********")
	context.text.each do |line|
		puts(line)
	end
end

class Report
	attr_reader :title, :text
	attr_accessor :formatter

	def initialize(&formatter)
		@title = 'Monthly Report'
		@text = ['Things are going', 'really', 'really well']
		@formatter = formatter
	end

	def output_report
		@formatter.call(self)
	end
end


report = Report.new &HTMLFormatter
report.output_report



report = Report.new &PlainFormatter
report.output_report


# In example for state tax calculations one strategy for tax calculations for virginia and one for Tennesse

# Advantages
#1. Its is easy to switch strategies at runtime, we simple swap out the strategy object.