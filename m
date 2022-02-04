Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4E4AA334
	for <lists+freedreno@lfdr.de>; Fri,  4 Feb 2022 23:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A3A10ECA4;
	Fri,  4 Feb 2022 22:36:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87010ECA4
 for <freedreno@lists.freedesktop.org>; Fri,  4 Feb 2022 22:36:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id t14so10428145ljh.8
 for <freedreno@lists.freedesktop.org>; Fri, 04 Feb 2022 14:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
 b=yAtSvEMHAuKcx9GO/1aZqwwNTknxA1L7vce6ArzLQbnqULt7LUrkE0CDGvrJTwT+2q
 Opk0ugJBzAOgXCBlfKM4aLgLlYt25b07+9bcEn7oXJSHdomwWpzRDUrzXvYyYCoyVMil
 xM73zdZAHrTM+mJYpqk6Cr52kp7/eCdRTrjgAMvfr5sS99VYYNtdUH6xV7ZEJP/pZKXE
 iGZmh39HN0ZXMISDAoC7mWV/ULMDi7VzSnVDvuTOe9rfOvPHVg3QdEGKLQBL7Jn7riTe
 FxL4/XwYJJ/QR25B4iw9inaz0gs+I3UydgMxwLjOsV75gthBM0y6B3vO+npCt4syc5dl
 odjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c7x/cvlOShTxU2gJe80KgOcsq6QIAA84CFY6qHZapHE=;
 b=nmT1KMSP2MSkTUjKVSZUhVOpHS6EKfhF7eCzqEMzi8dmkcuRajuV1BygWN83hojzva
 eOZbkSTT2bdtk9oKMHaXATyajnAPjIlloZqeVHGaZS0+0aQPpePjgsUckeNzQSFXU+9K
 +uc9i9SYU2UdUaGzqLkl6Tk94xFcaFYM4fRKiHAqFe9aaFuSH5aeusFVTyzePoDldjwq
 hEswuH14JQuTUa+vjaBytQHiWoIJh51f2F4R89Ay8cOnDpr/iJS6uixdtg9aYPsUd6k4
 uXJg3uQwXuSbOPFE6i9hRedVE4QINekBUCjMzWwAc9wbrDIStmY2Kw8l1HXsIQfXJyBX
 rkow==
X-Gm-Message-State: AOAM532T1Y3CuOgoGbCKUBiFcmWpL6VzY5Z+LLWImNXLbH18/QuBfO9m
 hRe6rYL5jqTmsmVZoDo2PvSLBw==
X-Google-Smtp-Source: ABdhPJza7guCeIafEsHqEj+4mjDnBcgDEeyjXetzyWRS8/qRpdN2KL/BqPWnHD4+5zgY4hI2FXDI4g==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr697734ljj.324.1644014193996; 
 Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j2sm478643lfc.174.2022.02.04.14.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:36:33 -0800 (PST)
Message-ID: <06082678-f677-b4e4-67af-d45d11f81c26@linaro.org>
Date: Sat, 5 Feb 2022 01:36:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/dpu: add writeback blocks to
 the display snapshot
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 markyacoub@chromium.org, quic_jesszhan@quicinc.com, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Add writeback block information while capturing the display
> snapshot.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6327ba9..e227b35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -987,6 +987,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>   				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>   
> +	/* dump WB sub-blocks HW regs info */
> +	for (i = 0; i < cat->wb_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> +				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> +
>   	msm_disp_snapshot_add_block(disp_state, top->hw.length,
>   			dpu_kms->mmio + top->hw.blk_off, "top");
>   


-- 
With best wishes
Dmitry
