Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65D6D03DD
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 13:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7529D10E277;
	Thu, 30 Mar 2023 11:50:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C3D10E277
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 11:50:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id c29so24171383lfv.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680177040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QoRibiTVAEYFvsFZ+MHEldaKUvmO7+7wNLBYVYPwddU=;
 b=AeMnkfVTBTQEnhRn3sXANAC7+gLDc5YUzcCUC+CwLkWHdSGoiMLF71IX44rgmCpi6r
 Y2M9mauL5GcqKUe9E7SxqzfWXkaI8Ro7U8SVAst0q6ECreJ4sLSYXSNm/KBLNbhmh1t7
 hh3dK3ZYkuIKr3ror2bRR6JVi+Q++DoXFEC/2Ru9iGaE5lwtMGtDcJGj1kQvDH/R95Is
 2ZLrNBbnv0Pm0looZeIFCeMWHRu26YGWsPPA3r4cGeeNeMoWhVQDuL/8WdvqokD9oo9K
 fPrC998qewwgOTOHGCwEG39cP6mCrGzZlowEVUSnWpKqAm0TUaI5bNARn9jhrEoV2Upj
 79kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QoRibiTVAEYFvsFZ+MHEldaKUvmO7+7wNLBYVYPwddU=;
 b=KRqywIAOQtg7VyU12E6nkDpfFPQle/D2iYcUDyprUCjomOj9w4jCwRwDZ607pPErWN
 eYxWsH0x/iMH5yKsB+AdkCdV6mXyBwWH42OCO3yBytghKhtVM78ZbXK0NJz1WMwM118E
 Q2icvNtX1SuX/vtuK5q0TLUyt1vX2Duk4bVALqe0M0rMsCadAqrnicVrelqfLj6N8IvJ
 EkUCAIGxzHnP3O8vukhP1FRsKjKpzwGok91LQn+ifinGlagAxp+FNSMjWuxtcpTLOMrh
 XOaA1D31U46l/c3T7/oxHVWQoMzwwhNVPwev5xnpbuqx/cDkE331JIKsZLKL4DFGhm+j
 zQKw==
X-Gm-Message-State: AAQBX9e8Cb1DLIwA9rsSVWTBRt2i5JnMfRCZ/fzUAjBmXzfDNmERsj9e
 yo57J80+FRTYe7f2cnNK79YmxA==
X-Google-Smtp-Source: AKy350YLkkxBXNGuqKnX4Ig0cjte1KaDqpvlBqeFM//qvA76db5DQmNsS+g7Ouofo3DXqOvDrBAGCQ==
X-Received: by 2002:a05:6512:51b:b0:4e9:60a4:b038 with SMTP id
 o27-20020a056512051b00b004e960a4b038mr6954674lfb.5.1680177040268; 
 Thu, 30 Mar 2023 04:50:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05651211e200b004e83fbba141sm5821493lfs.164.2023.03.30.04.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:50:39 -0700 (PDT)
Message-ID: <a282b382-2e75-7f13-03ca-6e85169817d2@linaro.org>
Date: Thu, 30 Mar 2023 13:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-25-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,
 24/50] drm/msm/dpu: split QCM2290 catalog entry to the separate file
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 116 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 108 +---------------
>  2 files changed, 117 insertions(+), 107 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> new file mode 100644
> index 000000000000..48e7d4c641cd
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_5_QCM2290_H
> +#define _DPU_6_5_QCM2290_H
> +
> +static const struct dpu_caps qcm2290_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
Rebase

> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +

[...]

> +#include "catalog/dpu_6_5_qcm2290.h"
>  #include "catalog/dpu_6_3_sm6115.h"
I will not ask you to do redo it now, as it will mess with 50 patches
(unless you fix that in the following ones that I didn't get to yet),
but please rename qcm2290 things to sm6115 or whatever the case may be
so that we can keep the dpu_x_y_abcd sorted.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  
>  #include "catalog/dpu_7_0_sm8350.h"
