Factory.define :user do |f|
	f.sequence(:uid) { |n| "UID#{n}" }
end
Factory.define :admin_user, :parent => :user do |f|
	f.administrator true
end	#	parent must be defined first
