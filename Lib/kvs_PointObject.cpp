#include <kvs/PointObject>
#include <kvs/Message>


extern "C"
{

kvs::PointObject* PointObject_new()
{
    return new kvs::PointObject();
}

kvs::PointObject* PointObject_copy( kvs::PointObject* other, bool move = false )
{
    if ( move ) { return other; }

    auto* point = new kvs::PointObject();
    point->shallowCopy( *other );
    return point;
}

void PointObject_delete( kvs::PointObject* self )
{
    if ( self ) delete self;
}

void PointObject_print( kvs::PointObject* self )
{
    self->print( std::cout );
}

void PointObject_read( kvs::PointObject* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void PointObject_write( kvs::PointObject* self, const char* filename )
{
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

void PointObject_setCoords( kvs::PointObject* self, const float* coords, const int size )
{
    self->setCoords( { coords, size_t( size ) } );
}

} // end of extern "C"
