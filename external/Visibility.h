/* Dirty hack changing android-sqlite visibility to default */

#ifndef _VISIBILITY_H
#define _VISIBILITY_H

#include <sqlite3.h>

#pragma GCC visibility push(default)
#include "android/sqlite3_android.h"
#pragma GCC visibility pop

#endif

