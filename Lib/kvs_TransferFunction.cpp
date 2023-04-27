#include "kvs_TransferFunction.h"


extern "C"
{

kvs::TransferFunction* TransferFunction_new()
{
    return new kvs::TransferFunction( kvs::DivergingColorMap::CoolWarm( 256 ) );
}

void TransferFunction_delete( kvs::TransferFunction* self )
{
    if ( self ) delete self;
}

} // end of extern "C"
