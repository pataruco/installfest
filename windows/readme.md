# Installfest

Durante este curso, utilizaremos una variedad de herramientas para desarrollar aplicaciones web, sin embargo, es importante que todos comencemos a utilizar tecnologías similares para que podamos centrarnos en el aprendizaje

## Pre instalación

La única razón por la que desarrollo Web en Windows es repentinamente tan factible es gracias al trabajo de Microsoft en el subsistema Windows Linux, lo que le brinda una instalación completa de Ubuntu en la línea de comandos

Identifica qué versión de Windows estás utilizando: idealmente debería tener Windows 10 o una versión más reciente.

⚠️**Ten las actualizaciones al día**

## Windows en modo de desarrollo

- En tu PC navega a

  - **Settings** > **Update & security** y en la barra izquierda haz `clic` en **For Developers** y elige en la derecha **Developer mode**, luego acepta el mensaje de advertencia que aparece

- Tomará un tiempo en generar los cambios para Developer mode 💤

- Reinicia Windows 💤

## Instalación del subsistema de Windows para Linux

- Abre **PowerShell** como administrador, haciendo click derecho sobre el programa
- Instala el subsistema de Windows para Linux (**WSL** por su siglas en inglés)
  ```powershell
  dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  ```
- Actualiza **WSL 1** a **WSL 2**
  ```powershell
  dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  ```
- Reinicia Windows 💤
- Ve a la siguiente [dirección](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) y descarga el kernel para **WSL2**
- Abre tu carpeta de **Downloads** y haz doble clic en `wsl_update_x64.exe`
- Abre PowerShell como administrador, haciendo click derecho sobre el programa
- Establece WSL 2 como versión determinada
  ```powershell
  wsl --set-default-version 2
  ```

## Instalación de Linux Ubuntu

- Abre Windows store y busca por **Ubuntu**
- Selecciona la versión **Ubuntu 20.04 LTS** (Long term support) y descárgalo, y luego en el terminal Ubuntu:

  - Una vez instalado el terminal preguntará por un username y password, crealos.
  - Instala y actualiza todos los paquetetes de **Ubuntu**

    ```sh
    sudo apt update && sudo apt upgrade
    ```

  - Cierra el terminal Ubuntu

* Chequea que este instalado
  ```powershell
  wsl --list --verbose
  ```
  - Deberías ver `Ubuntu`
* Establece que la la versión de linux este respaldada por WSL
  ```powershell
  wsl --set-version Ubuntu-20.04 2
  wsl --set-default-version 2
  ```

## Terminal (Hyper)

Para este curso no vamos a usar PowerShell o Prompt de Windows, utilizaremos un emulador llamado **Hyper**

