#include <kvs/LineRenderer>


extern "C"
{

kvs::LineRenderer* LineRenderer_new( bool glsl )
{
    if ( glsl ) { return new kvs::glsl::LineRenderer(); }
    return new kvs::LineRenderer();
}

void LineRenderer_delete( kvs::LineRenderer* self )
{
    if ( self ) delete self;
}

void LineRenderer_setAntiAliasingEnabled(
    kvs::LineRenderer* self,
    bool enable )
{
    self->setAntiAliasingEnabled( enable );
}

} // end of extern "C"
