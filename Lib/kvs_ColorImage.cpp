#include "kvs_ColorImage.h"
#include <kvs/Message>


extern "C"
{

kvs::ColorImage* ColorImage_new()
{
    kvsMessageDebug() << "ColorImage_new is called." << std::endl;
    return new kvs::ColorImage();
}

kvs::ColorImage* ColorImage_copy( kvs::ColorImage* other )
{
    kvsMessageDebug() << "ColorImage_copy is called." << std::endl;
    kvs::ColorImage* image = new kvs::ColorImage();
    image->copy( *other ); // Shallow copy
    return image;
}

void ColorImage_delete( kvs::ColorImage* self )
{
    kvsMessageDebug() << "ColorImage_delete is called." << std::endl;
    if ( self ) delete self;
}

void ColorImage_read( kvs::ColorImage* self, const char* filename )
{
    kvsMessageDebug() << "ColorImage_read is called." << std::endl;
    self->read( std::string( filename ) );
}

void ColorImage_write( kvs::ColorImage* self, const char* filename )
{
    kvsMessageDebug() << "ColorImage_write is called." << std::endl;
    self->write( std::string( filename ) );
}

}
