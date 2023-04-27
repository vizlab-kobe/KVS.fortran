#include <kvs/LineObject>


extern "C"
{

kvs::LineObject* LineObject_new();
kvs::LineObject* LineObject_copy( kvs::LineObject* other );
void LineObject_delete( kvs::LineObject* self );
void LineObject_print( kvs::LineObject* self );
void LineObject_read( kvs::LineObject* self, const char* filename );
void LineObject_write( kvs::LineObject* self, const char* filename );
void LineObject_setSize( kvs::LineObject* self, float size );

} // end of extern "C"
