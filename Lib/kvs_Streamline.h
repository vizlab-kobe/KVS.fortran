#include <kvs/Streamline>


extern "C"
{

kvs::Streamline* Streamline_new();
kvs::Streamline* Streamline_copy( kvs::Streamline* other );
void Streamline_delete( kvs::Streamline* self );
void Streamline_setSeedPoints( kvs::Streamline* self, kvs::PointObject* points );
void Streamline_setTransferFunction( kvs::Streamline* self, kvs::TransferFunction* tfunc );
kvs::LineObject* Streamline_exec( kvs::Streamline* self, kvs::VolumeObjectBase* volume );

} // end of extern "C"
