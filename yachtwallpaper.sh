#!/bin/bash


usage()
{
    echo "usage: yachtwallpaper [-f FORMAT ] [-o FILE]] | [-h]]"
}

format=
output=

while [ "$1" != "" ]; do
    case $1 in
        -f | --format )         shift
				case $1 in
				    1 | 01 | 1920x1200 )
					format="01_1920x1200"
					;;
				    2 | 02 | 1680x1050 )
					format="1680x1050"
					;;
				    3 | 03 | 1440x900 )
					format="03_1440x900"
					;;
				    4 | 04 | 1280x800 )
					format="04_1280x800"
					;;
				    5 | 05 | 1920x1080 )
					format="05_1920x1080"
					;;
				    6 | 06 | 1366x768 )
					format="06_1366x768"
					;;
				    7 | 07 | 07_1024x768 )
					format="07_1024x768"
					;;
				    8 | 08 | 08_1280x1024 )
					format="08_1280x1024"
					;;
				    * )
					usage
					exit 1
				esac
                                ;;
        -o | --output )         shift
				output=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

year=$(date +%Y)
month=$(date +%m)

case $month in
    01 )
	month="jan"
	;;
    02 )
	month="feb"
	;;
    03 )
	month="mar"
	;;
    04 )
	month="apr"
	;;
    05 )
	month="mai"
	;;
    06 )
	month="jun"
	;;
    07 )
	month="jul"
	;;
    08 )
	month="aug"
	;;
    09 )
	month="sep"
	;;
    10 )
	month="okt"
	;;
    11 )
	month="nov"
	;;
    12 )
	month="dez"
	;;
    * )
	;;
esac

filename="${month}_${year}_${format}.jpg"
if test -z "$output"
then
    output=$filename
fi

wget "https://www.yacht.de/uploads/media/${filename}" -O ${output}
touch ${output}
