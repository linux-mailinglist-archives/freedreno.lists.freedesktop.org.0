Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1570CAB8
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 22:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0953A10E37D;
	Mon, 22 May 2023 20:18:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F910E37D
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 20:18:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f24d8440c9so5017900e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684786683; x=1687378683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37m5+D6QbSo7LpsLyUnajXaAQuo/moN3fPGc1pIbZaA=;
 b=jOt+EAODFpuxIJLWaKzdp+pMdUS4J2LONY/bPDZ1UV71sTDvUl1mAhEKKQmvxqDAxs
 ec9wpq9XKKsxfr6odEx5txda1qV8uzEJC26OH0lyIJ8eo4k5cJdxbA8IuKDfHtsESHvs
 giO+lt0n7/+N/qeIdl/rCoHKUfQLcMR6NqTJHa1V2uwMKwCGyZF2mYxGVZb8yskiWuKZ
 XjHJF9K4LpDXQ8r9fUXGW3QPN7PJW3f6ivBuXc8n71i95zzVzy13SdB6wHyxkGG1/kMJ
 NB0jDlVqefoBKhyzIj0EnVj+z4k/Foh0XF8FLKuxPAfNp0O5hFpo2uZsa/IpQRnyNloW
 +yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786683; x=1687378683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37m5+D6QbSo7LpsLyUnajXaAQuo/moN3fPGc1pIbZaA=;
 b=hXBERLrSglwMAqCS5r0o8g+GWte9S/vE3OZkVnIgqS9FPy2LbMYSwhMDGHoXCvQ3/D
 Xs3s2/6IjuiCmHCGJbV4k6+NPN4mhliNIh7+kliAaMl4G59oMkG9LvzaK0i5aCUD6cqn
 Qs2/4+7x5hR1DIqNTsOLJ+IkN8byCZHg+35eyn/Qq9iSq2aLqKx6iaqena5xDge8toIQ
 XQzLr/bCKNFIu4aUPaPWuOr3HjGbl/PiRXu9MAQPE/lid30R4OrJEcG410iRg8yY6CAO
 BHbdxOisPDeWpkq7ouKCnlakz9yXIFkTss7sO0QLfK9wNf1BcfWv8SEiWqQQNE61gYsm
 vsmw==
X-Gm-Message-State: AC+VfDy3oSD6youjUiqlQ5DHdcZFbY2nFvK+xYra0OouJ5xh7STQmM8n
 jJR0ZGKOzSg9i5jaSnaOLyPT4Q==
X-Google-Smtp-Source: ACHHUZ4Yh5ixyr5evffTASHfLrrR9A5Kjg+Xi2i0N+jguD6R64U7zzHl/6oiWqR/erTmCJzKuZ9/uw==
X-Received: by 2002:a05:6512:6c4:b0:4f4:aeb8:aebe with SMTP id
 u4-20020a05651206c400b004f4aeb8aebemr1372588lff.25.1684786683546; 
 Mon, 22 May 2023 13:18:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a5-20020ac25205000000b004f392625952sm1093573lfl.26.2023.05.22.13.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 13:18:03 -0700 (PDT)
Message-ID: <d5e232d6-b789-a8c3-4ec5-7af0b9d8b9ae@linaro.org>
Date: Mon, 22 May 2023 23:18:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
 <1684783853-22193-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684783853-22193-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v12 01/10] drm/msm/dpu: set DSC flush bit
 correctly at MDP CTL flush register
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/05/2023 22:30, Kuogee Hsieh wrote:
> DSC flush bit is the bit 22 of CTL flush register. BIT(22) is expected
> to be written to CTL flush register to indicates that DSC is ready for
> flush. However 0x22 (BIT(1) and BIT(5)) was written mistakenly at current

DSC_IDX is 22, not 0x22.

> implementation. Fix this problem by writing BIT(22) to CTL flush register
> for DSC to work properly.
> 
> Changes in V12:
> -- split this patch out of "separate DSC flush update out of interface"
> 
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4f7cfa9..69d0ea2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -525,7 +525,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>   	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, BIT(DSC_IDX));
>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>   	}
>   }

-- 
With best wishes
Dmitry

