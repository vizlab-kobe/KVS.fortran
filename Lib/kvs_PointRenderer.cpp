#include <kvs/PointRenderer>


extern "C"
{

kvs::PointRenderer* PointRenderer_new( bool glsl )
{
    if ( glsl ) { return new kvs::glsl::PointRenderer(); }
    return new kvs::PointRenderer();
}

void PointRenderer_delete( kvs::PointRenderer* self )
{
    if ( self ) delete self;
}

void PointRenderer_setAntiAliasingEnabled(
    kvs::PointRenderer* self,
    bool enable )
{
    self->setAntiAliasingEnabled( enable );
}

void PointRenderer_setTwoSideLightingEnabled(
    kvs::PointRenderer* self,
    bool enable )
{
    self->setTwoSideLightingEnabled( enable );
}

} // end of extern "C"
