Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A044394140
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 12:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9896E069;
	Fri, 28 May 2021 10:39:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1A06E069
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 10:39:32 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s25so4609720ljo.11
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
 b=t+lLmqG6vhSL5GOTsD3igXoE9y+U3voqARx5bNC/6yF5ZmO5i7rp29h1AzqqwIPRar
 SJpmSwu7mC8ELldZnVaMgd3M5gJL4ol1TvsbelBxIZiboxUS73LMGHNqRz3/W0I00Y3e
 vbJn/B4JPV8Zplh0wa+Yzbe5yrz0A+4T1kkOpoYFM4FT7eB9QkF0cTHgGRQQcmRQlMLo
 +gx1sdra00IG3CQ+tH6ZPqqEX3TcN3ia/aBYazKqCB8kgasWm6KaIBRZw9ZaOYV8K3QH
 QRm7d+knoS+RrVD0VaAqZQHXiuvdjlVRUjQXlPPQ3XiMtpziwjZ+Glrc+wPmQYnqm8Tl
 iD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=umCDCObrNo1F/car/LRG+W5Mp6aBUz9SOihca14kINU=;
 b=e4Q1u2V3Eixm83kHoz0FyNlV212Ux9wsylqNmLzAOGbnl7PBU3rslREYpaaHuxRwm3
 SOluYwh5fO45sMAAkNogDqCk83yZvCtoul1GU4Yh/LW35ymMfTunUZmoXazcGMqac6Bp
 S/lLTQFeXqRikKzyyIX68LzlYYNx3efPuMTpkdPGZT8Nhrph/L+ug4XD/Y13zGUdslAk
 n4ifderTpDuWAMWyoIo2saWay86B4I6mwPg0fFel2uYWjwfXDfVBfjj1bgwK3cVTgnR1
 n/hj17A0MHwkEJSmOVZmCAoOJTIXkYIq5pTr4oTbr1/3RdAP4LlBakISpzigrJnUzYAg
 Ctcw==
X-Gm-Message-State: AOAM533QPzbKDfvr4u/ed9SOOJ/bWGDOCBScsphdSyWlFgjWFDIjfFpB
 6t/cWJ6YknCMS3wJo7Ep5hS9d1AgC85S3A==
X-Google-Smtp-Source: ABdhPJwCbJydztxsaJRWMPiKOT4hMuN+hHwbIbtvAvgLZGDGbJ/JN0fwZr30y0hbtQZXIDGZHjnPHA==
X-Received: by 2002:a05:651c:54a:: with SMTP id
 q10mr5930164ljp.420.1622198370217; 
 Fri, 28 May 2021 03:39:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c4sm438895lfc.258.2021.05.28.03.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 03:39:29 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
Date: Fri, 28 May 2021 13:39:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-16-vkoul@kernel.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support
 for DSC in topology
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions upto 4k. For more resolutions like 8k this won't
> work.
> 
> Furthermore, we can use 1 DSC encoder in lesser resulutions, but that is
> not power efficient according to Abhinav, so it is recommended to always
> use 2 encoders.

Not power efficient because the second DSC would also be powered on or 
because single DSC enc would consume more power than two DSCs?

> 
> So for now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 18cb1274a8bb..bffb40085c67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -609,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive upto (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
