Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B768FA2F
	for <lists+freedreno@lfdr.de>; Wed,  8 Feb 2023 23:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9B410E8AC;
	Wed,  8 Feb 2023 22:18:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D5E10E8AC
 for <freedreno@lists.freedesktop.org>; Wed,  8 Feb 2023 22:18:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id dr8so1045275ejc.12
 for <freedreno@lists.freedesktop.org>; Wed, 08 Feb 2023 14:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
 b=yjjwHJecKsnyrg8KPmSqiXjjFu98Uu2LRvMN+REP94WD9IEggEzD9t0Cd5M7EHC9DK
 zbxuE7uh/LUmtv+EJxvgaOGw+/a9xq3YTPtr/P/4MHaSMTPkvRWmmkDjXGpbr59YlL5v
 qLkhOmLNlDiJX8Dd0UYSu0MCYIyeUeoRg/vPtCGuFiLdAGzeUJeZgUSf0IYCow4FzI5Z
 sJSaQjEOKJJbq06HlrU/EizpM4dx09aADyIp2M/3Lg6p39w2AbZpW5a10KEGocCq9z+0
 bNyBbIqrXiPBpQS+xVQXPgpLrl2e0LW5lBDMWV1VJpRBHwIqHQbHrRW5KkohheflL/aF
 WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+j6KFfx3Qmji48Cg2CDZ+WAkdPyel9k/170nDiJ78M=;
 b=UpebYXCKKEva1eclYnGjL6usk8zgtECYJYDfhWTfWKxxYEIi32QmDOuQPHCbWTCqh8
 ldFGvy1Q4ehsxPn3xTriIwXn9zKAPy3hQM7dBl1IL4u08H1uFA3cUSC0MTcoR/t1w2/w
 M1bPjv+hhgbjff7TFbyA9RqZ8NAkOn6izqko1yjQTHJw3WpUnCRVCbn2JT4QHlxZyDCG
 JAE0/lFPHv8Slu3EtRAC3JxK+o4DR/GYp1hAAhNC+j/hvqoxqpl/TWckWuImFZ/Nfxvf
 xgxv9YNW2o0/rHtYS4M/Q1ZzBxQiBXBSRZ+t3bUgtCPteCV/MhBh/n4TIqemxuKDB5Te
 g7Bg==
X-Gm-Message-State: AO0yUKW518GZZqUnUGTJ0yxE4p1g4Pc43ykCKEJm8Ax3pnbYaNqQTdYn
 6Iklojtccxs6uVzsmrdnkUkNYQ==
X-Google-Smtp-Source: AK7set+S1W2pAxZxf43mLeE36cu3JKEoD8I483Ygu7n6ijkNwN48EBk193sZSV5rlHbyvl6slS1QVg==
X-Received: by 2002:a17:906:c9d2:b0:8aa:9831:6eb6 with SMTP id
 hk18-20020a170906c9d200b008aa98316eb6mr6806195ejb.18.1675894692495; 
 Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ko3-20020a170907986300b0088b93bfa782sm13274ejc.176.2023.02.08.14.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 14:18:12 -0800 (PST)
Message-ID: <884097ab-41c7-2889-5b11-91451e2f994a@linaro.org>
Date: Thu, 9 Feb 2023 00:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
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

On 08/02/2023 23:37, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause issues when trying to read/write to register in
> get_autorefresh_config(), because the core clock rates aren't set at
> that time.
> 
> This used to work because phys_enc->hw_pp is only initialized in mode
> set [1], so the first prepare_commit() will return before any register
> read/write as hw_pp would be NULL.
> 
> However, when we try to implement support for INTF TE, we will run into
> the clock issue described above as hw_intf will *not* be NULL on the
> first prepare_commit(). This is because the initialization of
> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> 
> To avoid this issue, let's enable TE during prepare_for_kickoff()
> instead as the core clock rates are guaranteed to be set then.
> 
> Depends on: "Implement tearcheck support on INTF block" [3]
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
>   1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 279a0b7015ce..746250bce3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -587,39 +587,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
>   	kfree(cmd_enc);
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_phys_cmd *cmd_enc =
> -			to_dpu_encoder_phys_cmd(phys_enc);
> -	int ret;
> -
> -	if (!phys_enc->hw_pp) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> -		      phys_enc->hw_pp->idx - PINGPONG_0,
> -		      atomic_read(&phys_enc->pending_kickoff_cnt));
> -
> -	/*
> -	 * Mark kickoff request as outstanding. If there are more than one,
> -	 * outstanding, then we have to wait for the previous one to complete
> -	 */
> -	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> -	if (ret) {
> -		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> -		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> -		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> -			  DRMID(phys_enc->parent), ret,
> -			  phys_enc->hw_pp->idx - PINGPONG_0);
> -	}
> -
> -	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> -			phys_enc->hw_pp->idx - PINGPONG_0,
> -			atomic_read(&phys_enc->pending_kickoff_cnt));
> -}
> -
>   static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -645,8 +612,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>   	return false;
>   }
>   
> -static void dpu_encoder_phys_cmd_prepare_commit(
> -		struct dpu_encoder_phys *phys_enc)
> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> @@ -704,6 +670,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>   			 "disabled autorefresh\n");
>   }
>   
> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
> +		struct dpu_encoder_phys *phys_enc)

Could you please move the function back to the place, so that we can see 
the actual difference?

> +{
> +	struct dpu_encoder_phys_cmd *cmd_enc =
> +			to_dpu_encoder_phys_cmd(phys_enc);
> +	int ret;
> +
> +	if (!phys_enc->hw_pp) {
> +		DPU_ERROR("invalid encoder\n");
> +		return;
> +	}
> +
> +
> +	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
> +		      phys_enc->hw_pp->idx - PINGPONG_0,
> +		      atomic_read(&phys_enc->pending_kickoff_cnt));
> +
> +	/*
> +	 * Mark kickoff request as outstanding. If there are more than one,
> +	 * outstanding, then we have to wait for the previous one to complete
> +	 */
> +	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
> +	if (ret) {
> +		/* force pending_kickoff_cnt 0 to discard failed kickoff */
> +		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> +		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
> +			  DRMID(phys_enc->parent), ret,
> +			  phys_enc->hw_pp->idx - PINGPONG_0);
> +	}
> +
> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
> +
> +	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
> +			phys_enc->hw_pp->idx - PINGPONG_0,
> +			atomic_read(&phys_enc->pending_kickoff_cnt));
> +}
> +
> +static void dpu_encoder_phys_cmd_prepare_commit(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +}

There is no need to have the empty callback, you can skip it completely. 
Actually, if it is not needed anymore for the cmd encoders, you can drop 
the .prepare_commit from struct dpu_encoder_phys_ops. And then, by 
extension, dpu_encoder_prepare_commit(), dpu_kms_prepare_commit(). This 
sounds like a nice second patch for this rfc.

> +
>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   		struct dpu_encoder_phys *phys_enc)
>   {

-- 
With best wishes
Dmitry

