#include <kvs/PointObject>


extern "C"
{
kvs::PointObject* PointObject_new();
kvs::PointObject* PointObject_copy( kvs::PointObject* other );
void PointObject_delete( kvs::PointObject* self );
void PointObject_print( kvs::PointObject* self );
void PointObject_read( kvs::PointObject* self, const char* filename );
void PointObject_write( kvs::PointObject* self, const char* filename );
void PointObject_setCoords( kvs::PointObject* self, const float* coords, const int size );
}
