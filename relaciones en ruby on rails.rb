Rails nos ofrece 6 tipos de relaciones

* belongs_to
	#es una relacion uno a uno, donde declaramos que cada instancia
	#de un modelo 'pertenece' a otro
	#este modelo le pertenece a otro

	class Order < ActiveRecord::Base
		belongs_to :customer
		#la orden le pertenece a un cliente
		#a nivel de base de datos
		#cada uno de los registros de las ordenes
		#va a tener una referencia a un registro 
		#de la tabla de clientes
		#todo registro de orden tiene referencia a cliente
		
	end

* has_one
	#Es una relacion uno a uno donde declaramos que cada instancia
	#de un modelo 'posee' una y solo una instancia del otro modelo
	#también es una relación 1 a 1, un modelo contiene a otro. 
	#Es la contraparte de belongs_to

	class Supplier < ActiveRecord::Base
		has_one :account
		#es una relacion de posecion en donde en este caso el 
		#proveedor tiene 'una' cuenta es decir un registro de 
		#transacciones (compras...)
	end

* has_many
	#de uno a muchos
	#cada instancia de un modelo tiene cero o mas instancias del otro

	class Customer < ActiveRecord::Base
		has_many :orders
		#el cliente tiene varias ordenes y en este caso podriamos
		#decir que que cada una de esas ordenes pertenece a un cliente
		#es de cir en orders tendriamso una relaciono de belongs_to
	end


* has_many :through
	#una relación uno a muchos pero a través de otra entidad. 
	#En bases de datos, esto equivale a tablas intermedias
	#(tercer modelo) encargado de llevar los registros 
	#de que llave de un modelo corresponde con la de otro modelo

	class Physician < ActiveRecord::Base
		has_many :appointments
		#doctores tienen varias citas
		has_many :patients, through: :appointments
	end

	class Appointment < ActiveRecord::Base
		belongs_to :physician
		belongs_to :patient
		#estas relaciones son utiles cuando necesitamos en este
		#tercer modelo agregar algo de logica
	end

	class Patient < ActiveRecord::Base
		has_many :appointments
		#pacientes tienen varias citas
		has_many :physicianss, through: :appointments
	end


* has_one :through
	#Es una relacion de uno a uno haciendo uso de un tercer modelo
	class Supplier < ActiveRecord::Base
		has_one :account
		#tiene una cuenta
		has_one :account_history, through: :account
		#tiene historial de cuenta
	end

	class Account < ActiveRecord::Base
		belongs_to :supplier
		has_one :account_history
	end

	class AccountHistory < ActiveRecord::Base
		belongs_to :account
	end


* has_and_belongs_to_many
	#es una relación muchos a muchos

	class Assembly < ActiveRecord::Base
		has_and_belongs_to_many :parts
	end

	class Part < ActiveRecord::Base
		has_and_belongs_to_many :assemblies
	end