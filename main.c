#include "libasm.h"

int main(void){
	const char *str1 = "This is a string\n";
	printf("str: %s\n", str1);
	printf("ft_strlen = %ld | strlen = %ld\n\n", ft_strlen(str1), strlen(str1));
	return 0;
}
