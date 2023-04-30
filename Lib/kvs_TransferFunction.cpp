#include "kvs_TransferFunction.h"
#include <kvs/DivergingColorMap>


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

void TransferFunction_read( kvs::TransferFunction* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void TransferFunction_write( kvs::TransferFunction* self, const char* filename )
{
    self->write( std::string( filename ) );
}

} // end of extern "C"
