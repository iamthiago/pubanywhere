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
<h1 class="page-header">Tabs</h1>

<ul class="tabs nav nav-tabs" id="myTab">
    <li class="active"><a href="#home">Home</a></li>
    <li><a href="#profile">Profile</a></li>
    <li><a href="#messages">Messages</a></li>
    <li><a href="#settings">Settings</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="home">
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th style="width: 150px;">Event</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>show</td>
                <td>This event fires immediately when the <code>show</code> instance method is called.</td>
            </tr>
            <tr>
                <td>shown</td>
                <td>This event is fired when a collapse element has been made visible to the user (will wait for
                    css transitions to complete).
                </td>
            </tr>
            <tr>
                <td>hide</td>
                <td>
                    This event is fired immediately when the <code>hide</code> method has been called.
                </td>
            </tr>
            <tr>
                <td>hidden</td>
                <td>This event is fired when a collapse element has been hidden from the user (will wait for css
                    transitions to complete).
                </td>
            </tr>
            </tbody>
        </table>

        <p>To easily add scrollspy behavior to your topbar navigation, just add <code>data-spy="scroll"</code>
            to the element you want to spy on (most typically this would be the body) and
            <code>data-target=".navbar"</code>
            to select which nav to use. You'll want to use scrollspy with a <code>.nav</code> component.</p>
    </div>
    <div class="tab-pane" id="profile">
        <p class="lead">Within the download you'll find the following file structure and contents, logically
            grouping common assets and providing both compiled and minified variations.</p>
                <pre class="prettyprint"><span class="pln">  bootstrap</span><span class="pun">/</span><span
                        class="pln">
                  </span><span class="pun">├──</span><span class="pln"> css</span><span class="pun">/</span><span
                        class="pln">
                  </span><span class="pun">│</span><span class="pln">   </span><span class="pun">├──</span><span
                        class="pln"> bootstrap</span><span class="pun">.</span><span class="pln">css
                  </span><span class="pun">│</span><span class="pln">   </span><span class="pun">├──</span><span
                        class="pln"> bootstrap</span><span class="pun">.</span><span class="pln">min</span><span
                        class="pun">.</span><span class="pln">css
                  </span><span class="pun">├──</span><span class="pln"> js</span><span class="pun">/</span><span
                        class="pln">
                  </span><span class="pun">│</span><span class="pln">   </span><span class="pun">├──</span><span
                        class="pln"> bootstrap</span><span class="pun">.</span><span class="pln">js
                  </span><span class="pun">│</span><span class="pln">   </span><span class="pun">├──</span><span
                        class="pln"> bootstrap</span><span class="pun">.</span><span class="pln">min</span><span
                        class="pun">.</span><span class="pln">js
                  </span><span class="pun">└──</span><span class="pln"> img</span><span class="pun">/</span><span
                        class="pln">
                      </span><span class="pun">├──</span><span class="pln"> glyphicons</span><span
                        class="pun">-</span><span class="pln">halflings</span><span class="pun">.</span><span
                        class="pln">png
                      </span><span class="pun">└──</span><span class="pln"> glyphicons</span><span
                        class="pun">-</span><span class="pln">halflings</span><span class="pun">-</span><span
                        class="pln">white</span><span class="pun">.</span><span class="pln">png</span></pre>
        <p>This is the most basic form of Bootstrap: compiled files for quick drop-in usage in nearly any web
            project. We provide compiled CSS and JS (<code>bootstrap.*</code>), as well as compiled and minified
            CSS and JS (<code>bootstrap.min.*</code>). The image files are compressed using <a
                    href="http://imageoptim.com/">ImageOptim</a>, a Mac app for compressing PNGs.</p>
    </div>
    <div class="tab-pane" id="messages">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object" data-src="holder.js/64x64" alt="64x64"
                     style="width: 64px; height: 64px;"
                     src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACtElEQVR4Xu2Y3UtqURDFlyYVqQhBQon5koqYiUIElSD951qa+AkGUWDUgxC9KEhqfnfXgOLl3gKP2Xlw5kXO0T2zZ+2Z+eG2NBqNCdbYLCqAVoC2gM6ANZ6B0CGoFFAKKAWUAkqBNVZAMagYVAwqBhWDawwB/TOkGFQMKgYVg4pBxeAaK7A0Bh8fH/H6+orJZIL9/X0Eg0FYLJaZpH8og/v7e+zs7CAWi/313Ve6r8LnV7GWEuDh4QH1eh02m038D4dD+Hw++P1+eaYoqVRK3m9ubuLy8hJWq/XbeluFz+8CGhZgNBohnU7LiSYSCQwGA7y8vMDpdMLj8UjMWq0m72jb29u4uLhAu91GtVrFxsYG4vE43t/fwaS3trYQiURwc3OzsM/5ilu0mw0L0O/3ZbPj8ViS/vj4kBYIBAKyh263i0wmg8PDQ7RaLXQ6HRGKmy2VSmg2m9jd3ZV1/I5Vw/VGfS6a+PT3hgVgb5fLZfHDFmCZ05hEOByWJJl4MplEPp9Hr9ebCTAvHte4XC6cnp5iGZ+/LgBPOJvNSumen5/LKeZyOen1k5MTFItF2O12eL1ePD09SaUcHR3JM+35+Vne087OzqSKlvVpRATDFcAT5wxgb1OA6TMFCIVCqFQq/+yHA/Dq6gqcH9fX17Oq2dvbQzQanfkw4tNI8lxjWABOeFYAT+3g4EA+2ddutxvHx8dgmdOYdKFQkOR40kzu7u4Ob29vcDgcUjmsDg5ArjXq89cFYEAOsNvbWzlRGtuBvcwk542tQQFIAc4FCjKlB4Ug9zlHpjRZ1KcpFJhPkCij8UR/ylbh8397M9wCP5Wo2X5UAL0R0hshvRHSGyGzJ7GZ8ZUCSgGlgFJAKWDmFDY7tlJAKaAUUAooBcyexGbGVwooBZQCSgGlgJlT2OzYSoF1p8AnDSiNnx2jBucAAAAASUVORK5CYII=">
            </a>

            <div class="media-body">
                <h4 class="media-heading">Media heading</h4>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin
                commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum
                nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            </div>
        </div>
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object" data-src="holder.js/64x64" alt="64x64"
                     style="width: 64px; height: 64px;"
                     src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACtElEQVR4Xu2Y3UtqURDFlyYVqQhBQon5koqYiUIElSD951qa+AkGUWDUgxC9KEhqfnfXgOLl3gKP2Xlw5kXO0T2zZ+2Z+eG2NBqNCdbYLCqAVoC2gM6ANZ6B0CGoFFAKKAWUAkqBNVZAMagYVAwqBhWDawwB/TOkGFQMKgYVg4pBxeAaK7A0Bh8fH/H6+orJZIL9/X0Eg0FYLJaZpH8og/v7e+zs7CAWi/313Ve6r8LnV7GWEuDh4QH1eh02m038D4dD+Hw++P1+eaYoqVRK3m9ubuLy8hJWq/XbeluFz+8CGhZgNBohnU7LiSYSCQwGA7y8vMDpdMLj8UjMWq0m72jb29u4uLhAu91GtVrFxsYG4vE43t/fwaS3trYQiURwc3OzsM/5ilu0mw0L0O/3ZbPj8ViS/vj4kBYIBAKyh263i0wmg8PDQ7RaLXQ6HRGKmy2VSmg2m9jd3ZV1/I5Vw/VGfS6a+PT3hgVgb5fLZfHDFmCZ05hEOByWJJl4MplEPp9Hr9ebCTAvHte4XC6cnp5iGZ+/LgBPOJvNSumen5/LKeZyOen1k5MTFItF2O12eL1ePD09SaUcHR3JM+35+Vne087OzqSKlvVpRATDFcAT5wxgb1OA6TMFCIVCqFQq/+yHA/Dq6gqcH9fX17Oq2dvbQzQanfkw4tNI8lxjWABOeFYAT+3g4EA+2ddutxvHx8dgmdOYdKFQkOR40kzu7u4Ob29vcDgcUjmsDg5ArjXq89cFYEAOsNvbWzlRGtuBvcwk542tQQFIAc4FCjKlB4Ug9zlHpjRZ1KcpFJhPkCij8UR/ylbh8397M9wCP5Wo2X5UAL0R0hshvRHSGyGzJ7GZ8ZUCSgGlgFJAKWDmFDY7tlJAKaAUUAooBcyexGbGVwooBZQCSgGlgJlT2OzYSoF1p8AnDSiNnx2jBucAAAAASUVORK5CYII=">
            </a>

            <div class="media-body">
                <h4 class="media-heading">Media heading</h4>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin
                commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum
                nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" data-src="holder.js/64x64" alt="64x64"
                             style="width: 64px; height: 64px;"
                             src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACtElEQVR4Xu2Y3UtqURDFlyYVqQhBQon5koqYiUIElSD951qa+AkGUWDUgxC9KEhqfnfXgOLl3gKP2Xlw5kXO0T2zZ+2Z+eG2NBqNCdbYLCqAVoC2gM6ANZ6B0CGoFFAKKAWUAkqBNVZAMagYVAwqBhWDawwB/TOkGFQMKgYVg4pBxeAaK7A0Bh8fH/H6+orJZIL9/X0Eg0FYLJaZpH8og/v7e+zs7CAWi/313Ve6r8LnV7GWEuDh4QH1eh02m038D4dD+Hw++P1+eaYoqVRK3m9ubuLy8hJWq/XbeluFz+8CGhZgNBohnU7LiSYSCQwGA7y8vMDpdMLj8UjMWq0m72jb29u4uLhAu91GtVrFxsYG4vE43t/fwaS3trYQiURwc3OzsM/5ilu0mw0L0O/3ZbPj8ViS/vj4kBYIBAKyh263i0wmg8PDQ7RaLXQ6HRGKmy2VSmg2m9jd3ZV1/I5Vw/VGfS6a+PT3hgVgb5fLZfHDFmCZ05hEOByWJJl4MplEPp9Hr9ebCTAvHte4XC6cnp5iGZ+/LgBPOJvNSumen5/LKeZyOen1k5MTFItF2O12eL1ePD09SaUcHR3JM+35+Vne087OzqSKlvVpRATDFcAT5wxgb1OA6TMFCIVCqFQq/+yHA/Dq6gqcH9fX17Oq2dvbQzQanfkw4tNI8lxjWABOeFYAT+3g4EA+2ddutxvHx8dgmdOYdKFQkOR40kzu7u4Ob29vcDgcUjmsDg5ArjXq89cFYEAOsNvbWzlRGtuBvcwk542tQQFIAc4FCjKlB4Ug9zlHpjRZ1KcpFJhPkCij8UR/ylbh8397M9wCP5Wo2X5UAL0R0hshvRHSGyGzJ7GZ8ZUCSgGlgFJAKWDmFDY7tlJAKaAUUAooBcyexGbGVwooBZQCSgGlgJlT2OzYSoF1p8AnDSiNnx2jBucAAAAASUVORK5CYII=">
                    </a>

                    <div class="media-body">
                        <h4 class="media-heading">Media heading</h4>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                        sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra
                        turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis
                        in faucibus.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="settings">
        <div class="alert alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <h4>Warning!</h4>

            <p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue.
                Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
        </div>
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Oh snap!</strong> Change a few things up and try submitting again.
        </div>
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Well done!</strong> You successfully read this important alert message.
        </div>
        <div class="alert alert-info">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
        </div>
    </div>
