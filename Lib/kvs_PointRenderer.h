#include <kvs/PointRenderer>


extern "C"
{

kvs::PointRenderer* PointRenderer_new( bool glsl = true );
void PointRenderer_delete( kvs::PointRenderer* self );
void PointRenderer_setAntiAliasingEnabled( kvs::PointRenderer* self, bool enable );
void PointRenderer_setTwoSideLightingEnabled( kvs::PointRenderer* self, bool enable );

} // end of extern "C"

