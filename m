Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46607666687
	for <lists+freedreno@lfdr.de>; Wed, 11 Jan 2023 23:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12110E825;
	Wed, 11 Jan 2023 22:56:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6A810E825
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 22:56:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bf43so25811154lfb.6
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VRHfe7+oqQo3PR0iB4Sq4HE88hbM8IdnEc2KIv4oSKA=;
 b=B3nMlJ91BxxZKXIyJeRUpLJ6ssk7ksEk1VlX3JYJPEJ+PjwOdlu/b8aqYb64gsAdz2
 StWoURYfQE2ZuSet9nx8rrjHqmFlHQ305FBHqrdhIV+UiF7zqP3Ypv64vfxxzcXVBPG+
 LsMFk4DT5RLeQvTZlDcJWycTjj9L3818n7BmJTjw74GcjIm4/BO8TgcEntmRwwoxnw0y
 jMSt4crwss3am3sLRcccXcMOIwD27TnI3ETIpRUKTjlUQa1nDYlocr9Bx4qOqzrzhRi+
 +wawjnEEl3fGYSc3OdjfIjJdycLF2IICCxDmkOAMGA5qK6d2chd4X2euQx4pBAy2IjhX
 guyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRHfe7+oqQo3PR0iB4Sq4HE88hbM8IdnEc2KIv4oSKA=;
 b=yQUFXmRjYu0cAtDusFz5kLy/b91ckNqgtw2hkqBJQFdhYry0XG0lIb+Mr35fdB0pB5
 aPyypILPjAfJIGeRevJNnaB/i1Q2qXMChVd6GgJd4vIIkiwRpHR8Vlh6z7T5IrbGX8fz
 UsMeJwDDwRwqVgOxJsdVSojXIJ6k60541S1FMnNxkZhkN24gBX6F7EX2lKpELQR4IVA0
 ET2ves/mDdhXNUKBe1DvODEgLmCqHMs3th87uYZwAKQr25JM6UzGG9T2Uxmq0ZP5a89a
 QxA5L/W/0r7cb56eLdley3hovUP65TLqirpewjzK8QGg8lZBbpNxs4EOqszx9j5egvsi
 JPgQ==
X-Gm-Message-State: AFqh2krr9dDYlo5sLlUN2R4fy6OR9NM9BwE6y82qobjJVOG+YhzH6m0B
 6Cerr3CT/5DLImvb133BEu+4bw==
X-Google-Smtp-Source: AMrXdXsG4m5IHD45bBBL9zlsHY+CD2b1hJAsDpKlAk0RRJe4FJiaQuuTocxM1suhZYyspPDHNHN4ww==
X-Received: by 2002:a05:6512:1104:b0:4af:5088:959c with SMTP id
 l4-20020a056512110400b004af5088959cmr22826768lfg.2.1673477808028; 
 Wed, 11 Jan 2023 14:56:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a056512210600b004b55c1b5c66sm2941927lfr.157.2023.01.11.14.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:56:47 -0800 (PST)
Message-ID: <2304c252-354a-f214-3f89-7797110fc416@linaro.org>
Date: Thu, 12 Jan 2023 00:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230111225257.7510-1-quic_abhinavk@quicinc.com>
 <20230111225257.7510-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111225257.7510-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dsi: implement opp table
 based check for dsi_mgr_bridge_mode_valid()
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/01/2023 00:52, Abhinav Kumar wrote:
> Currently there is no protection against a user trying to set
> an unsupported mode on DSI. Implement a check based on the opp
> table whether the byte clock for the mode can be supported by
> validating whether an opp table entry exists.
> 
> For devices which have not added opp table support yet, skip
> this check otherwise it will break bootup on those devices.
> 
> changes in v2:
> 	- drop dev_pm_opp_get_opp_table() usage
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..c4c24dabfd6f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -450,6 +450,31 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> +	struct platform_device *pdev = msm_dsi->pdev;
> +	struct dev_pm_opp *opp;
> +	unsigned long byte_clk_rate;
> +
> +	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
> +
> +	/*
> +	 * If dev_pm_opp_find_freq_ceil() returns -EINVAL, its a bad
> +	 * pointer being passed, so treat as an error and return MODE_ERROR
> +	 *
> +	 * If dev_pm_opp_find_freq_ceil() returns -ERANGE, no clock
> +	 * was found matching the byte_clk, so return MODE_CLOCK_RANGE
> +	 *
> +	 * If dev_pm_opp_find_freq_ceil() returns -ENODEV, don't treat
> +	 * it as an error as it could mean opp table is not implemented
> +	 */

I'd say, too lengthy and verbose.

> +	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
> +	if (IS_ERR(opp)) {
> +		if (PTR_ERR(opp) == -EINVAL)
> +			return MODE_ERROR;
> +		else if (PTR_ERR(opp) == -ERANGE)
> +			return MODE_CLOCK_RANGE;

I think the logic should be quite opposite. Ignore -ENODEV, handle 
-ERANGE and return MODE_ERROR for all other errors. In your code you are 
ignoring not only -ENODEV, but all other possible errors which can be 
added in future.

> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
>   
>   	return msm_dsi_host_check_dsc(host, mode);
>   }

-- 
With best wishes
Dmitry

