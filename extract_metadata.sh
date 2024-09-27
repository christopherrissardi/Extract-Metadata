#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
RESET='\e[0m'

echo "

                      +-+-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+
                      |A|T|U|A|L|I|Z|A|N|D|O| |P|A|C|O|T|E|S|
                      +-+-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+-+

                           PROCURANDO POR ATUALIZAÇÕES!

     "

sudo apt install -y lynx
sudo apt update -y
clear

if [ "$#" -lt 2 ]; then
    echo -e "
             ______
           /_____  \ 
          /_____\  \ /     ${BLUE}   ______      _                  _   ${RESET}  __  __      _            _       _   
         /_____/ \/ / /    ${BLUE}  |  ____|    | |                | |  ${RESET} |  \/  |    | |          | |     | | 
        /_____/ /   \//\   ${BLUE}  | |__  __  _| |_ _ __ __ _  ___| |_ ${RESET} | \  / | ___| |_ __ _  __| | __ _| |_ __ _             
        \_____\//\   / /   ${BLUE}  |  __| \ \/ / __| '__/ _  |/ __| __|${RESET} | |\/| |/ _ \ __/ _  |/ _  |/ _  | __/ _  |                    
         \_____/ / /\ /    ${BLUE}  | |____ >  <| |_| | | (_| | (__| |_ ${RESET} | |  | |  __/ || (_| | (_| | (_| | || (_| |        
          \_____/  \ \     ${BLUE}  |______/_/\__\__|_|  \__,_|\___|\__|${RESET} |_|  |_|\___|\__\__,_|\__,_|\__,_|\__\__,_|                 
           \_____\  \                   
            \_____\/                                                                    Created By ${BLUE}Christopher Rissardi


                               SUPPORT: PDF, DOC, DOCX, RAW, XLS, XLSX, PPT, PPRTX E OUTROS ${RESET}

        | Ferramenta criada para encontrar documentos em formatos específicos em um determinado domínio.;
                Após encontrar o documento, a ferramenta irá analisar os metadados dos documentos encontrados"
else
    echo -e "
             ______
           /_____  \ 
          /_____\  \ /     ${BLUE}   ______      _                  _   ${RESET}  __  __      _            _       _   
         /_____/ \/ / /    ${BLUE}  |  ____|    | |                | |  ${RESET} |  \/  |    | |          | |     | | 
        /_____/ /   \//\   ${BLUE}  | |__  __  _| |_ _ __ __ _  ___| |_ ${RESET} | \  / | ___| |_ __ _  __| | __ _| |_ __ _             
        \_____\//\   / /   ${BLUE}  |  __| \ \/ / __| '__/ _  |/ __| __|${RESET} | |\/| |/ _ \ __/ _  |/ _  |/ _  | __/ _  |                    
         \_____/ / /\ /    ${BLUE}  | |____ >  <| |_| | | (_| | (__| |_ ${RESET} | |  | |  __/ || (_| | (_| | (_| | || (_| |        
          \_____/  \ \     ${BLUE}  |______/_/\__\__|_|  \__,_|\___|\__|${RESET} |_|  |_|\___|\__\__,_|\__,_|\__,_|\__\__,_|                 
           \_____\  \                   
            \_____\/                                                                    Created By ${BLUE}Christopher Rissardi${RESET}
    
                                Buscando arquivo ${BLUE}$2${RESET} no no site ${BLUE}$1. ${RESET}Por favor, aguarde!"
    echo ""
    
    lynx --dump "www.google.com/search?q=site:$1+filetype:$2" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > meta
    for url in $(cat meta); do wget -q "$url"; done
    echo ""
    echo ""
    echo ""
    exiftool *.pdf 
    echo ""
    echo ""
    sleep 5
    rm *.$2 && rm index.*
    rm meta
    echo ""
    echo ""
    echo -e "     
    
          ${BLUE}       |\_/|
          ${BLUE}      ( o.o )     Metadados extraídos com sucesso dos arquivos do site $1
          ${BLUE}       > ^ < 
    
    "
fi
