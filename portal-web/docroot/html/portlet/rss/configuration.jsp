<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/rss/init.jsp" %>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionURL" />
<liferay-portlet:renderURL portletConfiguration="true" var="configurationRenderURL" />

<aui:form action="<%= configurationActionURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= configurationRenderURL %>" />

	<liferay-ui:panel-container extended="<%= true %>" id="rssFeedsSettingsPanelContainer" persistState="<%= true %>">
		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="rssFeedsSettingsPanel" persistState="<%= true %>" title="feeds">
			<liferay-ui:error exception="<%= ValidatorException.class %>">

				<liferay-ui:message key="the-following-are-invalid-urls" />

				<%
				ValidatorException ve = (ValidatorException)errorException;

				Enumeration enu = ve.getFailedKeys();

				while (enu.hasMoreElements()) {
					String url = (String)enu.nextElement();
				%>

					<strong><%= HtmlUtil.escape(url) %></strong><%= (enu.hasMoreElements()) ? ", " : "." %>

				<%
				}
				%>

			</liferay-ui:error>

			<aui:fieldset cssClass="subscriptions">

				<%
				if (urls.length == 0) {
					urls = new String[1];
					urls [0] = StringPool.BLANK;
				}

				for (int i = 0; i < urls.length; i++) {
					String title = StringPool.BLANK;

					if (i < titles.length) {
						title = titles[i];
					}
				%>

					<div class="lfr-form-row lfr-form-row-inline">
						<div class="row-fields">
							<aui:input cssClass="lfr-input-text-container" label="title" name='<%= "title" + i %>' value="<%= title %>" />

							<aui:input cssClass="lfr-input-text-container" label="url" name='<%= "url" + i %>' value="<%= urls[i] %>" />
						</div>
					</div>

				<%
				}
				%>

			</aui:fieldset>
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="rssFeedsDisplaySettingsPanel" persistState="<%= true %>" title="display-settings">
			<aui:fieldset>
				<aui:input name="preferences--showFeedTitle--" type="checkbox" value="<%= showFeedTitle %>" />

				<aui:input name="preferences--showFeedPublishedDate--" type="checkbox" value="<%= showFeedPublishedDate %>" />

				<aui:input name="preferences--showFeedDescription--" type="checkbox" value="<%= showFeedDescription %>" />

				<%
				String taglibShowFeedImageOnClick = "if (this.checked) {document." + renderResponse.getNamespace() + "fm." + renderResponse.getNamespace() + "feedImageAlignment.disabled = '';} else {document." + renderResponse.getNamespace() + "fm." + renderResponse.getNamespace() + "feedImageAlignment.disabled = 'disabled';}";
				%>

				<aui:input name="preferences--showFeedImage--" onClick="<%= taglibShowFeedImageOnClick %>" type="checkbox" value="<%= showFeedImage %>" />

				<aui:input name="preferences--showFeedItemAuthor--" type="checkbox" value="<%= showFeedItemAuthor %>" />

				<aui:select label="num-of-entries-per-feed" name="preferences--entriesPerFeed--">

					<%
					for (int i = 1; i < 10; i++) {
					%>

						<aui:option label="<%= i %>" selected="<%= i == entriesPerFeed %>" />

					<%
					}
					%>

				</aui:select>

				<aui:select label="num-of-expanded-entries-per-feed" name="preferences--expandedEntriesPerFeed--">

					<%
					for (int i = 0; i < 10; i++) {
					%>

						<aui:option label="<%= i %>" selected="<%= i == expandedEntriesPerFeed %>" />

					<%
					}
					%>

				</aui:select>

				<aui:select disabled="<%= !showFeedImage %>" name="preferences--feedImageAlignment--">
					<aui:option label="left" selected='<%= feedImageAlignment.equals("left") %>' />
					<aui:option label="right" selected='<%= feedImageAlignment.equals("right") %>' />
				</aui:select>
			</aui:fieldset>
		</liferay-ui:panel>
	</liferay-ui:panel-container>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>

<aui:script use="aui-base,liferay-auto-fields">
	new Liferay.AutoFields(
		{
			contentBox: 'fieldset.subscriptions',
			fieldIndexes: '<portlet:namespace />subscriptionIndexes',
			namespace: '<portlet:namespace />'
		}
	).render();
</aui:script>