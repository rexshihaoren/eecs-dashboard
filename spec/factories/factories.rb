
Factory.define :directory do |d|
  d.id 1
  d.name 'proj1'
  d.usage 6
  d.quota 10
end

Factory.define :usage do |u|
	u.user = 'fox'
	u.directory = 'proj1'
	u.date = '11/11/13'
	usage = 100
	rate = 10


