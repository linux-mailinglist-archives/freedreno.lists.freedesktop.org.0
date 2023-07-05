Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2081B748023
	for <lists+freedreno@lfdr.de>; Wed,  5 Jul 2023 10:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E430310E1CD;
	Wed,  5 Jul 2023 08:53:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07BD10E1CD
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jul 2023 08:53:16 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so1135391fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jul 2023 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688547194; x=1691139194;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=b/t8zNVTVsg6ienlpH1xhpP3oVWDvisuW/kxWCPhPP0=;
 b=cpm9X//SVQob0n3MjLFkivgbMHtONndE1zDnTrbx0YHqGfdVRU2UrX0P99g9YorsaW
 h5nI8n1UwT1L/MOqA6TDen8C4j9jmAwoz4j16Dpp68iSpGr8JhtY4SjGso98NaA967U6
 AFDIRc1rer8zxF2pfhgo45YWfnUtQNkKgYViqmqnu+ImiecgSNVoeTUqKkOto8Zngx5U
 r5VdvruhmHifZu+XNUETLZnn5YBTkLZyItura4YlO0mxwkx58tSOehXxxqv+r7lNI/7n
 oRMnBHnOpPFFqiizWI5na/xnroCdQvCsZ743j0ZR1VmsRHQuD/GEShGeM3SktrptkesQ
 +JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688547194; x=1691139194;
 h=content-transfer-encoding:in-reply-to:subject:organization
 :references:cc:to:content-language:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b/t8zNVTVsg6ienlpH1xhpP3oVWDvisuW/kxWCPhPP0=;
 b=GbqPTyOc9Dq5FtQ/rjThBNt9O8gUWpWVqZJXfkG9E2uTHdkLnTlAMdUs/52875aVt1
 vg7e+tw3Z1/zWXKShSVu0aKel+bu1Ad89TOAdocyhRIAucUGHZ8t2lj0q8fooh8HMFBC
 1UP9fHiE6ovEmJewESB27KH4s/jEeRjmMnovEeMhOCwn2N1TCPZKCIaOgimBDgUALX3R
 v5dry1pnO0t9ltRYZoigsyinNixQ0bTpq7/eucBTCz39IRK5HMDLSuPQsL86GxigvnmE
 SbKWlj+tvRFhUtofbNRAzGvBY1h837xRUDNBIZdzay3Hfj+t/orVAywiApYlAS6OfCGW
 XGLg==
X-Gm-Message-State: ABy/qLbjS1os2zpKdAsS4jJEdPKThl5PVz2nX10vL2kCTR9ixU1pIiWx
 XErC6gqXTSp8g+TfrXstfH4ylg==
X-Google-Smtp-Source: APBJJlHOl9QSHA5N0yXsvfULsijCC69VokhWE58vijIuLlqSVU54KuRRZmPjfvqL69mnb9h+eEINGQ==
X-Received: by 2002:a2e:8ec3:0:b0:2b6:d631:a1a0 with SMTP id
 e3-20020a2e8ec3000000b002b6d631a1a0mr9872081ljl.12.1688547194393; 
 Wed, 05 Jul 2023 01:53:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85?
 ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c220500b003fba6709c68sm1458806wml.47.2023.07.05.01.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 01:53:13 -0700 (PDT)
Message-ID: <92b1146c-be79-4d27-0444-cfc2125547e2@linaro.org>
Date: Wed, 5 Jul 2023 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20230704160106.26055-1-jonathan@marek.ca>
Organization: Linaro Developer Services
In-Reply-To: <20230704160106.26055-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add missing flush and fetch
 bits for DMA4/DMA5 planes
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
Reply-To: neil.armstrong@linaro.org
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/07/2023 18:01, Jonathan Marek wrote:
> Note that with this, DMA4/DMA5 are still non-functional, but at least
> display *something* in modetest instead of nothing or underflow.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95ce374a..52222af5975f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -51,7 +51,7 @@
>   
>   static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
>   	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
> -	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
> +	1, 2, 3, 4, 5};
>   
>   static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
>   		const struct dpu_mdss_cfg *m,
> @@ -206,6 +206,12 @@ static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
>   	case SSPP_DMA3:
>   		ctx->pending_flush_mask |= BIT(25);
>   		break;
> +	case SSPP_DMA4:
> +		ctx->pending_flush_mask |= BIT(13);
> +		break;
> +	case SSPP_DMA5:
> +		ctx->pending_flush_mask |= BIT(14);
> +		break;
>   	case SSPP_CURSOR0:
>   		ctx->pending_flush_mask |= BIT(22);
>   		break;

It permits displaying something, but the output is still corrupted on both DMA4 & DMA5,
tested with multiple plane sizes and formats.

modetest -P 81@93:1080x2400
and
modetest -P 87@93:1080x2400

Photo of actual display:
https://people.linaro.org/~neil.armstrong/sm8550-dma5.jpg

Works fine with DMA2 & DMA3 planes with same parameters.

Tested with https://patchwork.freedesktop.org/patch/538277/?series=118074&rev=1, and it doesn't change anything.

I think this is still accurate:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

Thanks,
Neil
