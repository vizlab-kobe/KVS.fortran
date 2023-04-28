#include <kvs/LineRenderer>


extern "C"
{

kvs::LineRenderer* LineRenderer_new( bool glsl = true );
void LineRenderer_delete( kvs::LineRenderer* self );
void LineRenderer_setAntiAliasingEnabled( kvs::LineRenderer* self, bool enable );

} // end of extern "C"

