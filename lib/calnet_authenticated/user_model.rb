class CalnetAuthenticated::User
	cattr_accessor :model
end
Object.class_eval do
	#	MUST BE ACCESSED WITH TRAILING ()
	define_method 'CalnetAuthenticatedUser' do
		CalnetAuthenticated::User.model
	end
end
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

			#	All I want is a reference to the
			#	calling model.

			#	This seems to work and I am surprised.
			#	>> User.object_id
			#	=> 2162702020
			#	>> CalnetAuthenticated::User.object_id
			#	=> 2162702020
			#	The purpose is to allow the user to specify
			#	the model name.  
#			class CalnetAuthenticated::User < self; end
#	=> class definition in method body
#			CalnetAuthenticated::User = Class.new( self )
#	=> dynamic constant assignment
#			eval "CalnetAuthenticated::User = self"
			CalnetAuthenticated::User.model = self
#			Object.class_eval do
##				class << self
#				attr_accessor :calnet_authenticated_user
#				calnet_authenticated_user=self
##				end
#			end
#			$calnet_authenticated_user=self
#			Object.class_eval do
#			define_method 'CalnetAuthenticated::User' do
#				self
#			end
#			end
#	=> just doesn't work
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
