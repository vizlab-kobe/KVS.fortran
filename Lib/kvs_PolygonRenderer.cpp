#include <kvs/PolygonRenderer>


extern "C"
{

kvs::PolygonRenderer* PolygonRenderer_new( bool glsl )
{
    if ( glsl ) { return new kvs::glsl::PolygonRenderer(); }
    return new kvs::PolygonRenderer();
}

void PolygonRenderer_delete( kvs::PolygonRenderer* self )
{
    if ( self ) delete self;
}

void PolygonRenderer_setAntiAliasingEnabled(
    kvs::PolygonRenderer* self,
    bool enable )
{
    self->setAntiAliasingEnabled( enable );
}

void PolygonRenderer_setTwoSideLightingEnabled(
    kvs::PolygonRenderer* self,
    bool enable )
{
    self->setTwoSideLightingEnabled( enable );
}

} // end of extern "C"
