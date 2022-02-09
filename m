Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C64AFFD1
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 23:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B410E612;
	Wed,  9 Feb 2022 22:03:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B7010E4F0
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 22:03:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u6so6857973lfc.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Itlsq3+hS5Y9iy3ygo9I7us+gV+aSgo7u4P79ICKVnY=;
 b=BxtvxGZwH9hhHiy8OqyqqNmLvOfu7ij2Mqnmp1/5TkvYA1LfHMseH8fEdM/KqWrykN
 Xm0Q88VB32Y9XlGI2Abv9KXlMdTaG38aIFCdiCuKZojEob2BNqc0PwmETvRdBGt18eNO
 YE2ukUodr4x8Krd0cGDZkTU1gsIkbZNtmCqMaBd3FAqf+BUmkEYElvzH6rLgbqXy/n8z
 t5sLgvnrGB4CX7TiB7d5NG++iEGROz5rrn7xBhS88wDTcJvPGjDeAfCHiPJ+FszE/K1i
 jBF5N31tpafZqL88FgpKmSEWb8qWkdE8RukMSS6pQoW7SgonlfQy6YPimpMCYckSiRVK
 XjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Itlsq3+hS5Y9iy3ygo9I7us+gV+aSgo7u4P79ICKVnY=;
 b=JM/LfaM48TFZ9V6fXxHnAmsVoN8Nt7tQsKaTXw175X4iuWpkCsKrmd5vuaxLpAz1JX
 qydyfnT4GMElxjcge6VWLRTqcs7n6yHb5QYpmyuVnRLyFGbEJ1dPCwiRQxuuzpXGufQ1
 6fHO0w7NsLrMlz2NC0lYrHR12iZjTRqJm7RaHUM4n2JnF+VWYldG+Dba0sFnT80NOx9d
 eLwnBOeSs2pt2H3mOmiKNPPibmOL29mDCEXytuOBTIpQCvYsr14w0eeFk97hw1aAcq5R
 VLT902tzp0A97My7SssIuNBnExcG4MHBGPZL3BOQ++FdZ208dlYbmhzdIBpnvkEY90/u
 SKRA==
X-Gm-Message-State: AOAM5319LbqyzHOHGtHWfKJzTvFEcT89vKAJhbktQdU3eCN+58QLSFNf
 FkqYcGvXWSOHTrLRAjzfscDsrg==
X-Google-Smtp-Source: ABdhPJxlN+/1YXu/VKKNfgOkXudTxUBopzACvjjI7nQLgtidHg+iQN17+32xjG9smnA2peFinqqZPQ==
X-Received: by 2002:ac2:5185:: with SMTP id u5mr3138375lfi.589.1644444192609; 
 Wed, 09 Feb 2022 14:03:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n9sm914012lft.2.2022.02.09.14.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:03:11 -0800 (PST)
Message-ID: <346cb67b-a5bb-b4ad-a15d-d2cfc850ccf5@linaro.org>
Date: Thu, 10 Feb 2022 01:03:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
 <20220201174734.196718-2-daniel.thompson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220201174734.196718-2-daniel.thompson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: Remove spurious
 IRQF_ONESHOT flag
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/02/2022 20:47, Daniel Thompson wrote:
> Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
> which need to keep the irq line disabled until the threaded handler has
> been run.". When applied to an interrupt that doesn't request a threaded
> irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
> which it to disable the forced threading of irqs (and for "normal" kernels
> it is a nop). In this case I can find no evidence that suppressing forced
> threading is intentional. Had it been intentional then a driver must adopt
> the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
> (and avoid calling any kernel API that uses regular spinlocks).
> 
> Fix this by removing the spurious additional flag.
> 
> This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
> with PREEMPT_RT enabled.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6b3ced4aaaf5d..3a3f53f0c8ae1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	/* do not autoenable, will be enabled later */
>   	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
> -			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
>   			"dsi_isr", msm_host);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",


-- 
With best wishes
Dmitry
