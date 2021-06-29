Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699FB3B6BBD
	for <lists+freedreno@lfdr.de>; Tue, 29 Jun 2021 02:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A636E5A3;
	Tue, 29 Jun 2021 00:32:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB36E5A3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 00:32:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624926730; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XXeaGfryzqs7lXB7YGEwtxfK7Ym2WqEHAXJXur+jmUE=;
 b=Nk8mXbW+dVqhFkZk46/yLqcbRmiCOkjtnbj6gzcXKV0ffPcrbkWhEx1Sg+ezm2B2LYAi18em
 SV24R4l1pGLC2Kid8ZIF1GJsmiyOAOoc0Kyf4X9br3rYmGG/nPFU7AmqkguE1dmTLOmoARrp
 hGeVDrg9qvQKHtj/L+4eznPFP0U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60da69ee2a2a9a97616eae58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 00:31:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0A54C4338A; Tue, 29 Jun 2021 00:31:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B30DC433F1;
 Tue, 29 Jun 2021 00:31:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Jun 2021 17:31:39 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
References: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
Message-ID: <b3456d3e4376ae1e9776f03e14513a35@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Make it possible to enable the
 test pattern
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Bjorn

On 2021-06-28 17:22, Bjorn Andersson wrote:
> The debugfs interface contains the knobs to make the DisplayPort
> controller output a test pattern, unfortunately there's nothing
> currently that actually enables the defined test pattern.
> 
> Fixes: de3ee25473ba ("drm/msm/dp: add debugfs nodes for video pattern 
> tests")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This is not how this debugfs node works. This is meant to be used while 
running
DP compliance video pattern test.

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c

While the compliance test is being run with this msm_dp_compliance app 
running,
it will draw the test pattern when it gets the "test_active" from the 
driver.

The test pattern which this app draws is as per the requirements of the 
compliance test
as the test equipment will match the CRC of the pattern which is drawn.

The API dp_panel_tpg_config() which you are trying to call here draws 
the DP test pattern
from the DP controller hardware but not the pattern which the compliance 
test expects.

Its just a debug API to call when required during bringup/debug 
purposes.

Hence this is not the place to call it as it will end up breaking CTS.

Thanks

Abhinav

> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..82911af44905 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -305,6 +305,8 @@ static ssize_t dp_test_active_write(struct file 
> *file,
>  				debug->panel->video_test = true;
>  			else
>  				debug->panel->video_test = false;
> +
> +			dp_panel_tpg_config(debug->panel, debug->panel->video_test);
>  		}
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
