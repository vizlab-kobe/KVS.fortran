#include <kvs/RayCastingRenderer>


extern "C"
{

kvs::VolumeRendererBase* RayCastingRenderer_new( bool sw = false );
void RayCastingRenderer_delete( kvs::VolumeRendererBase* self );
void RayCastingRenderer_setTransferFunction( kvs::VolumeRendererBase* self, kvs::TransferFunction* tfunc );

} // end of extern "C"
