# SecurityGuardians
 
## Importación de datos desde un archivo CSV a una base de datos
En la primera parte del proyecto se plantea una solución para importar datos desde un archivo CSV a una base de datos MySQL, esta se puede encontrar el la carpeta SecurityGuardiansScript. El script desarrollado en Python permite establecer una conexión con el servidor de base de datos, solicita al usuario el nombre de usuario y la contraseña para iniciar sesión, así como el nombre de la base de datos que se desea crear o actualizar con la información del archivo CSV.

### Requisitos previos
Python instalado en el sistema.\
Paquetes de Python: pandas y mysql-connector-python. Estos paquetes se pueden instalar mediante el siguiente comando:
* pip install pandas mysql-connector-python 

### Configuración
Antes de ejecutar el script, asegúrese de que la base de datos MySQL esté configurada correctamente en su entorno. Asegúrese de tener el servidor MySQL en ejecución y disponer de los siguientes datos:
 * **Nombre de usuario y contraseña:** Se le pedirá ingresar el nombre de usuario y la contraseña para la autenticación en el servidor MySQL.

### Estructura del proyecto
El proyecto tiene la siguiente estructura de archivos:

 * **importDataScript.py**: Este script contiene el código principal para importar los datos desde el archivo CSV a la base de datos MySQL.
 * **SecurityGuardians.csv**: Dentro de la carpeta Data se encuentra el archivo que contiene los datos a importar. Puede reemplazar este archivo con sus propios datos en formato CSV.
 * **EntityRelationShipDiagram.drawio.png**: Dentro de la carpeta EntityRelationshipDiagram de encuentra el diagrama entidad-relación propuesto según la estructura de los datos.

### Diagrama entidad-relación
A continuación se muestra el diagrama entidad-relación propuesto para la estructura de datos que se importarán desde el archivo CSV a la base de datos MySQL.\
![Diagrama entidad-relación](https://github.com/LauraMayorga/SecurityGuardians/blob/main/SecurityGuardiansScript/EntityRelationshipDiagram/EntityRelationshipDiagram.drawio.png)

### Instrucciones de uso
 1. Asegúrese de tener los requisitos previos mencionados anteriormente.
 2. Abra una terminal o línea de comandos y navegue hasta el directorio donde se encuentra el archivo importDataScript.py.
 3. Ejecute el siguiente comando para iniciar el script: 
    * python importDataScript.py
 4. Siga las instrucciones en la terminal para proporcionar el nombre de usuario, contraseña y el nombre de la base de datos.
 5. El script leerá el archivo CSV (SecurityGuardians.csv por defecto) y creará o actualizará la base de datos con la información del archivo.
 6. Revise la salida en la terminal para verificar si la importación se realizó correctamente.

¡Listo! Ahora los datos del archivo CSV se han importado a la base de datos MySQL.

Si necesita importar otros datos o actualizar la base de datos existente, simplemente reemplace el archivo SecurityGuardians.csv con su propio archivo teniendo en cuenta en dejar el archivo con el mismo nombre

---
## API REST para consulta de datos

Por otro lado, este proyecto contiene una API REST desarrollada con TypeScript y utilizando la ORM de Prisma para consultar los datos de la base de datos MySQL, este modulo se puede encontrar en la carpeta securityGuardiansAPI. La combinación de TypeScript y Prisma proporciona un enfoque modular y escalable para la aplicación, además  que gracias a el uso de Prisma se pueden implementar otros motores de base de datos cambiando minimas configuraciones en el codigo.

### Requisitos previos
* Node.js y npm instalados en el sistema.
* Conexión estable a una base de datos MySQL.

### Configuración
 1. Clonar o descargar el repositorio del proyecto.
 2. Navegar hasta el directorio del proyecto.
 3. Ejecutar el siguiente comando para instalar las dependencias:
    * npm install
 4. Configurar la conexión a la base de datos MySQL en el archivo .env, proporcionando los detalles correspondientes:
    * DATABASE_URL=mysql://username:password@localhost:port/database
    
    Por defecto la aplicación estara configuarada con el usuario raiz de pruebas y la base de datos securityguardians, tenga en cuenta que la base de datos a elegir es la misma planteada en la primera parte del proyecto
 
### Estructura del proyecto
 * **src/**
   * controllers/: Contiene los controladores que manejan las solicitudes HTTP y la interacción con la base de datos, el proyecto contiene el controller de la entidad principal guardians, para implementar las otras entidades se sigue una estructura similar a la de este.
   * routes/: Contiene las rutas y la configuración de los endpoints de la API, el proyecto contiene el router de la entidad principal guardians, para implementar las otras entidades se sigue una estructura similar a la de este.
   * index.ts: Punto de entrada de la aplicación.
 * **prisma:** Define el esquema de la base de datos y genera los modelos y funciones necesarios para interactuar con ella utilizando Prisma.
 * **package.json:** Archivo de configuración de npm que contiene las dependencias y los scripts de la aplicación.
 * **.env:** Archivo de configuración de la base de datos

### Instrucciones de uso
 1. Asegúrese de que la base de datos MySQL esté configurada y en ejecución.
 2. Ejecute el siguiente comando para iniciar la aplicación:
    * npm run dev
 3. La API REST estará disponible en http://localhost:8080.
 4. Utilice herramientas como Postman o cURL para realizar solicitudes HTTP a los diferentes endpoints de la API y consultar los datos de la base de datos o desde la pagina de local host añada la ruta /guardians para obtener la información de todos los Security Guardians o para visualizar la información de solo un guardian añada la ruta /guardians/guardiansname , donde guardiansname es el nombre de un guardian.
