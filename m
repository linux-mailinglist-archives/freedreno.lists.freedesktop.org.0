Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517506CF749
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 01:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AE510E54E;
	Wed, 29 Mar 2023 23:33:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4E10E54E
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 23:33:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so22299285lfa.7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680132810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zVMAwGVkpyNJLaTUfZNtYcn0toUrAEH2lIEjZ7lN92Y=;
 b=azgrTPl4KSszx0gApDao81k0idOnqn8U0qTnYuqwX/mpAgrWNrA1ASPxw6eHJtaHkB
 Be9+dmcm2aOXY4DUz2E2SBq1l3uKK5XZQUToH+ytCPyzxhJ79MOXait/RVFLE2HBc3jP
 B/wKqFC4R9rwV61I87JXWHYkHsjSC7nYYU0FcwS1gtXLHHDJ5Dg59nNBwdLnTSkfcJ2z
 87hNIcYhxyCq3CHLR3/cQbjUBIaBhUXLiqrJxm0YHJtcz3znDuU+stE/VbRBSLzkeCUQ
 xutLW0QguooRJ1bVDbR8A5GYvmmsTcUG1FnOa+ZKLjkOp9YLF5/WGzzhrCEiLnH1PATN
 fO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680132810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVMAwGVkpyNJLaTUfZNtYcn0toUrAEH2lIEjZ7lN92Y=;
 b=x+QIhoRcmlP2s3Y3zmx2feLCrtatd01yItflvZ4dlgne9apYaYsH3D8l5afQnI302D
 tyI/bGUJiSKoXlQt3zGvccJGqLe5+DkfAXanwIF42MQlShbrtGz/MQldYTtfcD1Qz4BX
 JKDQEz46BMMkDaa8OqdTTxfa/GyAV8IhimOVqJz8ymVayzUGbnQG0wVR/gCe1YJftiGE
 Bj3m663qGAnHDLQjQXxgzoxmOmhKQsoAbesZhn+CXxQhCYfDH0BHUbW9js6jxhzrTHtl
 stZuMBi/rTzHHvvNyCjE28f1YIpipmJ1aYdwIXePg+c3YrSKce+dihvuUASZbM5E/XZX
 2dJA==
X-Gm-Message-State: AAQBX9eIUC369KvFSE+SjYS9Det3P+BaOPmH7dMcVOmH3bwqYB5/swKE
 ZWjMC/+s/erk6Xj6Ta4zd9jwXg==
X-Google-Smtp-Source: AKy350YpIg5GoYGwOX8o7utB+qDQlYL7axpx2k2XD36tkMfg/3hbs2N/Yi2NCJ1vx7y6SWpejl9Meg==
X-Received: by 2002:ac2:53bc:0:b0:4ea:e688:a04a with SMTP id
 j28-20020ac253bc000000b004eae688a04amr5778658lfh.66.1680132810008; 
 Wed, 29 Mar 2023 16:33:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h6-20020ac25966000000b004e9b4a8f738sm4686178lfp.152.2023.03.29.16.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 16:33:29 -0700 (PDT)
Message-ID: <5b80d59c-7c61-44ca-19a0-d319433fd328@linaro.org>
Date: Thu, 30 Mar 2023 02:33:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-4-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-4-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC 4/5] drm/msm/dpu: Fix
 slice_last_group_size calculation
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 648c530b5d05..1a1a0f6523f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	if (is_cmd_mode)
>   		initial_lines += 1;
>   
> -	slice_last_group_size = 3 - (dsc->slice_width % 3);
> +	slice_last_group_size = dsc->slice_width % 3;
> +
> +	if (slice_last_group_size == 0)
> +		slice_last_group_size = 3;
> +
>   	data = (initial_lines << 20);
>   	data |= ((slice_last_group_size - 1) << 18);
>   	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> 

-- 
With best wishes
Dmitry

