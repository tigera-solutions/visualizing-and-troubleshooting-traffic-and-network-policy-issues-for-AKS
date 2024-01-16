#!/bin/bash

typeset -i OPTION
OPTION=0
KU="/usr/local/bin/kubectl"
BSCRIPTS="tsworkshop/workshop1/.scripts/.blab"
FSCRIPTS="tsworkshop/workshop1/.scripts/.flab"


clear
while [ $OPTION -ne 99 ]
do

  echo ""
  echo " ---------------------------- Break Scripts"
  echo ""
  echo "################################################################################"
  echo "#                                                                              #"
  echo "# 1 - Demo Break Online Boutique - Dynamic Service and Threat Graph            #"
  echo "#                                                                              #"
  echo "# 4 - LAB Break Online Boutique - Flow Visualisation                           #"
  echo "#                                                                              #"
  echo "# 6 - LAB Break Online Boutique - Kibana                                       #"
  echo "#									       #"
  echo "################################################################################"
  echo ""
  echo " ---------------------------- Fix Scripts"
  echo ""
  echo "################################################################################"
  echo "#                                                                              #"
  echo "# 41 - LAB Fix Online Boutique - Flow Visualisation                            #"
  echo "#                                                                              #"
  echo "# 61 - LAB Fix Online Boutique - Kibana                                        #"
  echo "#                                                                              #"
  echo "################################################################################"
  echo ""
  echo "99 - Exit"
  echo ""
  read  -p "Enter the option: " OPTION

  case $OPTION in
	1|4|6)
                $KU replace -f $BSCRIPTS$OPTION".yaml" > /dev/null
                echo ""
                read -p "------------- Press any key to continue"
                clear
                ;;
	41|61)
                $KU replace -f $FSCRIPTS$OPTION".yaml" > /dev/null
                echo ""
                read -p "------------- Press any key to continue"
                clear
                ;;
	99)
                clear
                ;;
	*)
		echo ""
		echo "!!!!!! Invalid Option !!!!!!!"
		sleep 1
		clear
		;;
  esac
done
