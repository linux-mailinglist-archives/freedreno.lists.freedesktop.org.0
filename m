Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A26636B5
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 02:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ADA10E0F5;
	Tue, 10 Jan 2023 01:34:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6619F10E0F5
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 01:34:43 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp15so15907541lfb.13
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 17:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kM0bPWrPB3MMjLNH4GrBRCRdosVsi95zzH+RgootF4E=;
 b=BWJmDOepxQnAkjIdvEWSlT/UgvK6o9n/tOUo63mBVWZV3zASRx/AjwwGFs7HUvTYfc
 uR9abJMD7SYi4ypCdNcPM6Q9WUjZk1xAWyWFKvtlXpKdAkgUNElrA7qbXhFkGKSLLFkF
 fT67GPbrlLkuD5RYy5gvI3LHYMfx8ahvQvlY9yNR6DFzU+X3lOEBLvUysdOW5piBchQQ
 QKEfM52NysLuRy1hGBHaUBNnzBmtJGI5NLC5dMM+w8JcEvX76TDiD7oZax422qnvQb0v
 0EpuUjyxs18hrf6M6J8g0CZMfGGXE4+qbg9g1S4ubqqiq+vpvwYJ2dYjVIsBbJz5uLAS
 pMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kM0bPWrPB3MMjLNH4GrBRCRdosVsi95zzH+RgootF4E=;
 b=rJcpKWCI352bjgmP2LnYM0ntsNBBjtyNqYiEWNgC3XykSvPElpxk3zmzp1+vmyLhYB
 8rP87594YeUj5MAFVqqYH4iLxEYFXRuLIKBDN83cyal6/0obmNMgAJofTo7OTh3lOtdB
 4aVKbtDA0rO59Iiz6cfmGJIAN8hOL0UqpQkDKckerFazsTAp6Fz4dMaDq8hvYHQgy4jp
 UKON1DBS7VvGc1/hzvUboSQvqjVKhOFF/kaQ+/GsQe0WFB/lXWTJseOkKcEZRCoWQ3SX
 XdZmIv9hm3clNFMF0iV5uTuajwphhd8dh0LKhFqWKUmvCKNt2oy2HtkmMAg0wEoZyE1i
 SGmQ==
X-Gm-Message-State: AFqh2koWypnXYQMFL3FztdjE9238w5QuwiVr3jySsIGVJgS4Cq55OqUK
 rPuvd5njLT3G6eoa1TjMwFUcbQ==
X-Google-Smtp-Source: AMrXdXsvf1IR+oW+jLcYvBElwRyGRD5pA3/hS3f5wnVfs8QXjOmPka3RVgYw3hhXgHfKNo4uUms2Qw==
X-Received: by 2002:ac2:5f6d:0:b0:4b5:830d:12b7 with SMTP id
 c13-20020ac25f6d000000b004b5830d12b7mr15530951lfc.41.1673314481496; 
 Mon, 09 Jan 2023 17:34:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a05651213a400b00492b494c4e8sm1885261lfa.298.2023.01.09.17.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 17:34:40 -0800 (PST)
Message-ID: <36862c49-39d2-952d-829b-e660375d49f4@linaro.org>
Date: Tue, 10 Jan 2023 03:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dsi: add a helper method to
 compute the dsi byte clk
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
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 03:49, Abhinav Kumar wrote:
> Re-arrange the dsi_calc_pclk method to two helpers, one to
> compute the DSI byte clk and the other to compute the pclk.
> 
> This makes the separation of the two clean and also allows
> clients to compute and use the dsi byte clk separately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++--------
>   2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 2a96b4fe7839..60ba8e67f550 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>   void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
> +		const struct drm_display_mode *mode);
>   int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>   int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>   void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 57a4c0fa614b..32b35d4ac1d3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -569,9 +569,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   	clk_disable_unprepare(msm_host->byte_clk);
>   }
>   
> -static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>   {
> -	struct drm_display_mode *mode = msm_host->mode;
>   	unsigned long pclk_rate;
>   
>   	pclk_rate = mode->clock * 1000;
> @@ -588,12 +587,18 @@ static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bo
>   	return pclk_rate;
>   }
>   
> -static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
> +		const struct drm_display_mode *mode)
>   {
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	u8 lanes = msm_host->lanes;
>   	u32 bpp = dsi_get_bpp(msm_host->format);
> -	unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
> -	u64 pclk_bpp = (u64)pclk_rate * bpp;
> +	unsigned long pclk_rate;
> +	u64 pclk_bpp;
> +
> +	pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> +
> +	pclk_bpp = (u64)pclk_rate * bpp;

Any particular reason for this? The following patch would be more obvious:

 > -	unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
 > +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
 >  	u64 pclk_bpp = (u64)pclk_rate * bpp;


>   
>   	if (lanes == 0) {
>   		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
> @@ -606,8 +611,14 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   	else
>   		do_div(pclk_bpp, (8 * lanes));
>   
> -	msm_host->pixel_clk_rate = pclk_rate;
> -	msm_host->byte_clk_rate = pclk_bpp;
> +	return pclk_bpp;
> +}
> +
> +static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> +{
> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> +	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
> +			msm_host->mode);
>   
>   	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>   				msm_host->byte_clk_rate);
> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>   
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
>   	do_div(pclk_bpp, 8);
>   	msm_host->src_clk_rate = pclk_bpp;


Following my previous feedback:

I think at this moment msm_host->src_clk_rate = msm_host->byte_clk_rate 
* msm_host->lanes. If so, we can drop dsi_get_pclk_rate() call and the 
multiply/do_div calculation and use the above formula instead.

If this looks logical, could you please prepend a patch changing this?

LGTM otherwise.

-- 
With best wishes
Dmitry

