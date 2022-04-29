#!/bin/bash
instalaciones() {
	    sudo apt-get update	> /dev/null 2>&1				#te hara una actualizacion 
            dpkg -s unzip > /dev/null 2>&1 			#revisa si se encuentra istalado
	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "UNZIP not installed, installing..."  
	            sudo apt-get install unzip -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "UNZIP Installed"
	    fi
	    
	    dpkg -s curl > /dev/null 2>&1  			#revisa si se encuentra istalado
	    
	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "curl not installed, installing..."  
	            sudo apt-get install curl -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "curl Installed"
	    fi
	    dpkg -s gnupg > /dev/null 2>&1  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "gnupg not installed, installing..."  
	            sudo apt-get install gnupg -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "gnupg Installed"
	    fi
	    clear
}
