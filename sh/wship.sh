RED=$(printf "\e[31m")
RESET=$(printf "\e[m")
find . -type f -name '*~' -delete -print && echo "${RED}removed tilde files\n${RESET}" &&  mogrify -verbose -format "medium.jpg" -quality 100 -resize 720x800\> contents/portfolio/*/*.png contents/portfolio/*/*.tif ; echo "${RED}generated thumbnails\n${RESET}" && rm -rf harquail.com && echo "${RED}cleaned\n${RESET}"&& wintersmith build && echo "${RED}built\n${RESET}" && ship harquail.com -to s3 && echo "${RED}shipped.\n${RESET}"