1. Instala [Hyper](https://hyper.is/)
2. Abre el **Hyper** como administrador
3. Abre las preferencias de usuario: <kbd>ctrl</kbd> + <kbd>,</kbd>
4. Desplázate hasta la propiedad `shell:" "` y remplaza el valor por
   ```js
   {
     // ...
     shell: 'C:\\Windows\\System32\\bash.exe',
     // ...
   }
   ```
5. Salva el cambio <kbd>ctrl</kbd> + <kbd>s</kbd>
6. Abre y cierra Hyper y el prompt debe cambiar

## Editor de texto

[Visual Studio Code](https://code.visualstudio.com/Download) es un editor de código fuente ligero pero potente que se ejecuta en tu computadora y está disponible para Windows, MacOS y Linux. Viene con soporte incorporado para JavaScript, TypeScript y Node.js

1. Descarga Visual Studio
2. Ve a la carpeta de descargas y haz doble clic en `VSCodeUserSetup.exe`
3. El _Wizard_ preguntará:
   - Donde instalarlo, selecciona programas
   - Opciones adicionales, **selecciona todas**

## Editor de texto (continuación)

4. Ahora instalaremos algunas extensiones para VSCode, en tu terminal, pegue las siguientes líneas de una en una y presione <kbd>Enter</kbd>.

   ```sh
   code --install-extension naumovs.color-highlight
   code --install-extension zhuangtongfa.material-theme
   code --install-extension wayou.vscode-todo-highlight
   code --install-extension vscode-icons-team.vscode-icons
   code --install-extension dbaeumer.vscode-eslint
   code --install-extension mikestead.dotenv
   code --install-extension esbenp.prettier-vscode
   code --install-extension ritwickdey.liveserver
   code --install-extension ms-vscode-remote.remote-wsl
   code --install-extension ms-vscode-remote.vscode-remote-extensionpack
   ```

## Editor de texto (continuación)

5.  Presiona <kbd>shift</kbd> + <kbd>ctrl </kbd> + <kbd>p</kbd>
6.  Escribe **Open Settings (JSON)** y se abrirá una pestaña, pega lo siguiente:

    ```json
    {
      "editor.codeActionsOnSave": {
        "source.fixAll": true
      },
      "editor.defaultFormatter": "esbenp.prettier-vscode",
      "editor.detectIndentation": false,
      "editor.formatOnSave": true,
      "editor.formatOnPaste": true,
      "editor.formatOnType": true,
      "editor.minimap.enabled": false,
      "editor.tabSize": 2,
      "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe",
      "workbench.colorTheme": "One Dark Pro",
      "workbench.iconTheme": "vscode-icons"
    }
    ```

7.  Salva el archivo presionando <kbd>ctrl</kbd> + <kbd>s</kbd>

## Editor de texto (continuación)

9. Ahora sal de VS Code

## Homebrew Package Manager

### Instalación

El administrador de paquetes nos permite instalar y actualizar software (como Ruby, Git, MongoDB, etc.) desde la línea de comandos:

1. Abre [http://brew.sh/](http://brew.sh/), desplásate hacia abajo, copia y pega el comando en el terminal.
2. Para añadir `brew` al `$PATH` debemos correr lo siguiente:

   - Abre `.bashrc` en VSCode

     ```sh
     code ~/.bashrc
     ```

   - Añade la siguiente linea al final del archivo:
     ```sh
     PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
     ```

## Homebrew Package Manager

### Instalación (continuación)

3. Verifica que esté instalado
   ```sh
   sudo apt-get install build-essential
   echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/<Ubuntu username>/.profile
   eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
   brew install gcc
   brew doctor
   brew update
   ```

## Zsh

### ¿Qué es el Shell?

Entraremos un poco más en detalles sobre el shell más adelante en el curso, pero un shell es una interfaz de usuario muy básica para acceder a los servicios de un sistema operativo.

## Zsh

### bash vs zsh

Bash significa _Bourne-again shell_, refiriéndose a su objetivo como un reemplazo para el Bourne shell que fue desarrollado por Steven Bourne.

## Zsh

Vamos a utilizar otro shell llamado **zsh** porque tiene algunas características adicionales para facilitar nuestro desarrollo web.

La pronunciación de Z en inglés americano es "_si_", por lo que **Z shell** rima con **C shell**, que suena como **seashell**.

## Zsh

### Instalación

1. Escribe `brew install zsh`
2. Escribe `zsh`
   - El _prompt_ debe cambiar
   - Escribe `0` si el mensaje te pregunta sobre `.zshrc`
3. Escribe `exit` para volver a bash
4. Escribe `which zsh` para determinar dónde se ha instalado tu nuevo shell
   - Copia en un lugar seguro el path donde se instaló zsh, ejemplo `/TU/RUTA/HACIA/zsh.`
5. Escribe `sudo vi /etc/shells` y agrega `/TU/RUTA/HACIA/zsh.`.
   - Solo se puede cambiar los shells instalados en `/etc/shells`
6. En una pestaña nueva, escribe `chsh -s /TU/RUTA/HACIA/zsh`, luego cierra y vuelve a el terminal
<!-- 7. ~Escribe `echo $SHELL`. esto debería devolver `/TU/RUTA/HACIA/zsh`~ -->

## Zsh (continuación)

### Instalación

7. Abre el perfil de bash `code ~/.bashrc`
8. Agrega el siguiente codigo al final del archivo
   ```bash
   if [ -t 1 ]; then
   exec zsh
   fi
   ```
9. Abre y cierra el terminal, esto habilitará **zsh** por defecto.

## Oh-My-Zsh

Oh My Zsh es un programa de código abierto para administrar tu configuración de **zsh**. Aquí está el enlace a [GitHub](https://github.com/ohmyzsh/ohmyzsh).

### Instalación

1. En el terminal escribe
   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
2. Reinicia el terminal
3. Escribe
   ```sh
   code ~/.zshrc
   ```

## Oh-My-Zsh (continuación)

4. Añade lo siguiente en el archivo `.zshrc` para hacer VS Code tu editor de text predeterminado
   ```sh
   export EDITOR='code -w -n'
   export PAGER='less -f'
   ```
5. Reinicia el terminal (cierra y abre) y el indicador debe ser una flecha (`→`) y en colores.

## NVM

[NVM](https://github.com/nvm-sh/nvm) es un programa que permite instalar en tu computadora varias versiones de Node

### Instalación

1. En Hyper (terminal) ejecuta este [script](https://github.com/nvm-sh/nvm#manual-install)
   ```sh
    brew install nvm
   ```
2. Abre tu perfil de **zsh** `code ~/.zshrc` y pega lo siguiente:
   ```sh
   export NVM_DIR="$HOME/.nvm"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
   ```

## NVM (continuación)

### Instalación

3. Luego debajo de lo anterior, copia y pega este [código](https://github.com/nvm-sh/nvm#zsh)
4. Lista las versiones de node disponibles, escribiendo `nvm ls-remote`
5. Instala la última version de soporte de largo plazo (**LTS**) `nvm install --lts`
6. Chequea que node está instalado `node --version`

## Git

Git es el sistema de control de versiones que utilizaremos a lo largo del curso. Es una de las herramientas más poderosas que usará como desarrollador.

### Instalación

1. Esto asegura que podamos actualizar Git más fácilmente: `brew install git`
2. Escribe `rehash`
3. Reinicia el terminal
4. Asegúrate de que tienes instalada la última version `git --version`
5. Configura tu nombre y dirección de correo electrónico para los `commits` (asegúrate de usar la dirección de correo electrónico que has registrado en GitHub)
   ```sh
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
   ```

## Git

### Archivos `public/uploads/`, `node_modules` & `bower_components`

De la misma manera, nunca queremos rastrear el contenido de nuestra carpeta de cargas (que generalmente contiene imágenes o medios que hemos cargado durante las pruebas) o nuestros `node_modules` o `bower_components`.

```sh
echo "/public/uploads/\nnode_modules/\nbower_components/" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## `git show` plugin [(Delta)](https://github.com/dandavison/delta)

#### Instalación

1. Escribe `brew install git-delta`
2. Abre el archivo `.gitconfig`, escribiendo `code ~/.gitconfig`
3. Añade lo siguiente al archivo

   ```toml
   [core]
      pager = delta
   [interactive]
      diffFilter = delta --color-only
   [delta]
      features = decorations
      whitespace-error-style = 22 reverse
   [delta "decorations"]
      commit-decoration-style = bold yellow box ul
      file-style = bold yellow ul
      file-decoration-style = none
   ```

4. Escribe `rehash`

## Git

### Configurar el acceso SSH a GitHub

[GitHub](https://www.github.com) es un servicio de alojamiento de repositorios **git** basado en la web. Nos permite mantener una versión remota de nuestros proyectos controlados por **git** . Cuando empujamos (`push`) y tiramos (`pull`) de Git, no queremos tener que iniciar sesión para verificar quiénes somos. Por lo tanto, lo que podemos hacer es generar y usar algo llamado clave **SSH**. Las claves SSH son una forma de identificar computadoras confiables, sin involucrar contraseñas.

1. Primero, necesitamos verificar las claves SSH existentes en tu computadora.

   ```sh
   ls -al ~/.ssh
   ```

2. Verifique el listado del directorio para ver si tienes archivos llamados `id_rsa.pub` o `id_dsa.pub`. Si tiene alguno de esos archivos, puede saltar al paso **'Agregar su clave SSH a Github'**.
3. Genera una llave SSH
   ```sh
    ssh-keygen -t rsa -C "your_email@example.com"
   ```

## Git

### Configurar el acceso SSH a GitHub (continuación)

4. Se te solicitará un archivo para guardar la clave y una frase de contraseña. Presiona <kbd>Enter</kbd> para ambos pasos (nombre predeterminado y sin frase de contraseña)
5. Inicia el **ssh-agent**

   ```sh
    eval "$(ssh-agent -s)"
   ```

6. Añade la nueva llave al **ssh-agent**
   ```sh
    ssh-add ~/.ssh/id_rsa
   ```
7. Agrega tu clave **SSH** a GitHub iniciando sesión en Github, visitando **account settings** y haciendo clic **SSH keys**. Haga clic en **Add SSH key**
8. Copia tu clave al portapapeles con el comando:
   ```sh
    clip.exe < ~/.ssh/id_rsa.pub
   ```

## Git

### Configurar el acceso SSH a GitHub (continuación)

8. En GitHub, crea un título descriptivo para tu clave, pega la clave
   - ⚠️ **_no agregues ni elimines caracteres ni espacios en blanco a la clave_**
9. Haz clic en **Add key**
10. Comprueba que todo funciona:
    ```sh
     ssh -T git@github.com
    ```

## Yarn package manager

Yarn es un administrador de paquetes nos permite instalar y actualizar software en Node

### Instalación

```sh
brew install yarn
rehash
```

## ESLint

### Crear un archivo `.eslintrc.`

- Vamos a definir una serie de reglas para `eslint`

      ```sh
      code ~/.eslintrc
      ```

- Copia y pega el siguiente [texto](https://gist.github.com/pataruco/353b75f87ad809dc96b64174b2201f60#file-eslintrc-json) en el archivo `.eslintrc`
- Salva el archivo con <kbd>ctrl</kbd> + <kbd>S</kbd>.
  ⚠️ Puede ser que veas un error en VScode, no te preocupes que los vamos arreglar pronto

## ESLint

### Instalar paquetes `eslint`

Instala los siguientes pacquetes de **eslint** con **yarn**

```sh
yarn global add eslint@latest eslint-plugin-react babel-eslint eslint-config-prettier
```

## Prettier

### Crear un archivo `.prettierrc`

- Vamos a definir una serie de reglas para `prettier`

      ```sh
      code ~/.prettierrc
      ```

- Copia y pega el siguiente [texto](https://gist.github.com/pataruco/353b75f87ad809dc96b64174b2201f60#file-prettierrc-json) en el archivo `.eslintrc`
- Salva el archivo con <kbd>ctrl</kbd> + <kbd>S</kbd>.
  ⚠️ Puede ser que veas un error en VScode, no te preocupes que los vamos arreglar pronto

## Prettier

### Instalar paquetes `prettier`

Instala los siguientes pacquetes de **eslint** con **yarn**

```sh
yarn global add prettier
```

<img src="https://www.mozilla.org/media/protocol/img/logos/firefox/browser/developer/logo-word-hor-lg.977a1e574948.png" alt="Firefox Developer Edition" style="max-width: 200px;">

Para este curso recomendamos [Firefox Developer Edition](https://www.mozilla.org/en-GB/firefox/developer/)

## Acelera tu cursor

Durante el curso, navegaremos mucho en el teclado. Por defecto, la velocidad del cursor en una PC es demasiado lenta. Aumentemos la velocidad del cursor yendo a **Control panel > Keyboard > Speed**.

Mover ambos al máximo.

### Ejemplo

<input type="range" min="0" max="100" value="100" >

## Cierre

No te preocupes sino recuerdas cómo hacer todo esto. Si necesita configurar una nueva máquina en el futuro, ¡podemos enviarte estas instruccciones!
