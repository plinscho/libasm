#include "libasm.h"
//#include <stdbool.h>

void	check_strlen(const char *s){
	printf("str: %s\n", s);
	printf("ft_strlen = %ld | strlen = %ld\n\n", ft_strlen(s), strlen(s));
	
}

int main(void){
	const char *str1 = "This is a string";
	const char *empty = "";
	check_strlen(str1);
	check_strlen(empty);
	return 0;
}
