Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167E64F1F4
	for <lists+freedreno@lfdr.de>; Fri, 16 Dec 2022 20:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104CD10E625;
	Fri, 16 Dec 2022 19:46:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025FF10E61A
 for <freedreno@lists.freedesktop.org>; Fri, 16 Dec 2022 19:46:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p36so4956794lfa.12
 for <freedreno@lists.freedesktop.org>; Fri, 16 Dec 2022 11:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4tu904MKHl4wlHKTZTyOl2mc2CnxBACoWjclSh2uBUU=;
 b=mlxkDAyQtKgDDQHCxiGBylV5M8jE6Y2EUKneYivBKiBAkYxKtUdSFMV6q4inN0WS4k
 wvRNf46MJ4V2YzvgMq/MEW8u9jAZpG06DlFa+aLLfHxR1hNT4uqpqsbl4yopwqyVUM00
 omfFYKf2iVG6NyPpk1J1g8NJfcTgxfvb4M5q7fgMNVgCxcfBk7NO6f1jpaWOIqmJzB27
 n76xsjSQVt3/2j3fAy49c0GymMaJFvBCzmmQdHrU9iHfTap16V6Q+CatNEffN7cWB6qM
 7EikkHTMsmlLei9B0FoWlb2bf8BW5SXWYHGwoklmgOuq6Ua0c6pkXZ0gjS2kJgNDaYaB
 XMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4tu904MKHl4wlHKTZTyOl2mc2CnxBACoWjclSh2uBUU=;
 b=KJ9O0xUZ6R8NWafp9T6t72cvajdeEZlz++1WpkfSbvcIcSx4NXOHbMepndCOnB3K0U
 /Ffl2Ef7L3zjFnYyottF86D7s2LsDGg9fN5rrMEuDJRkgxiFrGgSd06O82cAbLn51jrV
 VtUBFC375ec5WZOA2GZx4wt4ujSKnWxxKefEnhuW10Lc13/+7W32brl9elMHPGEBC5qe
 Eqhcx4/YMAfxGrmlHE+HJ9jUtUnySr3KaUCh4u3tJXilXrntQrIs0l4GKpIOWNdFlE4Z
 P3S9TyRYwhain7SHyOro92Jm//MfZDKBdisL56q6Pr/dSqamUQzHniU3iakGYJjySI1H
 PeIg==
X-Gm-Message-State: ANoB5pnQ/c3W3JHKwkzeTtHZbyAoV0zimK8jeggSzR91Q1Y/74/fMamO
 wxoLSXo6s7tK62dogv/p70Waow==
X-Google-Smtp-Source: AA0mqf5lUG97cEpxdK/0zmN3VLq6wwUkQGiOk1cz8eYzEKl6ZpaDwTMCX83ITUPLsAq/RJ9UEGt/8Q==
X-Received: by 2002:a05:6512:39c2:b0:4b4:e4a1:2fc6 with SMTP id
 k2-20020a05651239c200b004b4e4a12fc6mr10880035lfu.68.1671219996137; 
 Fri, 16 Dec 2022 11:46:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac25f74000000b004b6e157d326sm294500lfc.168.2022.12.16.11.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:46:35 -0800 (PST)
Message-ID: <bfa99e8c-d413-b52f-f026-000720b01307@linaro.org>
Date: Fri, 16 Dec 2022 21:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1671217893-17496-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v14 3/5] drm/msm/dp: parse data-lanes as
 property of dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/12/2022 21:11, Kuogee Hsieh wrote:
> Add capability to parser data-lanes as property of dp_out endpoint.
> Also retain the original capability to parser data-lanes as property
> of mdss_dp node to handle legacy case.
> 
> Changes in v6:
> -- first patch after split parser patch into two
> 
> Changes in v7:
> -- check "data-lanes" from endpoint first
> 
> Changes in v14:
> -- replace "parser" with "parse" at commit subject
> -- add matching brackets at dp_parser_misc()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index dd73221..d42987a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -94,16 +94,25 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> -	int len;
> -
> -	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -	if (len < 0) {
> -		DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> -			 DP_MAX_NUM_DP_LANES);
> -		len = DP_MAX_NUM_DP_LANES;
> +	int cnt;
> +
> +	/*
> +	 * data-lanes is the property of dp_out endpoint
> +	 */
> +	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
> +	if (cnt > 0) {
> +		parser->max_dp_lanes = cnt;
> +	} else {
> +		/*
> +		 * legacy code, data-lanes is the property of mdss_dp node
> +		 */
> +		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> +		if (cnt > 0)
> +			parser->max_dp_lanes = cnt;
> +		else
> +			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */

This bugged me for some time.

I think the following piece of code is easier to understand and handle:

cnt = drm_of_get_data_lanes_count_ep(...);

/* legacy, data-lanes property of the mdss_dp node */
if (cnt < 0)
     cnt = drm_of_get_data_lanes_count(.....);

if (cnt > 0)
     parser->max_dp_lanes = cnt;
else
     parser->max_dp_lanes = DP_MAX_NUM_DP_LANES;



>   	}
>   
> -	parser->max_dp_lanes = len;
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

