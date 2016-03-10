<!doctype html>
<html>
    <head>
        <title>Edumongoose | contest</title>
        <meta charset="utf-8"/>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="assets/plugins/materialize/css/materialize.css">
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/plugins/codemirror/lib/codemirror.css">
        <script src="assets/plugins/codemirror/lib/codemirror.js"></script>
        <script src="assets/plugins/codemirror/mode/xml/xml.js"></script>
        <script src="assets/plugins/codemirror/addon/selection/active-line.js"></script>
        <style type="text/css">
            .CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black;}
        </style>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="icon" type="image/png" href="assets/imgs/edu_icon.png">
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo center"><img src="assets/imgs/EduMongoose_1.png"></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="#">Sign In</a></li>
                    <li><a href="#"><i class="fa fa-sign-in fa-fw"></i>Sign In</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">


            <article>
                <div class="input-field col s12" >
                    <select id="language" onchange="appendSyntax()">
                        <optgroup label="team 1">
                            <option value="0">Select Language</option>
                            <option value="1">C#</option>
                            <option value="2">VB.NET</option>
                            <option value="3">F#</option>
                            <option value="4">Java</option>
                            <option value="5">Python</option>
                            <option value="6">C (gcc)</option>
                            <option value="7">C++ (gcc)</option>
                            <option value="8">PHP</option>
                            <option value="9">PASCAL</option>
                            <option value="10">Objective-C</option>
                            <option value="11">Haskell</option>
                            <option value="12">Ruby</option>
                            <option value="13">Perl</option>
                            <option value="14">Lua</option>
                            <option value="15">Nasm</option>
                            <option value="16">Sql Server</option>
                            <option value="17">Javascript</option>
                            <option value="18">Lisp</option>
                            <option value="19">Prolog</option>
                            <option value="20">Go</option>
                            <option value="21">Scala</option>
                            <option value="22">Scheme</option>
                            <option value="23">Node.js</option>
                            <option value="24">Python 3</option>
                            <option value="25">Octave</option>
                            <option value="26">C (clang)</option>
                            <option value="27">C++ (clang)</option>
                            <option value="28">C++ (vc++)</option>
                            <option value="29">C (vc)</option>
                            <option value="30">D</option>
                            <option value="31">R</option>
                            <option value="32">TCL</option>
                        </optgroup>
                    </select>
                </div>
                <div class="fixed-action-btn " style="bottom: 45px; right: 24px;">
                    <a class="btn-floating btn-large red">
                        <i class="fa fa-paper-plane-o"></i>
                    </a>
                    <ul>
                        <li><a class="btn-floating indigo"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="btn-floating blue accent-1"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="btn-floating blue"><i class="fa fa-linkedin"></i></a></li>
                        <li><a class="btn-floating grey darken-3"><i class="fa fa-github-alt"></i></a></li>
                    </ul>
                </div>


                <form>
                    <textarea id="code" name="code">
                        
                    </textarea>
                </form>

<!--                <script>
                    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                        mode: "javascript",
                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true,
                        matchBrackets: true
                    });</script>-->

            </article>

            <div class="row">
                <form class="col s12">

                    <div class="row">
                        <div class="input-field col s6">
                            <textarea id="input" class="materialize-textarea"></textarea>
                            <label for="icon_prefix2">Input</label>
                        </div>
                        <div class="input-field col s6">
                            <textarea id="output" class="materialize-textarea"></textarea>
                            <label for="icon_prefix2">Output</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="error" class="materialize-textarea"></textarea>
                            <label for="icon_prefix2">Error</label>
                        </div>
                    </div>
                    <a class="waves-effect waves-light btn" id="run">RUN</a>
                </form>
            </div>
        </div>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>


        <script type="text/javascript">
//                                    function appendSyntax() {
//                                        var value = $("#language").val();
//                                        }
                                    $("#run").click(function () {
                                        $("#output").val("");
                                            $("#error").val("");
                                        var language = $("#language").val();
                                        if (language === '0') {
                                            alert("Please Select a langauge");
                                        }
                                        alert($("#code").val());
                                        var to_compile = {
                                            
                                            "LanguageChoice": language,
                                            "Program": $("#code").val(),
                                            "Input": $("#input").val(),
                                            "CompilerArgs": ""
                                        };
                                        $.ajax({
                                            url: "http://rextester.com/rundotnet/api",
                                            type: "POST",
                                            data: to_compile
                                        }).done(function (data) {
                                            var result = JSON.parse((JSON.stringify(data)));
                                            console.log(result);
                                            $("#output").val("\n");
                                            $("#output").val(result.Result);
                                            $("#error").val(result.Errors);
                                        }).fail(function (data, err) {
                                            alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err));
                                        });
                                    });
                                    $(document).ready(function () {
                                        $('select').material_select();
                                    });
                                    $(document).ready(function () {
                                        $('ul.tabs').tabs('select_tab', 'tab_id');
                                    });
        </script>
    </body>
</html>
