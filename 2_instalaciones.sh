         #/bin/bash!
         


function instalaciones(){


# 	   if [ $? -ne 0 ]							
#
#  	      then
#        	    echo "VPN not installed, installing..."  
#        	    sudo apt-get update					
#        	    sudo apt-get install openvpn		
#	
#	        else
#	            echo    "VPN Installed"
#	    fi

	            sudo apt-get update	> /dev/null 2>&1				#te hara una actualizacion 

            dpkg -s unzip &> /dev/null  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "UNZIP not installed, installing..."  
	            sudo apt-get install unzip > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "UNZIP Installed"
	    fi
	    	    	        	dpkg -s curl > /dev/null 2>&1  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "curl not installed, installing..."  
	            sudo apt-get install curl > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "curl Installed"
	    fi
	    	    	        	dpkg -s gnupg > /dev/null 2>&1  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "gnupg not installed, installing..."  
	            sudo apt-get install gnupg > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "gnupg Installed"
	    fi
	    	    	    	        	dpkg -s lsb-release > /dev/null 2>&1  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "lsb-release not installed, installing..."  
	            sudo apt-get install lsb-release > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "lsb-release Installed"
	    fi
	    	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" &
	 	echo \
  	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#	dpkg -s openvpn &> /dev/null
	    	    	    	    	        	dpkg -s ca-certificates &> /dev/null  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "ca-certificates not installed, installing..."  
	            sudo apt-get install ca-certificates > /dev/null 2>&1		#te instalara el paquete
	
	        else
	            echo    "ca-certificates Installed"
	    fi
	    	    	    	        	dpkg -s containerd.io > /dev/null 2>&1 			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "containerd.io not installed, installing..."  
	            sudo apt-get install containerd.io > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "containerd.io Installed"
	    fi
	    
	        dpkg -s docker-ce &> /dev/null  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "Docker not installed, installing..."   
	            sudo apt-get install docker-ce > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "Docker Installed"
	    fi
	    dpkg -s docker-ce-cli &> /dev/null  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "Docker utilities not installed, installing..."  
	            sudo apt-get install docker-ce-cli > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "Docker utilities Installed"
	    fi
}
