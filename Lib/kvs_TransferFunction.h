#include <kvs/TransferFunction>


extern "C"
{

kvs::TransferFunction* TransferFunction_new();
void TransferFunction_delete( kvs::TransferFunction* self );
void TransferFunction_read( kvs::TransferFunction* self, const char* filename );
void TransferFunction_write( kvs::TransferFunction* self, const char* filename );
void TransferFunction_setColorMap( kvs::TransferFunction* self, const kvs::ColorMap* cmap );
void TransferFunction_setRange( kvs::TransferFunction* self, const float min_value, const float max_value );

} // end of extern "C"
