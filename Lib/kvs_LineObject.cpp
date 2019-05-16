#include "kvs_LineObject.h"


extern "C"
{

kvs::LineObject* LineObject_new()
{
    return new kvs::LineObject();
}

kvs::LineObject* LineObject_copy( kvs::LineObject* other )
{
//    kvsMessageDebug() << "LineObject_copy is called." << std::endl;
    kvs::LineObject* line = new kvs::LineObject();
    line->shallowCopy( *other );
    return line;
}

void LineObject_delete( kvs::LineObject* self )
{
    if ( self ) delete self;
}

void LineObject_setSize( kvs::LineObject* self, float size) {
    self->setSize(size);
}
}
