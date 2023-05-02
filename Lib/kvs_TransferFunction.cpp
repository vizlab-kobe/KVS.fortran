#include <kvs/TransferFunction>
#include <kvs/ColorMap>


extern "C"
{

kvs::TransferFunction* TransferFunction_new()
{
    return new kvs::TransferFunction();
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

void TransferFunction_setColorMap( kvs::TransferFunction* self, const kvs::ColorMap* cmap )
{
    self->setColorMap( *cmap );
}

void TransferFunction_setRange(
    kvs::TransferFunction* self,
    const float min_value,
    const float max_value )
{
    self->setRange( min_value, max_value );
}

} // end of extern "C"
