#include <kvs/LineObject>


extern "C"
{
kvs::LineObject* LineObject_new();
kvs::LineObject* LineObject_copy( kvs::LineObject* other );
void LineObject_delete( kvs::LineObject* self );
void LineObject_setSize( kvs::LineObject* self, float size);
}
