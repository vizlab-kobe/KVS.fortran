#include <kvs/Streamline>
#include <kvs/VolumeObjectBase>
#include <kvs/PointObject>
#include <kvs/TransferFunction>
#include <kvs/LineObject>
#include <kvs/StructuredVolumeObject>



extern "C"
{
kvs::Streamline* Streamline_new();
kvs::Streamline* Streamline_copy( kvs::Streamline* other );
void Streamline_delete( kvs::Streamline* self );
kvs::LineObject* Streamline_exec( kvs::Streamline* self,
         kvs::VolumeObjectBase* volume,
         kvs::PointObject* seed_points,
         kvs::TransferFunction* transfer_function );
}
