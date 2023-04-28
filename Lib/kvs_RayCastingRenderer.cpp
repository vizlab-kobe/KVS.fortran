#include "kvs_RayCastingRenderer.h"
#include <kvs/TransferFunction>


extern "C"
{

kvs::VolumeRendererBase* RayCastingRenderer_new( bool glsl )
{
    if ( glsl ) { return new kvs::glsl::RayCastingRenderer(); }
    return new kvs::RayCastingRenderer();
}

void RayCastingRenderer_delete( kvs::VolumeRendererBase* self )
{
    if ( self ) delete self;
}

void RayCastingRenderer_setTransferFunction(
    kvs::VolumeRendererBase* self,
    kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
}

} // end of extern "C"
