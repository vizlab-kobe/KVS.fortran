#include <kvs/PolygonObject>


extern "C"
{

kvs::PolygonObject* PolygonObject_new();
kvs::PolygonObject* PolygonObject_copy( kvs::PolygonObject* other );
void PolygonObject_delete( kvs::PolygonObject* self );
void PolygonObject_print( kvs::PolygonObject* self );
void PolygonObject_read( kvs::PolygonObject* self, const char* filename );
void PolygonObject_write( kvs::PolygonObject* self, const char* filename );

} // end of extern "C"
