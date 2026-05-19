#include "Fallout5GameMode.h"
#include "Fallout5Character.h"

AFallout5GameMode::AFallout5GameMode()
{
	DefaultPawnClass = AFallout5Character::StaticClass();
}
