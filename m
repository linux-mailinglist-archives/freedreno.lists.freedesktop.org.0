Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5423F018
	for <lists+freedreno@lfdr.de>; Fri,  7 Aug 2020 17:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492476E081;
	Fri,  7 Aug 2020 15:41:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79A6E139;
 Fri,  7 Aug 2020 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=aoR8uwufFyTySMZNtLnSP/q0m1Vbg/FSJL36aRUJIpQ=; b=DgRtHxVKtIrOCZzirxubTwm9Sc
 nv5Hcpi1bQ9LVupVJvStuDkaDfyMzvrLIIc+OpXO3nHqIpHdjy4vUyUpVdFOR98AWrexGET7dBlBW
 uJYziw3saF4sDmTAW622Elv8pnEbYLIWrqOOGnCyrL4bGv3EF9Q2MMmDJUlL0xCM6s4/d40MAu/+b
 XJfBZpJqmwFyg9G3/3wwD4Z/PUEAn1WJE2bLEDLpGEnQBlKvlbAjOiWAqHZhiItIsAnqpUDrZUITE
 Ss4Iauz8mjBB0c5J7Jm/YlWkxeaJ+WKWwILnuYJ5OjKRAE4tUjKvwJCMQ4E6c/vV25LZZwGSlFCRO
 GuQoK1tA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k44RM-0000hz-BM; Fri, 07 Aug 2020 15:37:52 +0000
To: Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
Date: Fri, 7 Aug 2020 08:37:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807071718.17937-3-tanmay@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Aug 2020 15:41:05 +0000
Subject: Re: [Freedreno] [PATCH v9 2/5] drm/msm/dp: add displayPort driver
 support
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 8/7/20 12:17 AM, Tanmay Shah wrote:
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 6deaa7d01654..ea3c4d094d09 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
>  	help
>  	  Choose this option to enable HDCP state machine
>  
> +config DRM_MSM_DP
> +	bool "Enable DP support in MSM DRM driver"

	bool "Enabled DisplayPort support in MSM DRM driver"

> +	depends on DRM_MSM
> +	help
> +	  Compile in support for DP driver in msm drm driver. DP external

	                                      MSM DRM

Also:
I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
What does it mean?

> +	  display support is enabled through this config option. It can
> +	  be primary or secondary display on device.
> +
>  config DRM_MSM_DSI
>  	bool "Enable DSI support in MSM DRM driver"
>  	depends on DRM_MSM

thanks.
-- 
~Randy

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
