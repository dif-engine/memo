/*---------------------------------------------
   iterator で，列の最後の要素だけ特別扱いしたい
 *---------------------------------------------*/

#include <vector>
#include <iostream>
#include <string>

using namespace std;

int main()
{
	typedef vector<string> svector;

	svector a{"first", "second", "third", "fourth", "fifth", "sixth", "last"};

	auto end = ++(a.rbegin());

	for(auto i = a.begin(); i != a.end(); ++i)
	{
		cout << *i << flush;
		if(i != end.base()){ 
			cout << "," << flush; 
		}else{
			cout << ";" << endl;
		}
	}
	return 0;	
}

/*-----------------------------------------------
 出力：
 first,second,third,fourth,fifth,sixth,last;
-----------------------------------------------*/


