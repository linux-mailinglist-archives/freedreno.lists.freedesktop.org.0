Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD126F4D05
	for <lists+freedreno@lfdr.de>; Wed,  3 May 2023 00:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ADE10E109;
	Tue,  2 May 2023 22:42:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B1110E0BF
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 22:42:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f00d3f98deso614687e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683067332; x=1685659332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OoGjVoe5CX5x9isNYM2e3Wk8FpfphvTo6RdDOuxz1Q=;
 b=hiNOid1JZFCR0nWkeMhUqACmCPxMSXATIgVxyAqZRb/BZ9qYmPWUOl+9U1t1l/HoId
 Zw6kbAjPvxEr0o4ZaVdP5uxMBbCoKfdK4L6rRRbXmVxfiljUloU28QMUEdtSJWkyFoLp
 FwvzyH68UnCS1vE/ORnBtggguwD4duZKlOXVDsLna6q+6Ko2R8Ashl3NedkducMgzDkW
 I+OxH12oIUUrKycH/7aO62+I84j/7/UirTW7HkxzAsjgUVVZlhoNoiyfNvtyfS+lK0rI
 YmKAp29Cd8RTuKHBvavoQGN80AyrmtTGDpwUebxnkcutAQ/1cE+n0iSL432thmlynzn0
 2QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683067332; x=1685659332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OoGjVoe5CX5x9isNYM2e3Wk8FpfphvTo6RdDOuxz1Q=;
 b=HGW2VatNgAxjyyQxPtuCOzdFSOlm6XrNk++DXDMwB1Ksnc9TZlhvNK0oE/PJuNNYCj
 IqaoLq62eLaRGt6zMernXntX73N2bt+vgNMv0cZI8cFALLArKZAkSegO6q52Fiah7uFW
 cR8CXk55JsyVhvuXfpztDdIzgb/62+Lk/oMkdn0vGOYdByJT6rtZPEUbZIlLXEk6v6GU
 ebQQP+fg4cStEyejrav6uxWiQY2zm+eSkuWBgS7KX9eCu8tA8BMpRPJVlZ4H3Im29RFm
 /KevTbvN8xPcqmbin5gcqfilO6vw59SRwBGLjDVE1Nf1IW99WD7ZEdGvUttqqB36VWn/
 I/Gw==
X-Gm-Message-State: AC+VfDxk1t4q8XNSsN3O++TpeN7GDfWo/+O0q2ibZL3X7nCPZXc7VdW1
 PIyyXviVCF7RnDU1kJJejp31OA==
X-Google-Smtp-Source: ACHHUZ6UfIY4PEgDDZl5KPbEeS9HO6lLQH5WJ2TyVoYK8uxLeQM1jOU8KtbNRY2Wa5bu+IJszRc06A==
X-Received: by 2002:a05:6512:3a8d:b0:4ec:9f37:2cfb with SMTP id
 q13-20020a0565123a8d00b004ec9f372cfbmr31870lfu.27.1683067332313; 
 Tue, 02 May 2023 15:42:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c2-20020ac25302000000b004e8508899basm5641431lfh.86.2023.05.02.15.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 15:42:11 -0700 (PDT)
Message-ID: <4315e96f-ed29-92aa-9549-d6fc9d820de6@linaro.org>
Date: Wed, 3 May 2023 01:42:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC
 bits into PP_BLK and PP_BLK_TE marcos
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
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 00:02, Kuogee Hsieh wrote:
> At legacy chipsets, it required DPU_PINGPONG_DSC bit be set to indicate
> pingpong ops functions are required to complete DSC data path setup if
> this chipset has DSC hardware block presented. This patch add
> DPU_PINGPONG_DSC bit to both PP_BLK and PP_BLK_TE marcos if it has DSC
> hardware block presented.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12 +++++-----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26 ++++++++++------------
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 ++++++++++----------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26 ++++++++++------------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
>   9 files changed, 54 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 17f821c..b7cd746 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>   };
>   
>   static const struct dpu_pingpong_cfg msm8998_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, BIT(DPU_PINGPONG_DSC), 0,
> +			sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, BIT(DPU_PINGPONG_DSC), 0,
> +			sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),

Just to doublecheck: why don't we have DPU_PINGPONG_DSC for PP_3/_4? We 
do have them on sdm845. Is it because we should not use DSC with thos 
PINGPONG blocks?

>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index ceca741..8888bd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>   };
>   
>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>

[skipped the rest, looks good to me]

-- 
With best wishes
Dmitry

