<%
/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/html/portlet/init.jsp" %>

<%@ page import="com.liferay.portlet.tags.NoSuchEntryException" %>
<%@ page import="com.liferay.portlet.tags.NoSuchPropertyException" %>
<%@ page import="com.liferay.portlet.tags.model.TagsEntry" %>
<%@ page import="com.liferay.portlet.tags.model.TagsProperty" %>
<%@ page import="com.liferay.portlet.tags.service.TagsEntryLocalServiceUtil" %>
<%@ page import="com.liferay.portlet.tags.service.TagsPropertyLocalServiceUtil" %>
<%@ page import="com.liferay.portlet.xslcontent.util.XSLContentUtil" %>

<%@ page import="java.net.URL" %>

<%
PortletPreferences prefs = renderRequest.getPreferences();

String portletResource = ParamUtil.getString(request, "portletResource");

if (Validator.isNotNull(portletResource)) {
	prefs = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource, true, true);
}

String xmlURL = ParamUtil.getString(request, "xmlURL", prefs.getValue("xml-url", XSLContentUtil.DEFAULT_XML_URL));
String xslURL = ParamUtil.getString(request, "xslURL", prefs.getValue("xsl-url", XSLContentUtil.DEFAULT_XSL_URL));
%>