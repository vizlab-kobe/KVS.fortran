#include <kvs/TransferFunction>
#include <kvs/ColorMap>
#include <kvs/OpacityMap>


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

void TransferFunction_setOpacityMap( kvs::TransferFunction* self, const kvs::OpacityMap* omap )
{
    self->setOpacityMap( *omap );
}

void TransferFunction_setRange(
    kvs::TransferFunction* self,
    const double min_value,
    const double max_value )
{
    self->setRange( static_cast<float>( min_value ), static_cast<float>( max_value ) );
}

} // end of extern "C"
