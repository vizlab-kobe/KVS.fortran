#include <kvs/PolygonObject>
#include <kvs/Message>


extern "C"
{

kvs::PolygonObject* PolygonObject_new()
{
    return new kvs::PolygonObject();
}

kvs::PolygonObject* PolygonObject_copy( kvs::PolygonObject* other )
{
    auto* polygon = new kvs::PolygonObject();
    polygon->shallowCopy( *other );
    return polygon;
}

void PolygonObject_delete( kvs::PolygonObject* self )
{
    if ( self ) delete self;
}

void PolygonObject_print( kvs::PolygonObject* self )
{
    self->print( std::cout );
}

void PolygonObject_read( kvs::PolygonObject* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void PolygonObject_write( kvs::PolygonObject* self, const char* filename )
{
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

} // end of extern "C"
