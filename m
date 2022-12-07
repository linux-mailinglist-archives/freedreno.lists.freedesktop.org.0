Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6364622D
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 21:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7710E41A;
	Wed,  7 Dec 2022 20:13:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBDB10E41C
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 20:13:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p36so26080725lfa.12
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVVhjsKNZ110uihq4o15WbXBuFAJxL7HSRoRDMGRsAY=;
 b=D+O6QwDXnzj3Qj99Yu3Iwzt/hjB6AUqp0FkJde2gGViZZGJ+64qxPZsFpe/v/EqHuk
 CFY+5zz1axumiZuHQYIsPVo6Hx9qzvewkgoBSZljEUzdgiLgZg5DvzYcsziTszD/eYrm
 IfhEYjOHK7NoR0yvmyOhjHvtfQlaRoPbqlxbPrVQPZVjJEiok2m/0xZOGTjEOXCZn5K2
 vacTsOd4dI1JQ9XX+N38CXMqhNNycNLFQ7sE8cPsXS58PSZzrM2EXRvNkimexnz8GCOl
 KZu/IoGqobMloRxJCQYYlh/KaQYDV6OOaxaDOfzt9EuDeLsZpmXiKPjfSdFWIyozoKJE
 yNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVVhjsKNZ110uihq4o15WbXBuFAJxL7HSRoRDMGRsAY=;
 b=ZuiRXiZfipZF9nuAdrG2BY0+kVUu7q6uWqkT62OLO3M6zFK54Q4mRcr4LUdMTYj9LE
 dwd6Kl46Td9cVKPaUlwUWGYrgLXtwdZi35rPNcbdHI7fXtwBF1cTxqN1dIfQMPafYOz0
 OvIoUlqIOMnW5TIbfn2Ckr5LgYrNbVYElCL3+AH+8TZhGRpU0D6afI5Z2Ed1G/nIIoPt
 bqXLMlj9T9fWCOg0e9lPlOX0J1Ja7dLLuuVRLiufiAuQLHGjphkCjB00oRwgklYTwx7C
 TLqNPGc1J/EG3nRBS0fNs9vRtUmUzfUZj/I0bfEBAPRgMZenV23LNAfkik3gSasv8sM2
 taQQ==
X-Gm-Message-State: ANoB5pnk21zmKvYxzpp6kLcHrIuCJ8pkB4hWIRfbq2QXHQMHwIkUF88q
 hjP7Or56x3L1xD27C1owFdAgfg==
X-Google-Smtp-Source: AA0mqf7JoScIJJQdmqKUzoSq0YX20EvSrl9WjrveHwsafWCUiTZfwCKztEInSYOc8oM3yv8kYBk3yg==
X-Received: by 2002:a05:6512:3e23:b0:4b5:8f93:c129 with SMTP id
 i35-20020a0565123e2300b004b58f93c129mr1854617lfv.188.1670444004117; 
 Wed, 07 Dec 2022 12:13:24 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac24e91000000b004a2550db9ddsm2993654lfr.245.2022.12.07.12.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 12:13:23 -0800 (PST)
Message-ID: <d17a595c-9561-1efa-b72e-15c535ef31eb@linaro.org>
Date: Wed, 7 Dec 2022 22:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
References: <1670432278-30643-1-git-send-email-quic_khsieh@quicinc.com>
 <1670432278-30643-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1670432278-30643-5-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v10 4/5] drm/msm/dp: parser link-frequencies
 as property of dp_out endpoint
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

On 07/12/2022 18:57, Kuogee Hsieh wrote:
> Add capability to parser and retrieve max DP link supported rate from
> link-frequencies property of dp_out endpoint.
> 
> Changes in v6:
> -- second patch after split parser patch into two patches
> 
> Changes in v7:
> -- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
> 
> Changes in v9:
> -- separate parser link-frequencies out of data-lanes
> 
> Changes in v10:
> -- add dp_parser_link_frequencies()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 27 +++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index b5f7e70..9398abe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -91,6 +91,28 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   	return 0;
>   }
>   
> +static u32 dp_parser_link_frequencies(struct device_node *of_node)
> +{
> +	struct device_node *endpoint;
> +	u64 frequency = 0;
> +	int cnt = 0;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */

if (!endpoint)
   return -ENODEV; (or 0, as you have u32)

It's much easier IMO.

> +	if (endpoint)
> +		cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +
> +	if (cnt > 0) {
> +		of_property_read_u64_index(endpoint, "link-frequencies",
> +						cnt - 1, &frequency);
> +		frequency /= 10;	/* from symbol rate to link rate */
> +		frequency /= 1000;	/* kbits */

kbytes?

> +	}
> +
> +	of_node_put(endpoint);

Even easier:

cnt = of_property_count(...);
if (cnt > 0)
     of_property_read_u64_index(...);
of_node_put(endpoint);

frequency /= 10;
frequency /= 1000;

return frequency;

> +
> +	return (u32)frequency;
> +}
> +
>   static int dp_parser_misc(struct dp_parser *parser)
>   {
>   	struct device_node *of_node = parser->pdev->dev.of_node;
> @@ -113,6 +135,11 @@ static int dp_parser_misc(struct dp_parser *parser)
>   			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>   	}
>   
> +	parser->max_dp_link_rate = dp_parser_link_frequencies(of_node);
> +

Drop the empty line please. The if checks the result of the previous 
assignment. It's easier to comprehend if they visually belong to the 
same code block.

> +	if (!parser->max_dp_link_rate)
> +                parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..6b10c3e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>   #define DP_LABEL "MDSS DP DISPLAY"
>   #define DP_MAX_PIXEL_CLK_KHZ	675000
>   #define DP_MAX_NUM_DP_LANES	4
> +#define DP_LINK_RATE_HBR2	540000 /* khz */
>   
>   enum dp_pm_type {
>   	DP_CORE_PM,
> @@ -119,6 +120,7 @@ struct dp_parser {
>   	struct dp_io io;
>   	struct dp_display_data disp_data;
>   	u32 max_dp_lanes;
> +	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
>   
>   	int (*parse)(struct dp_parser *parser);

-- 
With best wishes
Dmitry

