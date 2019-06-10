! C interface
interface

   function C_kvs_Tubeline_new () result( this )&
        bind( C, name="Tubeline_new" )
     import
     type( C_ptr ) :: this
   end function C_kvs_Tubeline_new

   function C_kvs_Tubeline_copy( other )&
       bind( C, name="Tubeline_copy" )
     import
     type( C_ptr ) :: C_kvs_Tubeline_copy
     type( C_ptr ), value :: other
   end function C_kvs_Tubeline_copy

   subroutine C_kvs_Tubeline_delete ( this )&
        bind( C, name="Tubeline_delete" )
     import
     type( C_ptr ), value :: this
   end subroutine C_kvs_Tubeline_delete

   function C_kvs_Tubeline_exec( this, line, ndivs) &
        bind( C, name="Tubeline_exec" )
     import
     type( C_ptr ), value :: this
     type( C_ptr ), value :: line
     integer( C_int ), value :: ndivs
     type( C_ptr ) :: C_kvs_Tubeline_exec
   end function C_kvs_Tubeline_exec

end interface
