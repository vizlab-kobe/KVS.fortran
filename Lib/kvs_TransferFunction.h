#include <kvs/TransferFunction>
#include <kvs/DivergingColorMap>


extern "C"
{
kvs::TransferFunction* TransferFunction_new();
void TransferFunction_delete( kvs::TransferFunction* self );
}
