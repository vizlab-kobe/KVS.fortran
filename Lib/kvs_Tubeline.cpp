#include <kvs/Tubeline>
#include <kvs/LineObject>
#include <kvs/PolygonObject>


extern "C"
{

kvs::Tubeline* Tubeline_new()
{
    return new kvs::Tubeline();
}

kvs::Tubeline* Tubeline_copy( kvs::Tubeline* other )
{
    kvs::Tubeline* line = new kvs::Tubeline();
    line->shallowCopy( *other );
    return line;
}

void Tubeline_delete( kvs::Tubeline* self )
{
    if ( self ) delete self;
}

void Tubeline_setNumberOfDivisions( kvs::Tubeline* self, int ndivs )
{
    self->setNumberOfDivisions( ndivs );
}

kvs::PolygonObject* Tubeline_exec( kvs::Tubeline* self, kvs::LineObject* line )
{
    return self->exec( line );
}

} // end of extern "C"
