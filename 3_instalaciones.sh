#!/bin/bash
function 3_instalaciones() {


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
#	    dpkg -s lsb-release > /dev/null 2>&1  			#revisa si se encuentra istalado

#	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
#	    	
#	        then
#	            echo "lsb-release not installed, installing..."  
#	            sudo apt-get install lsb-release -y	> /dev/null 2>&1	#te instalara el paquete
 #               else
#	            echo    "lsb-release Installed"
#	    fi
#            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 #           echo \
  #          "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   #         $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ; sudo apt-get update > /dev/null 2>&1
	#    dpkg -s ca-certificates > /dev/null 2>&1 			#revisa si se encuentra istalado
#
#	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
#	
#	        then
#	            echo "ca-certificates not installed, installing..."  
#	            sudo apt-get install ca-certificates -y > /dev/null 2>&1		#te instalara el paquete
#	
#	        else
#	            echo    "ca-certificates Installed"
#	    fi
#	    dpkg -s containerd.io > /dev/null 2>&1 			#revisa si se encuentra istalado
#
#	    
#	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
#	
#	        then
#	            echo "containerd.io not installed, installing..."  
#	            sudo apt-get install containerd.io -y > /dev/null 2>&1	#te instalara el paquete
#	
#	        else
#	            echo    "containerd.io Installed"
#	    fi
#	    
#	    dpkg -s docker-ce > /dev/null 2>&1 			#revisa si se encuentra istalado
#
#	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
#	
#	        then
#	            echo "Docker not installed, installing..."   
#	            sudo apt-get install docker-ce -y > /dev/null 2>&1	#te instalara el paquete
#	
#	        else
 #                   echo "Docker Installed"
#
 #           fi
#	    dpkg -s docker-ce-cli > /dev/null 2>&1  			#revisa si se encuentra istalado
#
#	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
#	
#	        then
#	            echo "Docker utilities not installed, installing..."  
#	            sudo apt-get install docker-ce-cli -y > /dev/null 2>&1	#te instalara el paquete
#		    
#
#	        else
#	            echo    "Docker utilities Installed"
 #           fi
}
