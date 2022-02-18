Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B04BC041
	for <lists+freedreno@lfdr.de>; Fri, 18 Feb 2022 20:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3010E862;
	Fri, 18 Feb 2022 19:27:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFC10E862
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 19:27:49 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f37so7255429lfv.8
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 11:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dSkwxdtJ7mPWSSSM389YG6BGKFFrs7uF7NULsF3otKQ=;
 b=rX2f5T3QqmsMYZfX/LAdi8UDeY7DIzLQyz0GkVZRF5WdMfHmrS3F3EZvx2qXh+ldT0
 +xIaMI+FmPPDSqzPOdP4uijPQoMwMpbHqLSw9YFRUyqpghlr07ZcHjnlzLNlUFjV7DIC
 X+sY/SLWuYwcXw35FWTNRYk4dKoryU6ArrWUi6YpieoANnHtbPxYH7OOQr6j/k1G023m
 Ghcvttr8vhg8iccO6dhZXRoFdBt2Z1s+gbIrdRtoXYuf9M4UoqtSfYMqJlkVjIegq1qw
 IRnr8vPrNMJ4ZMgPrfT/JWO76TpHHl8phi5uDlRQF86z4Tya6gUfZGzGnPd0h6pn5iX3
 1YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dSkwxdtJ7mPWSSSM389YG6BGKFFrs7uF7NULsF3otKQ=;
 b=WZpsjfTXiYnS0Z4drn+n4YAefYnSXzqaWC0CdG/6QLoRCw7Upxr9ado2uQyUgNdvYl
 CM2ccgNBJmUuuxZhX2TrZ8/hcfGeNEpUJGxNJpXpuVqVAvQsDutIwK1HRmzK24d+DLeQ
 E7yjf88g2kdxoQAWgvJ9CEy8CeVd7PaI+GJU8JAKZAztGZc658d5hIcexbg3SEB/eMTV
 wsZDVVGX8PHw/ctj3d1jDee195MSbGT6DQ64MKWI6zytZFjh3AdQQeDX76mtHM7xcNYN
 RGnKIOENw203gM92Eucgbcx2ZsAFRI2uqZv1TFH6gSJynMdrtCg6pWsuQJb9HR8v8hUw
 7NDw==
X-Gm-Message-State: AOAM531FEl7M5eMbZuJO5v0ASnk933p/Ywl1x5PW3zldwZJrMjpgC0gb
 SWuztzkMmp97CdJ6znZ3JZg4f2epE96k7Q==
X-Google-Smtp-Source: ABdhPJwe2iQk4YzsedccWeQbQQtrgZLiKdtan5bdBm+/i0gHBWiHPdzFRwWX6ZegZ9BKKTwgYatdcA==
X-Received: by 2002:a05:6512:338c:b0:443:b61e:60d0 with SMTP id
 h12-20020a056512338c00b00443b61e60d0mr3128828lfg.124.1645212467720; 
 Fri, 18 Feb 2022 11:27:47 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u17sm411376ljd.137.2022.02.18.11.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 11:27:46 -0800 (PST)
Message-ID: <9e2c9151-d460-14d6-46f7-bc32b60ec4ca@linaro.org>
Date: Fri, 18 Feb 2022 22:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: Add a function to
 retrieve the current CTL status
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.bouchara@somainline.org, martin.botka@somainline.org,
 abhinavk@codeaurora.org, daniel@ffwll.ch, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, sean@poorly.run,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
> Add a function that returns whether the requested CTL is active or not:
> this will be used in a later commit to fix command mode panel issues.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 7 +++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 64740ddb983e..3b6fd73eb3a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -91,6 +91,11 @@ static inline void dpu_hw_ctl_trigger_start(struct dpu_hw_ctl *ctx)
>   	DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
>   }
>   
> +static inline bool dpu_hw_ctl_is_started(struct dpu_hw_ctl *ctx)
> +{
> +	return !!(DPU_REG_READ(&ctx->hw, CTL_START) & BIT(0));
> +}
> +
>   static inline void dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
>   {
>   	trace_dpu_hw_ctl_trigger_prepare(ctx->pending_flush_mask,
> @@ -579,6 +584,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>   	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
>   	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
>   	ops->trigger_start = dpu_hw_ctl_trigger_start;
> +	ops->is_started = dpu_hw_ctl_is_started;
>   	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
>   	ops->reset = dpu_hw_ctl_reset_control;
>   	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..ac1544474022 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -61,6 +61,13 @@ struct dpu_hw_ctl_ops {
>   	 */
>   	void (*trigger_start)(struct dpu_hw_ctl *ctx);
>   
> +	/**
> +	 * check if the ctl is started
> +	 * @ctx       : ctl path ctx pointer
> +	 * @Return: true if started, false if stopped
> +	 */
> +	bool (*is_started)(struct dpu_hw_ctl *ctx);
> +
>   	/**
>   	 * kickoff prepare is in progress hw operation for sw
>   	 * controlled interfaces: DSI cmd mode and WB interface


-- 
With best wishes
Dmitry
