Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60469538B
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 23:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC2210E74C;
	Mon, 13 Feb 2023 22:03:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617E310E09C
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 22:03:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id k16so3860696ejv.10
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SciaDGlhBSACeEgmQUctvCJzUdxmTqWquIcBNRcQQUE=;
 b=qAUVIMC+kxGeBGNC8PtHQK3/XUIUx+e027q4Aye6trnlmNsJKvFzFM243I+N4pYU5b
 /CC14MXMszJUy5agtczW7mAlyynsNIdLMT5+qjWMdRytyz1cGWVSupc6NvFRRu3RgbmU
 XeZoLLzPgajFYh9kw3YakluNdbpFyZAzoA+q1fth0/8UOadMxeyZlpYuPjC+lxE9ZTne
 jQR+naF+SyZ5BdhPH1Gf9OBhB5SsU5g/sdsBG/yyYR4RhEv2BNV3EY4vAkDyDrF5iFob
 EaXdUn3nVijeBkxhvxGfNkjyB8GWfJFgmRCVfkzJBnWJEFCUxLuEPdw74cCAlH9AA+8C
 tXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SciaDGlhBSACeEgmQUctvCJzUdxmTqWquIcBNRcQQUE=;
 b=Zv/2xPOKwQ0IhKkymysqvpTeK2Tc96sVDY6l4rmf0/SYQRBiIw8fe0R7pqk+xlnrKI
 f/b2fV36mXncpaN+wFPKAb6doonoTUug8kXRkB78LED6JVBdvtaoo851Ooq3mgW03AWF
 kaCQAMgEQ8uNDYTGKh8JVAChFUK0zvl3mzsqNL5yjKcgHaUkJsOc/HGrq0be+LcE1Xzg
 NV2EA+TlU/yDyLqGxbGo+mxNPr/3OKbXo+8MtKi8otelRxQJtST8r1Mzcw0rB4zgwwdl
 NEsTZ7GGJ11hK8FRSn2dS5eWes0tb1qWQi9UEMJx4R2KbG4ofteYJJ+Rf7kLHApDQuHn
 nOPA==
X-Gm-Message-State: AO0yUKV/WMlTzZDsgSGibXKa+rtueAnl4whoGu9sib6nqI2VN1dCzJdH
 c/NGqvzNCBbHMq5LZzXAXk8v0g==
X-Google-Smtp-Source: AK7set/cQftJ3aQ9LX+7ynFyd9oqMGzpGy76JqW65Ia+KeGGF8ri9wWHOvqmZwvJtKPsunxoXmAtOQ==
X-Received: by 2002:a17:906:e99:b0:861:7a02:1046 with SMTP id
 p25-20020a1709060e9900b008617a021046mr377565ejf.37.1676325830819; 
 Mon, 13 Feb 2023 14:03:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 dx12-20020a170906a84c00b008b128106fc7sm396128ejb.46.2023.02.13.14.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 14:03:50 -0800 (PST)
Message-ID: <9e68a5fb-8dc1-481c-ebf3-b6ad3545319f@linaro.org>
Date: Tue, 14 Feb 2023 00:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <20230213194819.608-4-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213194819.608-4-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v3 3/4] drm/msm/dpu: Remove empty
 prepare_commit() function
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 21:48, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(), and
> dpu_encoder_prepare_commit() is not empty, remove prepare_commit()
> from DPU driver.

Well. dpu_encoder_prepare_commit() is not empty. I'd say instead:

"... to prepare_for_kickoff(), we have no prepare_commit() callbacks 
left. This makes dpu_encoder_prepare_commit() do nothing. Remove ..."

Otherwise LGTM.

> 
> Changes in V3:
> - Reworded commit message to be more clear
> - Corrected spelling mistake in commit message
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>   3 files changed, 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dcceed91aed8..35e120b5ef53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	ctl->ops.clear_pending_flush(ctl);
>   }
>   
> -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
> -{
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
> -	int i;
> -
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		phys = dpu_enc->phys_encs[i];
> -		if (phys->ops.prepare_commit)
> -			phys->ops.prepare_commit(phys);
> -	}
> -}
> -

[skipped the rest]

-- 
With best wishes
Dmitry

