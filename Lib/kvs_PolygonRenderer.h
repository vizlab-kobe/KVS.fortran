#include <kvs/PolygonRenderer>


extern "C"
{

kvs::PolygonRenderer* PolygonRenderer_new( bool glsl = true );
void PolygonRenderer_delete( kvs::PolygonRenderer* self );
void PolygonRenderer_setAntiAliasingEnabled( kvs::PolygonRenderer* self, bool enable );
void PolygonRenderer_setTwoSideLightingEnabled( kvs::PolygonRenderer* self, bool enable );

} // end of extern "C"

