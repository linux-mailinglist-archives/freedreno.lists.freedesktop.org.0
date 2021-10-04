Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22975421A46
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 00:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699246E22B;
	Mon,  4 Oct 2021 22:48:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D386E210
 for <freedreno@lists.freedesktop.org>; Mon,  4 Oct 2021 22:48:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so77468532lfa.9
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fuYKZBlsBN/oAWqlM2Px7R4QB8Yf2Dd4kLqSjdySbDs=;
 b=xDBuXAYBOQZ3FoLfObUjS3Oy8+W1+6Lc640YUmCqhW9bNWScjA3eE90pEkRYKrdxCP
 /+TqIXbhPi6BWze7P7HZ+u43LZtcMz7ob3A/I6JkY+1Ti+0WRu/34mRrDPuBiYWNhN1l
 JPvD0Za7digs9sr22Adxwxi+mnuQ1YfvtbV0wPYGGuyGhA756v13adXoa35h3r7ckczB
 fXSpc3+c9iDYrNhtSiquLEsVogw44iroJc3J7jsHUK1AIbD+3ckM0A2kdvsVT+omsa07
 H3THafo7jhLt739RjZuTHicfOpLwlJswq1sL/yrlmuc0ZFu/tt/mqRGo1v0YeZjdKADL
 pjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fuYKZBlsBN/oAWqlM2Px7R4QB8Yf2Dd4kLqSjdySbDs=;
 b=StYf9PbUUIq6lb3I1rBjVVL9kyyPhGrwQ5SVC7trG1pm6yWji2jgpfBbKY75nRxoU+
 9G57BPU8ucYfaIUWCIwULLenp4UsUS5BUrLFkEBmlLhk/oTX1Duxl66bNuMD3cdk/uRA
 rbRlEV/UEsI/uJCwDhbZF3IbhTDvRhrd4/le63Kk92WGq3iXAgSduPR7X3F7FF+y94wR
 uD267C8bJf7M7LKXKujkjE04mWkdCBD9JFqXX+QF7xEuxJHeKJiOmbBGEKc63OQYn8QU
 evuuA9X3RJe70yG1GHGPbTWLBCoi1cLfYOkq8+hUYnRlrec/2mqvo1jz1/hD+GJh4TH5
 KqFw==
X-Gm-Message-State: AOAM532jggn31IxIrhY2K0pDRD94d7uLgQqlCEdNaNJhJhrvwEoXoIzc
 wKFAo0tb70NZ6n/k5/I6RKdmgg==
X-Google-Smtp-Source: ABdhPJyQ5BQeCxSIG/H54WDxN3wJp13/97SBah0tsoBTsQykpd2oC1CCjJ2td9Srb0UGTiEzbAwXmw==
X-Received: by 2002:a05:6512:1520:: with SMTP id
 bq32mr17670181lfb.232.1633387721505; 
 Mon, 04 Oct 2021 15:48:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e28sm1881117ljo.63.2021.10.04.15.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 15:48:40 -0700 (PDT)
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-9-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fe36a62f-11b7-aac5-5c6f-9690ab739fd1@linaro.org>
Date: Tue, 5 Oct 2021 01:48:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-9-sean@poorly.run>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 08/14] drm/msm/dpu_kms: Re-order dpu
 includes
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Make includes alphabetical in dpu_kms.c
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-9-sean@poorly.run #v2
> 
> Changes in v2:
> -None
> Changes in v3:
> -None

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..fb0d9f781c66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -21,14 +21,14 @@
>   #include "msm_gem.h"
>   #include "disp/msm_disp_snapshot.h"
>   
> -#include "dpu_kms.h"
>   #include "dpu_core_irq.h"
> +#include "dpu_crtc.h"
> +#include "dpu_encoder.h"
>   #include "dpu_formats.h"
>   #include "dpu_hw_vbif.h"
> -#include "dpu_vbif.h"
> -#include "dpu_encoder.h"
> +#include "dpu_kms.h"
>   #include "dpu_plane.h"
> -#include "dpu_crtc.h"
> +#include "dpu_vbif.h"
>   
>   #define CREATE_TRACE_POINTS
>   #include "dpu_trace.h"
> 


-- 
With best wishes
Dmitry
