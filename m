Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E54B1BB9
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 02:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C420B10E9B0;
	Fri, 11 Feb 2022 01:58:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152D610E9B0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 01:58:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f10so13741739lfu.8
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 17:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OzrUthCxh0bIlSOqitw37R5B8Fdq3tCLDbK6Qh2/C8Q=;
 b=ZQDr0ay1Wz19gMKtrpBi307SVX9tV4tAToNV2JFRDOf5evKqf4+ez4ZTLARzAPCNfO
 z19mj+yT6Zjwnm6oqlIX7sjaWin1aZfrAcsxQhK5kyeouoO0R3iKAhgFWHk8Ve4Mwq94
 Q05NPqR5am5p9ofPF2yOzQPcRThfEEPUra3CuKZ1fJHYkVNwtTYcwztjDxV5GxHMT0Bv
 tvVqBEsa9A8gdH5zjBvbZmKoyXrPss4MRKIzdnmDOunb+f+VK/pHOiUjBhCG768x4KaO
 cgTpTvBq22FeyVqCMmkZLRdlNQAU7f2K8f7XGRY1XchKqvWL1aDU3YY6M14N4x2xlN2h
 EC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OzrUthCxh0bIlSOqitw37R5B8Fdq3tCLDbK6Qh2/C8Q=;
 b=SPClw4ilo+rN5bDUII+2AWyUVivcRalNy3apb4qNfDiZ93lu9bTF9+UkYpvmh4gB6/
 YFMeWbbidYDJ60lXmpeLMOrRdhTqYuPmZppfvQKYsIBWEoz/rOdz4DmPeOYQ3NNX2btt
 3p5XkXrJ8MnGY1YYhdAo/VN1U1LPHAwxOI98bTw3iSDwitZv6nKK7EjRav5OnXKldJDm
 /syYvLlnFo7lSWfoDa/iiKFpJL7TvX79siIhXeNRt27TttT3iji/mjTqCXQJedwW2EW3
 kSA8kud2qVSqmIG1gr5wvyzAayAH7LykQ7qQOvEqMk9+59geNQK2l0KRzi0VJHF8DJg0
 q8tA==
X-Gm-Message-State: AOAM530xSd82TKjRUZbPx/LrKRrGlxE0as320Z/FSeXbOP/hpPCFSMw3
 er9jIoHl8a4DJzPIoR2Kp4Hh1A==
X-Google-Smtp-Source: ABdhPJzT3QRQC9YOW3Jed/SZIBeEBkFTLrX5UNG9bL1oszO0iPRP2KY/T0Vd4bq6K0zrpZWMmc6Y8A==
X-Received: by 2002:a05:6512:3c94:: with SMTP id
 h20mr7009357lfv.480.1644544716355; 
 Thu, 10 Feb 2022 17:58:36 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t19sm2958070lfl.123.2022.02.10.17.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:58:35 -0800 (PST)
Message-ID: <ccbd30f2-7627-f44f-6a0f-e6ef4736270f@linaro.org>
Date: Fri, 11 Feb 2022 04:58:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210114106.290669-1-vkoul@kernel.org>
 <20220210114106.290669-3-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210114106.290669-3-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Update function parameter
 documentation
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 14:41, Vinod Koul wrote:
> dpu_core_irq_callback_handler() function comments seem to have become
> stale and emit a warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Function parameter or member 'dpu_kms' not described in 'dpu_core_irq_callback_handler'
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
> warning: Excess function parameter 'arg' description in 'dpu_core_irq_callback_handler'
> 
> Fix by updating the documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 9341c88a336f..27073fd49fee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -140,7 +140,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   
>   /**
>    * dpu_core_irq_callback_handler - dispatch core interrupts
> - * @arg:		private data of callback handler
> + * @dpu_kms:		Pointer to DPU's KMS structure
>    * @irq_idx:		interrupt index
>    */
>   static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)


-- 
With best wishes
Dmitry
