#include "kvs_Streamline.h"


extern "C"
{

kvs::Streamline* Streamline_new()
{
    return new kvs::Streamline();
}

kvs::Streamline* Streamline_copy( kvs::Streamline* other )
{
//    kvsMessageDebug() << "Streamline_copy is called." << std::endl;
    kvs::Streamline* line = new kvs::Streamline();
    line->shallowCopy( *other );
    return line;
}

void Streamline_delete( kvs::Streamline* self )
{
    if ( self ) delete self;
}

kvs::LineObject* Streamline_exec( kvs::Streamline* self,
        kvs::VolumeObjectBase* volume,
        kvs::PointObject* seed_points,
        kvs::TransferFunction* transfer_function )
{
  self->setSeedPoints(seed_points);
  self->setTransferFunction(*transfer_function);
  return self->exec(volume);
}

}
