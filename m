Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5494570D36
	for <lists+freedreno@lfdr.de>; Tue, 12 Jul 2022 00:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB82C91EB3;
	Mon, 11 Jul 2022 22:11:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3CB91EAB
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 22:11:15 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id t189so8358828oie.8
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bqF37v1wc4vdtH986+POZwfFAWH4aibHxP0JNk7OS00=;
 b=aeDvSik4AaD4uloL26ZCHzQiqGK019nqdEcTtt2zoO9vfYkrlw735sbPVvOahsKl7U
 B4CxOkIFU+wL+Wp3CLBdGzKSqcYOARSrjCUDr2eFbolgjLUDEnYYE64tkMI0xj7ohX04
 P9SwvWRTtBmiSvbDBQWPrQvmPb1lis6/Mu/eyKRSj3Cdm72777CtB4maHVPqt0oj8wNX
 LNo2ZIqlHxqr6okRJQQ5vZIH74OQpShiZDvh6bZz9TfHum0coMXBdCihEXG3KjoVNeTX
 vI4bmbECbFEpkZSFjJH+Psa1fq52c3SJH+0PSDko5W6gFtVT64i1lGEDoLQswHMqX5go
 sX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bqF37v1wc4vdtH986+POZwfFAWH4aibHxP0JNk7OS00=;
 b=HQzbRKLETpdguBlH0e8VCpb26hkJxlget2SFg+FWUYfdfJw1ex5ZYI/e/p8YMM20g6
 G/TtCB5V2slzi6N/pvSZK5KpdOb50fcH91/BhFMT06CG7LfVPaaM8si8TsfIaS5EtHnt
 jd23W/LkXzOpGVJRDpaxEBnboLgErniA2cRxf2FYoEgXaTCsXTzpkE3+nAxzP16wQRHT
 dCbRsDexS+CL88L9cdoalr823frqdkw1vHqalMHEuQriv6P8ICXE8O31ibAMiYR948lB
 y96kt5wnwgLSE4RCz+yxy7IxHlR+735bl9Hkhd9OCAwxeeHmfo558vjt6Qpkv1i+cKRC
 PXqQ==
X-Gm-Message-State: AJIora+fyosQgCYSTm7Wz4SNAPsNfimzv3ZW/elaQwBYbv95iICbWG9t
 nYK5aSUwYHj1ro9Uk3ge3lDTEQ==
X-Google-Smtp-Source: AGRyM1vK35Lb7yI3VV+fOB2Y9Ai+cSgHMs+KxRjlEzzKYmw2Z9KVy4cnIf1W/xCeFz5Yc7Vbf6AI8g==
X-Received: by 2002:a05:6808:1412:b0:339:b55c:24f8 with SMTP id
 w18-20020a056808141200b00339b55c24f8mr331604oiv.106.1657577474826; 
 Mon, 11 Jul 2022 15:11:14 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056830204d00b00616dfd2c859sm3024549otp.59.2022.07.11.15.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 15:11:14 -0700 (PDT)
Message-ID: <c2774352-030f-196d-c3f8-6cfd370d048d@kali.org>
Date: Mon, 11 Jul 2022 17:11:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86:
 support DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 7/11/22 4:21 AM, Dmitry Baryshkov wrote:
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index b362a7bf4d97..369bf72717f6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>   	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>   	int ret;
>   
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
>   	pdata->aux.drm_dev = bridge->dev;
>   	ret = drm_dp_aux_register(&pdata->aux);
>   	if (ret < 0) {
> @@ -710,15 +705,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>   		return ret;
>   	}
>   
> -	/* We never want the next bridge to *also* create a connector: */
> -	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> -
> -	/* Attach the next bridge */
> +	/*
> +	 * Attach the next bridge.
> +	 * We never want the next bridge to *also* create a connector.
> +	 */
>   	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> -				&pdata->bridge, flags);
> +				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret < 0)
>   		goto err_initted_aux;
>   
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
>   	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
>   						     pdata->bridge.encoder);
>   	if (IS_ERR(pdata->connector)) {

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

