Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B291F6A9F
	for <lists+freedreno@lfdr.de>; Thu, 11 Jun 2020 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D26E0AB;
	Thu, 11 Jun 2020 15:09:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B3F6E922
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 14:37:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z9so7169456ljh.13
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8JuzWgGQJqJMJ7NStV0+vrbD8KPYxNrC1ErgrGwRP8=;
 b=LP7lYKyBcJ0c/zsKM7VsENoVZuu4RxJoAHYyk5amgZL8KHIqFHSHcYDWO4bwokeqDm
 1yoxQG/GNOsK1bnJCWXa0n4OEOPy9qpPpou5AB7dkzaT5c8Gd+f/bBbHD+ol5B0+hSdQ
 MWRarKhSKjVRSBCKJZrJyi5P/51je+mbvTysRKXD1qx5mtDbzovfC5ZgW1oxUJCAHwY2
 G0aWXUvZdMH9olr6zHtvBFoUvqsE+G65j+lgCRT+JKC1r0bSCoawClyD+XLmOydn/aZD
 0IduyObRb+ErjnUjGesbWMuux2FXMcbNWrsA0/qsyRtr7v67lhWpDwFSZ1NzWbPVfBf+
 mGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8JuzWgGQJqJMJ7NStV0+vrbD8KPYxNrC1ErgrGwRP8=;
 b=FsGjzL8cySeAoTtTGx9O6fr5lRqr8iN7zgG9NQxHe4eWpTOMVogXrBx+ye98jqmL30
 M7V5Mf9z+OxWcN0SXl3kZaSamv9oltJheR3GbVf1M3TJZHY8sSNjQhBMxGcnbFw3H9jr
 yMWxtBtBXtdvVmJYjC7xCV3e3RcSUs4ZHk3G5+txVov6xNdPxFovBbcNYjro2XrgxRuS
 SvdyI0LUMYfpd5GbP53DecZLNSn72Dc4cZMnAs8vvYAVCMtJM/qfC+egOQx3S+NhyTCn
 oqK8YJJdSNfIowDkD+RXuf6cUMEk69AuM+N2jiR0TQ5KLnBWs9UxrwzSmtn1esKODPQT
 WzCg==
X-Gm-Message-State: AOAM531kUDlnSh/PrWZ+7cvzkEI0cFc9p0ki6sTZtByLBnYWxsm4NMRx
 Rvbb8s1EhVHGVMcKDReBr4Tq4g==
X-Google-Smtp-Source: ABdhPJwbWAFtv28FnS27QIotAn5zL/uv6fdd2W4GB2WhoiUk/5Sup8589qE/tLC4x6jv6a1uVVLiLw==
X-Received: by 2002:a2e:8e82:: with SMTP id z2mr4314872ljk.71.1591886274014;
 Thu, 11 Jun 2020 07:37:54 -0700 (PDT)
Received: from [10.0.0.100] ([94.25.228.141])
 by smtp.gmail.com with ESMTPSA id o4sm844112lfb.75.2020.06.11.07.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 07:37:53 -0700 (PDT)
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20200526032235.21930-1-jonathan@marek.ca>
 <20200526032235.21930-8-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
Date: Thu, 11 Jun 2020 17:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526032235.21930-8-jonathan@marek.ca>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jun 2020 15:09:52 +0000
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm/dpu: add SM8150 to hw catalog
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/05/2020 06:22, Jonathan Marek wrote:
> This brings up basic video mode functionality for SM8150 DPU. Command mode
> and dual mixer/intf configurations are not working, future patches will
> address this. Scaler functionality and multiple planes is also untested.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 147 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>   2 files changed, 149 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1e64fa08c219..f99622870676 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -90,6 +90,23 @@ static const struct dpu_caps sc7180_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8150_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.max_linewidth = 4096,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2_5,

It seems you missed sending a patch adding support for 
DPU_SSPP_SMART_DMA_V2_5. Could you please point to it?


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
