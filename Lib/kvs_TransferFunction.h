#include <kvs/TransferFunction>


extern "C"
{

kvs::TransferFunction* TransferFunction_new();
void TransferFunction_delete( kvs::TransferFunction* self );
void TransferFunction_read( kvs::TransferFunction* self, const char* filename );
void TransferFunction_write( kvs::TransferFunction* self, const char* filename );

} // end of extern "C"
