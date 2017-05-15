package ;


import package01.package02.NewClass;

#if macro
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Type.ModuleType;
import haxe.macro.TypeTools;
// import haxe.macro.Type;
import haxe.macro.Expr.ImportExpr;
import haxe.macro.Expr;
import haxe.macro.Type;
//#else
//import package01.package02.AnyClass;

#end




class Main
{
    /*

    public static function onTypeNotFoundCallback( typePathName : String )
    {
        trace( "onTypeNotFoundCallback()" );

        trace( "typePathName: " + typePathName );

        if( typePathName == "package01.package02.NewClass" )
        {
            trace( "::: package01.package02.NewClass scope :::" );

            var type = macro class NewClass { };
            haxe.macro.Context.defineModule( 'package01.package02.NewClass', [ type ] );
        } // if( typePathName == "package01.package02.NewClass" )


        return null;
    } // public static function onTypeNotFoundCallback( typePathName : String )
*/
    #if macro
    public static function compilerDirector() : Void
    {
        trace( "15.05.2017" );

        Context.onAfterTyping( onAfterTypingCallback );

        // Context.onGenerate( onGenerateCallBack );


    } // public static function compilerDirector() : Void

/*

    public static function onGenerateCallBack( allTypes : Array<Type> ) : Void
    {
        trace( "onGenerateCallBack()" );

        for( type in allTypes )
        {
            switch( type )
            {
                // TInst(t:Ref<ClassType>, params:Array<Type>)
                case Type.TInst( clType, _ ) :
                {
                    var classType : ClassType = clType.get();

                    trace( "classType.meta: " + classType.meta.get() );

                    if( classType.module == "package01.package02.NewClassSurrogate" )
                    {
                        trace( "package01.package02.NewClassSurrogate was found." );

                        classType.meta.add(
                                            ":keep",
                                            [],
                                            ( macro null ).pos
                                        );
                        trace( "classType.meta: " + classType.meta.get() );
                    } // if( classType.module == "package01.package02.NewClassSurrogate" )


                } // case Type.TInst( clType, _ ) :
            } // switch( type )

        } // for( type in allTypes )
    } // public static function onGenerateCallBack( allTypes : Array<Type> ) : Void
*/



    public static function onAfterTypingCallback( moduleTypes : Array<ModuleType> ) : Void
    {
        trace( "onAfterTypingCallback()" );
        trace( "moduleTypes.length: " + moduleTypes.length );


        var newClassExists : Bool = false;

        for( moduleType in moduleTypes )
        {
            switch( moduleType )
            {
                case ModuleType.TClassDecl( clType ) :
                {
                    var classType : haxe.macro.Type.ClassType = clType.get();

trace( classType.module );

                    if( classType.module == "package01.package02.NewClass" )
                    {
                        trace( "package01.package02.NewClass was found." );


                        classType.exclude();

                         /*   {   name : "@:native( 'package01.package02.NewClassSurrogate' )",
                                                pos : ( macro null ).pos
                                            } );*/
                      /*  var previousMetaData : Metadata = classType.meta.get();

                        previousMetaData [ previousMetaData.length ] = {    name : ":native",
                                                                            params : [ macro 'package01.package02.NewClassSurrogate'  ],
                                                                            pos : ( macro null ).pos
                                                                        };
*/
                        classType.meta.add( ":native",
                                            [ macro 'package01.package02.NewClassSurrogate'  ],
                                            ( macro null ).pos );

trace( "classType.meta: " + classType.meta.get() );

                        // newClassExists = true;
                    } // if( classType.module == "package01.package02.NewClass" )

                    if( classType.module == "package01.package02.NewClassSurrogate" )
                    {
                        trace( "package01.package02.NewClassSurrogate was found." );
                        newClassExists = true;


                        classType.meta.add(
                                            ":keep",
                                            [],
                                            ( macro null ).pos
                                             );
trace( "classType.meta: " + classType.meta.get() );
                    } // if( classType.module == "package01.package02.NewClassSurrogate" )

                } // case ModuleType.TClassDecl( clPath ) :
                default :
                {}
            } // switch( moduleType )
        } // for( moduleType in moduleTypes )
trace( "" );
        if( !newClassExists )
        {
            var newClassMacro = macro class NewClassSurrogate
            {
                public static var x : String = "Great!";
                public static function callSomething() : Void
                {
                  AnotherClass.traceSomething();
                }
            };

       /*     newClassMacro.meta = [
                {   name : ":keep",
                    // pos : ( macro null ).pos
                    pos : ( macro null ).pos
                }*/

                /*,
                {   name : "@:native( 'package01.package02.NewClass' )",
                    // pos : ( macro null ).pos
                    pos : ( macro null ).pos
                }
            ];
*/
            trace( "newClassMacro.meta: " + newClassMacro.meta );



            var importExpr : ImportExpr =
            {
                // mode:ImportMode
                mode : ImportMode.INormal,
                // path:Array<{pos:Position, name:String}>
                path : [    { pos : ( macro null ).pos, name: "package01" },
                            { pos : ( macro null ).pos, name: "package02" },
                            { pos : ( macro null ).pos, name: "AnotherClass" }
                        ]
            } //var importExpr : ImportExpr =

            //var classType : ClassType = TypeTools.getClass ( cast( newClassMacro, haxe.macro.Type ) );

            // classType.meta.add( "keep", [], Context.currentPos() );

            // moduleTypes [ moduleTypes.length ] = newClassMacro;


trace( newClassMacro );
            Context.defineModule( "package01.package02.NewClassSurrogate", [ newClassMacro ], [ importExpr ] );

var newClassType : haxe.macro.Type = Context.getType( "package01.package02.NewClassSurrogate" );
           trace( "::::::::::::::::: " + newClassType + " :::::::::::::::::" );

switch( newClassType )
{
    case haxe.macro.Type.TInst( cl, _ ) :
    {
        var classType : ClassType = cl.get();
        var fields : Array<ClassField> = classType.fields.get();
        trace( "Fields: " + fields.length );
    } // case haxe.macro.Type.ClassType( cl ) :
    default :
    {}

} // switch( newClassType )

        } // if( !newClassExists )




    } // public static function onAfterTypingCallback( moduleTypes : Array<ModuleType> ) : Void
    #else

    static function main()
    {

        trace( "main()" );
        trace( "main()" );
        trace( "main()" );
        trace( "main()" );

        // trace( "AnotherClass.xyz: " + package01.package02.AnotherClass.xyz );
        trace( "NewClass.x: " + NewClass.x );

        var fields : Array<String> = Type.getClassFields( NewClass );

        for( field in fields )
            trace( field );

        /*    var baseClass : BaseClass = new BaseClass( "Great!" );

        trace( baseClass.string );
        baseClass.traceString();*/




/*



        var baseMap : BaseMap = new Array<BaseClass>();

        baseMap.push( new BaseClass( "Great!" ) );

        trace( baseMap [ 0 ].string );

        trace( "Hier sollte ein\u000aZeilenumbruch stehen." );
*/

    } // static function main()
#end
} // class Main