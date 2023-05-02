#include <kvs/ColorImage>
#include <kvs/Message>


extern "C"
{

kvs::ColorImage* ColorImage_new()
{
    return new kvs::ColorImage();
}

kvs::ColorImage* ColorImage_copy( kvs::ColorImage* other )
{
    auto* image = new kvs::ColorImage();
    image->copy( *other ); // Shallow copy
    return image;
}

void ColorImage_delete( kvs::ColorImage* self )
{
    if ( self ) delete self;
}

void ColorImage_read( kvs::ColorImage* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void ColorImage_write( kvs::ColorImage* self, const char* filename )
{
    self->write( std::string( filename ) );
}

} // end of extern "C"
