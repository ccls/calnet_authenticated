module CalnetAuthenticated::UserModel

	def self.included(base)
		base.extend(PrepMethod)
#		base.send(:include, InstanceMethods)
#		base.class_eval do
#			alias_method_chain :reset_persistence_token, :uniqueness
#		end
	end

	module PrepMethod
		def calnet_authenticated(options={})
			validates_presence_of   :uid
			validates_uniqueness_of :uid

			include CalnetAuthenticated::UserModel::InstanceMethods
			extend  CalnetAuthenticated::UserModel::ClassMethods

			#	This seems to work and I am surprised.
			#	>> User.object_id
			#	=> 2162702020
			#	>> CalnetAuthenticated::User.object_id
			#	=> 2162702020
			#	The purpose is to allow the user to specify
			#	the model name.  
			eval "CalnetAuthenticated::User = self"
		end
	end	#	PrepMethod

	module ClassMethods
		#	Find or Create a user from a given uid, and then 
		#	proceed to update the user's information from the 
		#	UCB::LDAP::Person.find_by_uid(uid) response.
		#	
		#	Returns: user
		def find_create_and_update_by_uid(uid)
			user = self.find_or_create_by_uid(uid)
			person = UCB::LDAP::Person.find_by_uid(uid) 
			user.update_attributes!({
				:displayname     => person.displayname,
				:sn              => person.sn.first,
				:mail            => person.mail.first || '',
				:telephonenumber => person.telephonenumber.first
			})
			user
		end
	end	#	ClassMethods

	module InstanceMethods
	end	#	InstanceMethods
end	#	CalnetAuthenticated::UserModel
require 'active_record'
ActiveRecord::Base.send(:include,CalnetAuthenticated::UserModel)
