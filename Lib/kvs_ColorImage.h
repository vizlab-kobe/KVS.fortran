#include <kvs/ColorImage>


extern "C"
{

kvs::ColorImage* ColorImage_new();
kvs::ColorImage* ColorImage_copy( kvs::ColorImage* other );
void ColorImage_delete( kvs::ColorImage* self );
void ColorImage_read( kvs::ColorImage* self, const char* filename );
void ColorImage_write( kvs::ColorImage* self, const char* filename );

} // end of extern "C"
