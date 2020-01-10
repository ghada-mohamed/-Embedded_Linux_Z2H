#!/bin/bash
 clear;


if [ ! -f phonebookDB.txt ];then
touch phonebookDB.txt
fi


 case $1 in 

-i)

      echo "Insert new contact name and number"
      echo "Enter the name: "
      read name
      echo "Enter the phone number: "
      read phone
   
     echo -n     $name >> phonebookDB.txt
     echo -e "\t"$phone >> phonebookDB.txt;;


-v)
      echo " View all saved contacts details"
      cat phonebookDB.txt;;  

-s)
      echo "search by contact name "
      read key
    num=$(grep -ci -w "$key" phonebookDB.txt)


		if [ "$num" != "0" ]; then

			grep $key phonebookDB.txt
              else 
                 echo "sorry dont small us"
                 fi ;;
-e)
>phonebookDB.txt ;;

-d)
   echo "deleted contact"
   read deleted
 sed -i -e "/\<$deleted\>/d" phonebookDB.txt ;;

               
*)


echo "- Insert new contact name and number, with the option "-i" "
echo "- View all saved contacts details, with the option "-v" "
echo "- Search by contact name, with the option "-s"" 
echo "- Delete all records, with "-e""
echo "- Delete only one contact name, with "-d""



	
	esac
