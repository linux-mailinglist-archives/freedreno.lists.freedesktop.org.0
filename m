Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBE60FF63
	for <lists+freedreno@lfdr.de>; Thu, 27 Oct 2022 19:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D72F10E6B4;
	Thu, 27 Oct 2022 17:35:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631C610E282
 for <freedreno@lists.freedesktop.org>; Thu, 27 Oct 2022 17:35:50 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bs14so4282062ljb.9
 for <freedreno@lists.freedesktop.org>; Thu, 27 Oct 2022 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NDz4kWhLhEfZ2hWIeIjAeiEHpNZ8WN9F/kVUr2FsKOA=;
 b=Dm9V1AUHif0mPsMXI2hZA+qzRs+USBMFDzHNIJIfeeS1gWBz3dLy41QQv4HNr4FsBf
 g3gLAZ6xYr0n5WYoF1a/v8ArxcrTXwBFsF17Esnjc+1YR4WkdM4YbReJnN27TKFAGj2n
 /TnLj9WZL3j0FuvTTrSkmys00kj/d7o2V1VjyuwAy2j9dCid5sFXssDXJw+Hc2FZxkHp
 erCN9lZf9wyvDy7W+1G9NEiKt2rUzE5iIiD7UYyZ+cT8Oy3Rw85H4vpjcyAG0UnalxAY
 G0GlCVcIW2OIW7pwBTr9x+SBl2LJPrG6u86x4JDLPYXpA8Cvm79g5coY7QYUF90VCqBl
 3ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NDz4kWhLhEfZ2hWIeIjAeiEHpNZ8WN9F/kVUr2FsKOA=;
 b=DFCuJUoXspGmLML6sjhydik/0tXdCrg55k+GkkMFta/Q8Rv9qOgVddHUTJi3+ExPJA
 rSnDCLvqD7vrKCkVMg5s1omlvbf9kmDlWRQFviNNTFtgdH0l65l9CDe6VXGqPidzk6Aw
 HPGhe+3NrWMKi8EkFY2LYiYYc3RVT3nU3CrcGuyO0fjJjd7RGdHSIuykQ0pIzNTpViH2
 l3jVtS6f1m2dj0q2zFxrPFn1BMGQUwa1IoEmopJoSGE3TJrhgLrnKJTYEkaOxo/G8HI2
 dPhh0mnjtfpI52VNHliJcVe8k5mWoumxracHnTIap3CdxQ0NhNu4K9oCk1OXi+m7DLaF
 nJcg==
X-Gm-Message-State: ACrzQf1j2xnXtRGp8XDZB0SU/+vfEo3YjLTweSqyS/47UjN4MHIjsAAR
 OXKxgsM1cYiLR1zOayexxacIwQ==
X-Google-Smtp-Source: AMsMyM62y68hZk4W/jWGLk+/q/3HRaVrXfdskcaYsGCKHPtmVr51OQncH0BXyIUv6VXgiQmNf0K39w==
X-Received: by 2002:a05:6512:b83:b0:4a1:ddb7:d9b5 with SMTP id
 b3-20020a0565120b8300b004a1ddb7d9b5mr18067312lfv.439.1666892148336; 
 Thu, 27 Oct 2022 10:35:48 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 v5-20020ac25b05000000b00494a11c5f52sm250923lfn.256.2022.10.27.10.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 10:35:47 -0700 (PDT)
Message-ID: <dea86c81-449a-3296-d5de-c3b346f974e4@linaro.org>
Date: Thu, 27 Oct 2022 20:35:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
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

This way you are calling dsi_get_pclk_rate twice(), which is slightly 
inefficient. You can call it once (here) and then pass the resulting 
pclk_rate as an argument to dsi_byte_clk_get_rate().

>   
>   	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>   				msm_host->byte_clk_rate);
> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>   
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;

So... We have calculated all rates, stored the pclk_rate in 
msm_host->pixel_clk_rate. And now we are going to calculate it again. As 
you are touching this line of code, I'd suggest to just use 
msm_host->pixel_clk_rate instead of a function call.

>   	do_div(pclk_bpp, 8);
>   	msm_host->src_clk_rate = pclk_bpp;
>   

-- 
With best wishes
Dmitry

