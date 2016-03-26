Consiste en verificar la identidad del usuario del nuestro sistema

la forma mas comun es la de usuario/contraseña

*en rails podriamos crear nuestro propio sistema de usuario/contraseña

*o podemos hacerlo de la manera Rails (vamos a usar una gema!)
--la gema que vamos a usar este vez Devise

---Devise esta dividida en modulos que podemos usar en nuestra app 
---cuando las necesitamos
 //Algunas de sus funcionalidades son//

 * podremos recuperar nuestras contraseñas
 * el sistema puede guardar tu cesion en un mismo navegador
 *entre otras


Devise se compone de 10 modulos :)
modulos terminan con able

DatabaseAutenticable: manejar usuarios y contraseñas en base de datos
					  guarda las contraseñas trasnformadas

Omniauthable: Nos permite usar Omniauth (es una gema que nos proporciona
	          un flexible sistema de autenticacion) para iniciar con
			  twitter por ejemplo. lo manejamos a traves de provedores
			  OAuth es un protocolo que nos permite flujos simples
			  de autorizacion para sitios web

Confirmable: cuando un usuario se registra se le envia un correo 
			 para confirmar la cuenta

Recoverable: Para recuperar nuestra cuenta

Registrable: Registro al sistema usando un formulario

Rememberable: Para que se recuerde nuestra sesion en el navegador

Trackable: Registro de la ultima ip que el usuario se conectó
		   como platzi que te cierra la sesion de diferentes ip

Timeoutable: expirable, que el sistema pueda recodar su sesion, 
			 pero luego de un tiempo se cierre por seguridad 

Validatable: Valida la informacion almacenada de usuarios y 
			 contraseñas

Lockable: Limita el numero de intentos erroneos en el sistema
		  Si se exede el limite podemos bloquear la cuenta


Guardar las llaves de twitter por ejemplo (informacion sensible)
dentro de nuestro codigo no es seguro, eso lo podemos gestionar 
con una gema llamada figaro o almacenandolas en config/secrets.yml

podemos usar la gema cancan para poder gestionar los accesos que tienen 
los diferentes usuarios en la aplicacion









