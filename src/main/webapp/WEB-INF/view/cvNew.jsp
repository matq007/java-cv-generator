<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="layout/layout.jsp" %>

    <body>

    <%@include file="layout/pageMenu.jsp" %>

    <div class="container-fluid">
      <div class="row-fluid">

        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Zivotopis</li>
              <li><a href="${pageContext.request.contextPath}/dashboard">Hlavna stranka</a></li>
              <li class="nav-header">Moznosti CV</li>
              <li class="active"><a href="${pageContext.request.contextPath}/auth/cv/create">Vytvorit</a></li>
              <li><a href="${pageContext.request.contextPath}/auth/cv/show">Zobrazit</a></li>
              <li><a href="${pageContext.request.contextPath}/auth/cv/edit">Upravit</a></li>
              <li><a href="${pageContext.request.contextPath}/auth/cv/delete">Zmazat</a></li>
              <li class="nav-header">Exportovat CV</li>
              <li><a href="${pageContext.request.contextPath}/auth/export">Prelozit</a></li>
              <li class="nav-header">Nastavenia</li>
              <li><a href="${pageContext.request.contextPath}/auth/changeUsername">Zmenit prihl. meno</a></li>
              <li><a href="${pageContext.request.contextPath}/auth/changePassword">Zmenit prihl. heslo</a></li>
              <li><a href="${pageContext.request.contextPath}/logout">Odhlasit sa</a></li>
            </ul>
          </div><!--/.well -->
        </div>

        <div class="span9">
            <!--<h4><a href="#">Dashboard</a> >> <a href="#"> Zmenit heslo</a></h4>-->
            <h3>Vytvorit nove CV</h3>
            <br />
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <c:out value="${success}"/>
                    <a href="${pageContext.request.contextPath}/dashboard">Vratit sa !!!</a>
                </div>
            </c:if>
            <h6>Policka oznacene * su povinne</h6>
            <h6>Policka oznacene ** su povinne, ak ste vyplnili aspon jedno policko v danej kategorii</h6>
            <form method="post" action="${pageContext.request.contextPath}/auth/cv/create/new">
            <table class="table ">
                <tr>
                    <td>Nazov CV:* </td>
                    <td>
                        <input type="text" name="name" value="<c:out value='${param.name}'/>" required="true" />
                    </td>
                <tr class="success">
                    <td>Osobne udaje </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Pohlavie:* </td>
                    <td>
                        <input type="radio" value="Muz" name="sex" /> &nbsp;Muz<br />
                        <input type="radio" value="Zena" name="sex"/>&nbsp;&nbsp;Zena
                    </td>
                    <c:if test="${not empty sexError}">
                    <div class="alert alert-error">
                        <c:out value="${sexError}"/>
                    </div>
                    </c:if>
                </tr>
                <tr>
                    <td>Meno:* </td>
                    <td><input type="text" name="firstName" value="<c:out value='${param.firstName}'/>" required="true" pattern="[A-Z]([a-z])*"/></td>
                </tr>
                <tr>
                    <td>Priezvisko:* </td>
                    <td><input type="text" name="surname" value="<c:out value='${param.surname}'/>" required="true" pattern="[A-Z]([a-z])*"/></td>
                </tr>
                <tr>
                    <td>Titul(y) pred menom: </td>
                    <td><input type="text" name="titleBefore" value="<c:out value='${param.titleBefore}'/>" /></td>
                </tr>
                <tr>
                    <td>Titul(y) za menom: </td>
                    <td><input type="text" name="titleAfter" value="<c:out value='${param.titleAfter}'/>" /></td>
                </tr>
                <tr>
                    <td>Datum narodenia:* </td>
                    <td>
                        <input type="text" name="birthdayDay" value="<c:out value='${param.birthdayDay}'/>" style="width: 30px;" required="true" pattern="[1-9]|(0[1-9])|([1-2][0-9])|(3[0-1])"/>
                        . &nbsp;<input type="text" name="birthdayMonth" value="<c:out value='${param.birthdayMonth}'/>" style="width: 30px;" required="true" pattern="[1-9]|(0[1-9])|(1[0-2])"/>
                        . &nbsp;<input type="text" name="birthdayYear" value="<c:out value='${param.birthdayYear}'/>" style="width: 50px;" required="true" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/>
                    </td>
                </tr>
                <tr class="success">
                    <td>Kontaktna adresa: </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Ulica, cislo:* </td>
                    <td><input type="text" name="address" value="<c:out value='${param.address}'/>" required="true" pattern="[A-Z]([a-z])*( ([A-Z]|[a-z])([a-z])*)*( ([0-9])+){0,1}"/></td>
                </tr>
                <tr>
                    <td>PSC:* </td>
                    <td><input type="text" name="psc" value="<c:out value='${param.psc}'/>" required="true" pattern="[0-9]{5}|([0-9]{3} [0-9]{2})"/></td>
                </tr>
                <tr>
                    <td>Mesto:* </td>
                    <td><input type="text" name="town" value="<c:out value='${param.town}'/>" required="true" pattern="[A-Z]([a-z ])*"/></td>
                </tr>
                <tr>
                    <td>Stat:* </td>
                    <td>
                        <select name="state" required="true">
                            <option value=""></option>
                            <option value="Slovensko">Slovensko</option>
                            <option value="Cesko">Cesko</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Telefon Domov: </td>
                    <td><input type="text" name="homePhone" value="<c:out value='${param.homePhone}'/>" pattern="([0-9])*"/></td>
                </tr>
                <tr>
                    <td>Telefon Mobil: </td>
                    <td><input type="text" name="mobilePhone" value="<c:out value='${param.mobilePhone}'/>" pattern="([0-9])*"/></td>
                </tr>
                <tr class="success">
                    <td>Vzdelanie</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Najvyssie doasiahnute vzdelanie:* </td>
                    <td>
                        <select name="topEducation" required="true">
                            <option value=""></option>
                            <option value="zakladne vzdelanie">zakladne vzdelanie</option>
                            <option value="student strednej skoly">student strednej skoly</option>
                            <option value="stredoskolske bez maturity">stredoskolske bez maturity</option>
                            <option value="stredoskolske s maturitou">stredoskolske s maturitou</option>
                            <option value="nadstavbove/vysie odborne vzdelanie">nadstavbove/vysie odborne vzdelanie</option>
                            <option value="student vysokej skoly">student vysokej skoly</option>
                            <option value="vysokoskolske I. stupna">vysokoskolske I. stupna</option>
                            <option value="vysokoskolske II. stupna">vysokoskolske II. stupna</option>
                            <option value="vysokoskolske III. stupna">vysokoskolske III. stupna</option>
                        </select>
                    </td>
                </tr>

                <!-- STREDNA SKOLA -->
                <tr class="warning">
                    <td>Stredna skola</td>
                    <td></td>
                </tr>
                <c:if test="${not empty schoolError}">
                <div class="alert alert-error">
                    <c:out value="${schoolError}"/>
                </div>
                </c:if>
                <tr>
                    <td>Rok nastupu:**</td>
                    <td><input type="text" name="schoolStart" value="<c:out value='${param.schoolStart}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Rok ukoncenia:</td>
                    <td><input type="text" name="schoolEnd" value="<c:out value='${param.schoolEnd}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Skola:**</td>
                    <td><input type="text" name="schoolName" value="<c:out value='${param.schoolName}'/>" /></td>
                </tr>
                <tr>
                    <td>Mesto:**</td>
                    <td><input type="text" name="schoolCity" value="<c:out value='${param.schoolCity}'/>" /></td>
                </tr>
                <tr>
                    <td>Odbor/specializacia:</td>
                    <td><input type="text" name="schoolFieldOfStudy" value="<c:out value='${param.schoolFieldOfStudy}'/>" /></td>
                </tr>

                <!-- VYSOKA SKOLA -->
                <tr class="warning">
                    <td>Vysoka skola</td>
                    <td></td>
                </tr>
                <c:if test="${not empty universityError}">
                <div class="alert alert-error">
                    <c:out value="${universityError}"/>
                </div>
                </c:if>
                <tr>
                    <td>Rok nastupu:**</td>
                    <td><input type="text" name="universityStart" value="<c:out value='${param.universityStart}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Rok ukoncenia:</td>
                    <td><input type="text" name="universityEnd" value="<c:out value='${param.universityEnd}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Skola/fakulta:**</td>
                    <td><input type="text" name="universityName" value="<c:out value='${param.universityName}'/>" /></td>
                </tr>
                <tr>
                    <td>Mesto:**</td>
                    <td><input type="text" name="universityCity" value="<c:out value='${param.universityCity}'/>" /></td>
                </tr>
                <tr>
                    <td>Odbor/specializacia:**</td>
                    <td><input type="text" name="universityFieldOfStudy" value="<c:out value='${param.universityFieldOfStudy}'/>" /></td>
                </tr>

                <!-- WORK -->
                <tr class="success">
                    <td>Posledne zamestnanie: </td>
                    <td></td>
                </tr>
                <c:if test="${not empty workError}">
                <div class="alert alert-error">
                    <c:out value="${workError}"/>
                </div>
                </c:if>
                <tr>
                    <td>Od:** </td>
                    <td><input type="text" name="workStart" value="<c:out value='${param.workStart}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Do: </td>
                    <td><input type="text" name="workEnd" value="<c:out value='${param.workEnd}'/>" pattern="(19[0-9][0-9])|(20[0-9][0-9])|2100"/></td>
                </tr>
                <tr>
                    <td>Zamestnavatel:** </td>
                    <td><input type="text" name="workEmployer" value="<c:out value='${param.workEmployer}'/>" /></td>
                </tr>
                <tr>
                    <td>Pracovna pozicia:** </td>
                    <td><input type="text" name="workJob" value="<c:out value='${param.workJob}'/>" /></td>
                </tr>

                <!-- LANGUAGES -->
                <tr class="success">
                    <td>Jazykove znalosti: </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Zadavajte v tvare(Jazyk: uroven)<br />
                        oddelujte Enterom <br />
                        * Pre preklad do AJ pouzivajte:  basic, good, satisfactory, excellent)</td>
                    <td><textarea name="languages"></textarea></td>
                </tr>
                <c:if test="${not empty languageError}">
                <div class="alert alert-error">
                    <c:out value="${languageError}"/>
                </div>
                </c:if>

                <!-- OTHER -->
                <tr class="success">
                    <td>Ine znalosti</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Oddelujte ciarkou</td>
                    <td><textarea name="other"></textarea></td>
                </tr>
                <c:if test="${not empty otherError}">
                <div class="alert alert-error">
                    <c:out value="${otherError}"/>
                </div>
                </c:if>

                <!-- FINALLY END OF THIS SHIT :) -->
                <tr>
                    <td></td>
                    <td><input type="submit" value="Vytvorit" name="Create" class="btn btn-success"/></td>
                </tr>

            </table>
            </form>
        </div><!--/span-->
      </div><!--/row-->
    </div><!--/.fluid-container-->

    <%@include file="layout/footer.jsp" %>


</html>