FILE=$(pwd)/hexjava.source

OUTPUT=hexjavaascii.converted

get_hex(){
	awk -F 'HEXTORAW\(' '{print $2}'| awk -F '\)' '{print $1}' | sed "s/'//g";
}
while read l;
do 
	echo -e '\n==========Hex String==============' >> $OUTPUT;
	echo $l >> $OUTPUT;
	echo -e '\n----------Source Code-------------' >> $OUTPUT;
	echo $l| get_hex | xxd -r -p >> $OUTPUT;
done < $FILE
