<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html;" charset="UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>CKEditor Line Numbers</title>
    <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>
</head>
<body>
    <textarea name="editor1"></textarea>

    <script>
        CKEDITOR.plugins.addExternal( 'lineutils', 'https://cdn.ckeditor.com/4.16.2/full-all/plugins/lineutils/', 'plugin.js' );
        CKEDITOR.replace( 'editor1', {
            extraPlugins: 'lineutils',
            lineutils_extraLinesBefore: 0,
            lineutils_extraLinesAfter: 0,
            lineutils_tabIndent: true,
            lineutils_autoNumbering: true,
            removePlugins: 'toolbar',
        });
    </script>
</body>
</html>