</div>

<h2 class="page-header">Accordion</h2>

<div class="property-detail">
    <div class="accordion" id="accordion2">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                    <span class="sign"></span> Sed dignissim tortor dignissim eros
                </a>
            </div>
            <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <p>Sed dignissim tortor dignissim eros consequat tincidunt id eget diam. Aliquam vestibulum, lorem at vehicula placerat, elit mauris mollis odio, a scelerisque tellus odio at ligula. Sed pretium porttitor erat a egestas. Donec eleifend nibh interdum nunc mattis gravida. Sed semper est id tellus placerat hendrerit. Curabitur sed ipsum et tellus pharetra egestas ut ac diam. Etiam nec risus non est ultrices auctor. Sed at mi sed orci suscipit malesuada non sed justo. In nulla libero, lacinia in suscipit et, rutrum at velit.</p>
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                    <span class="sign"></span> Aliquam vestibulum, lorem at vehicula placerat
                </a>
            </div>
            <div id="collapseTwo" class="accordion-body collapse">
                <div class="accordion-inner">
                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed laoreet scelerisque nisi nec iaculis. Maecenas sed enim neque. Duis semper libero ipsum, eget eleifend urna. Aliquam orci nisl, pulvinar a ornare sed, viverra ullamcorper quam. Etiam tristique lobortis condimentum. Donec at lacus nunc, eget dignissim enim. Maecenas justo erat, scelerisque vitae convallis quis, dignissim quis dui. Donec ultricies auctor purus nec sodales. Nullam rhoncus, mi sed facilisis tristique, metus est convallis erat, a porttitor est augue sed lectus. Sed aliquam mollis erat, lacinia tristique nibh elementum quis. Integer ut elit eu erat viverra fermentum nec vel augue. Donec vel lorem justo. Suspendisse eget ante dui, in mattis dui.</p>
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                    <span class="sign"></span> Nullam sed augue nec quam venenatis
                </a>
            </div>
            <div id="collapseThree" class="accordion-body collapse">
                <div class="accordion-inner">
                    <p>Praesent luctus pulvinar pretium. In lectus risus, pellentesque at cursus sed, tristique vitae odio. Nullam sed augue nec quam venenatis accumsan. Suspendisse arcu diam, gravida at imperdiet non, facilisis ut massa. Cras est neque, pellentesque vitae hendrerit quis, egestas nec odio. Aliquam in ipsum feugiat nunc accumsan ultrices. Nullam ac nibh est. Vivamus id est erat, eu mattis arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas tincidunt felis sed nibh elementum viverra. Nulla facilisis, turpis eget dapibus convallis, nunc justo ultrices eros, id congue dui metus at nisi. Suspendisse potenti. Aliquam vitae consectetur lectus. Nam fermentum ligula a tellus suscipit aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut imperdiet, erat sed mattis consectetur, velit odio blandit nunc, ac molestie sapien nisi a ante.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<h2 class="page-header">Tables</h2>

<div class="property-detail">
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="2">1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <td>Mark</td>
            <td>Otto</td>
            <td>@TwBootstrap</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <td>3</td>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <td>3</td>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-condensed">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <td>3</td>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>
</div>

<h2 class="page-header">Alerts</h2>

<div class="property-detail">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Warning!</strong> Best check yo self, you're not looking too good.
    </div>

    <div class="alert alert-block">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4>Warning!</h4>

        <p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo
            cursus magna, vel scelerisque nisl consectetur et.</p>
    </div>

    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Oh snap!</strong> Change a few things up and try submitting again.
    </div>

    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Well done!</strong> You successfully read this important alert message.
    </div>

    <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
    </div>
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