/*foo.cc*/

#include "foo.h"
#include <string>
#include <sstream>
#include <vector>

using namespace std;

typedef vector<string> svector_t;

const char*  freshName()
{
  static svector_t  vec;
  static size_t i = 0;

  ostringstream sout;
  sout << "v" << i++ << flush;
  vec.push_back(sout.str());
  auto b = vec.rbegin();
  return b->c_str();
}
