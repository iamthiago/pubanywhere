<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en-US">

<jsp:include page="includes/css-include.jsp"/>

<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            
            <!-- BREADCRUMB -->
            <jsp:include page="includes/breadcrumb-include.jsp"/>

            <!-- HEADER -->
            <jsp:include page="includes/header-include.jsp"/>

            <!-- NAVIGATION -->
            <jsp:include page="includes/navigator-include.jsp"/>

            <!-- CONTENT -->
            <div id="content"><div class="container">
    <div id="main">
        <h1 class="page-header">Grid system</h1>
        <div class="row">
            <div class="span6">
                <h2>1/2</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
            <div class="span6">
                <h2>1/2</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
        </div>
            <hr>
            <div class="row">
                <div class="span4">
                    <h2>1/3</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                    </p></div>
                <div class="span4">
                    <h2>1/3</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                    </p></div>
                <div class="span4">
                    <h2>1/3</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                    </p></div>
            </div>
            <hr>
            <div class="row">
                <div class="span8">
                    <h2>2/3</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                    </p></div>
                <div class="span4">
                    <h2>1/3</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis.
                    </p></div>
            </div>
            <hr>
            <div class="row">
                <div class="span3">
                    <h2>1/4</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span3">
                    <h2>1/4</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span3">
                    <h2>1/4</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span3">
                    <h2>1/4</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
            </div>
            <hr>
            <div class="row">
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
                <div class="span2">
                    <h2>1/6</h2>
                    <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                    </p></div>
            </div>
        </div><div class="field-item even" property="content:encoded"><div class="row">
        <div class="span6">
            <h2>1/2</h2>
            <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
            </p></div>
        <div class="span6">
            <h2>1/2</h2>
            <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
            </p></div>
    </div>
        <hr>
        <div class="row">
            <div class="span4">
                <h2>1/3</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
            <div class="span4">
                <h2>1/3</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
            <div class="span4">
                <h2>1/3</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
        </div>
        <hr>
        <div class="row">
            <div class="span8">
                <h2>2/3</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis lacus at sodales. Sed eget euismod sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ac velit a augue tincidunt sagittis eu ut urna.
                </p></div>
            <div class="span4">
                <h2>1/3</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices. Vivamus suscipit iaculis.
                </p></div>
        </div>
        <hr>
        <div class="row">
            <div class="span3">
                <h2>1/4</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span3">
                <h2>1/4</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span3">
                <h2>1/4</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span3">
                <h2>1/4</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
        </div>
        <hr>
        <div class="row">
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
            <div class="span2">
                <h2>1/6</h2>
                <p>Nunc ac leo odio, ac tincidunt velit. Sed est quam, ornare ut facilisis at, gravida rutrum eros. Vivamus pretium, mauris vel sagittis euismod, lectus libero ornare lorem, non viverra felis dolor sit amet nisl. Integer in massa urna. Quisque tristique augue at augue consequat ultrices.
                </p></div>
        </div>

    </div>
</div>
    </div><!-- /#content -->
</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

</body>
</html>