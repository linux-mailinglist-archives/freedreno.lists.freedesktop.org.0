Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E256D103
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 21:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F5818AC21;
	Sun, 10 Jul 2022 19:12:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8B18AC25
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mhy9fguw7oNBUNA4++MQTJEkbokGyq0g3XiuEESLdIU=;
 b=OE/o8T4ZCwPIeBTZ+7m0wqq2yrjnsgLQ6XsiyKPe8osdC1dOE32nKZ1aBZcSLxCmPZeaglZ7oERO5
 8AleqM+Vyd6lITxE/74YOi/jJNbhrt3Tbfqc2fqxrxdVcnSE7dmh0HcbVx9jIIzjRzZgajQaIJBEPM
 lt1SEPAmSthSC13ss1Z6iCV8GQMrQyhNQaHSPUVxnwoF2ZwdNbNkAzoBq+zNvjL9TLRyZniffw6f9C
 L837DfmFJlDEBjZMUHrzPSxNHXyeOytbg3pWNrhvfiKH+HlV1oWBuNqxK74DMPg4X2nFhq0wdAJOY5
 rrFuasOqDHP0fIEx+3gZngJyaIb9siw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mhy9fguw7oNBUNA4++MQTJEkbokGyq0g3XiuEESLdIU=;
 b=RnA47xY/feXtfjBaI/zXv59+eR6HvtjUGxqoWU/9C2bZ133QpDO+vgby3a0dfvnP8nYReJODysnIp
 MWK/7moAw==
X-HalOne-Cookie: bbd82aec0b2170f761b40db99c68fcbf359bab34
X-HalOne-ID: 3fbbe948-0084-11ed-823d-d0431ea8bb10
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3fbbe948-0084-11ed-823d-d0431ea8bb10;
 Sun, 10 Jul 2022 19:12:32 +0000 (UTC)
Date: Sun, 10 Jul 2022 21:12:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <Ysskn7pd+HxujsGN@ravnborg.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jul 10, 2022 at 09:45:36PM +0300, Dmitry Baryshkov wrote:
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
