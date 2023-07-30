Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47157687BA
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 21:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EC610E137;
	Sun, 30 Jul 2023 19:56:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A6910E137
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 19:56:54 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so57749731fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690747013; x=1691351813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dez6yROj2mk37yKZWkEbFWMrDjDN4RNQY9j12HF2svQ=;
 b=uo/lnXv9TCGvKJiiNFGpvPN8UjlcVV61NSMYHkc0aX33dW7ZG1BMLX5kBMMMfSH25P
 LrWpkv7/QRcoP6K9ebnSKAKkKjaX3p3Zz0v8EKfnfFmp9R0BK16YKrEOp1cPPKEgXHbi
 xL1pII2RYhSbX276rFnSfxOg3HNWWZ2RJoW6jO1qtmwIREBtpHvQgpGhj+wJrrGMxCk2
 f5SIOgm/J//1m8XVJIWmxhXE1RNRJ3+Ai7OmwJplqMEJSF1s4+zWJceksQlIPNkxs4kJ
 BoyNH47L0fvDowUtaZ1cDqr26YMOjeeIP3AsDEfoN7aV+pqoMWJVJMsIUWg/4nsQfWvg
 f6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690747013; x=1691351813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dez6yROj2mk37yKZWkEbFWMrDjDN4RNQY9j12HF2svQ=;
 b=N+sJ6fbYBeEvSJx+rZV8hxVzJxUx2PNqUTMGSX9BCOXImbYqfz4tGjgJQpMTRK4giW
 wJ55hp11C1yZNpId++rtVTgrS+a0xojYcQeL4Pw7NcRJ6YpCG3hYVEx4iPspG3pD/V4G
 gE6V8eJ1v04lloM8GOsiF51y+6UD/PmeW1lb4XCUZxD9STIUuGtohiCvhyvhMVoJrT3n
 tlDlODZg1cLR2nV8hj5BycJ3QCK3YNktcPaVJtj4ij5nE1Guqjg9QHArlGLmecYldk+c
 voJyxdQtovRtbFxdXaWSWGNN/I+2o9LdnxWhm4IXxS2YtOzGgrFcueoNq0I0gsJcvf7J
 Wcug==
X-Gm-Message-State: ABy/qLYgH8ti0hW6YVHomVs/H7Q9+WCvl7p/Xtj9lOeDSo8L5D1HS5xt
 ydxQ+jh4f5v61zq7HS17s0KX5w==
X-Google-Smtp-Source: APBJJlFMM0nVE1uEWBGAeggc2Wnw7K0tokyDh3LQAI156Z/Fbv8lY4fRXhLjBSWvxetNAJN51x91cQ==
X-Received: by 2002:a2e:95c6:0:b0:2b7:339c:f791 with SMTP id
 y6-20020a2e95c6000000b002b7339cf791mr5104410ljh.25.1690747012540; 
 Sun, 30 Jul 2023 12:56:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a2e9614000000b002b9af8422a8sm2213706ljh.130.2023.07.30.12.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 12:56:52 -0700 (PDT)
Message-ID: <009f05ab-5425-5afe-4381-d8b5df74d1d9@linaro.org>
Date: Sun, 30 Jul 2023 22:56:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
 <iicue6zvfcv5jhwhemivl7fjjiil6w7a74owafrztqlc4eakzp@fao3dzsil2tf>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <iicue6zvfcv5jhwhemivl7fjjiil6w7a74owafrztqlc4eakzp@fao3dzsil2tf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/8] drm/msm/dpu: move INTF tearing
 checks to dpu_encoder_phys_cmd_init
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/07/2023 22:52, Marijn Suijten wrote:
> On 2023-07-30 03:35:18, Dmitry Baryshkov wrote:
>> As the INTF is fixed at the encoder creation time, we can move the
>> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
>> This function can return an error if INTF doesn't have required feature.
>> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
>> useful, as this function returns void.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
>>   1 file changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 012986cff38c..adbd559a5290 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>>   	unsigned long vsync_hz;
>>   	struct dpu_kms *dpu_kms;
>>   
>> -	if (phys_enc->has_intf_te) {
>> -		if (!phys_enc->hw_intf ||
>> -		    !phys_enc->hw_intf->ops.enable_tearcheck) {
>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> -			return;
>> -		}
>> -
>> -		DPU_DEBUG_CMDENC(cmd_enc, "");
>> -	} else {
>> -		if (!phys_enc->hw_pp ||
>> -		    !phys_enc->hw_pp->ops.enable_tearcheck) {
>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> -			return;
>> -		}
>> -
>> -		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
>> +	/*
>> +	 * TODO: if/when resource allocation is refactored, move this to a
>> +	 * place where the driver can actually return an error.
>> +	 */
>> +	if (!phys_enc->has_intf_te &&
>> +	    (!phys_enc->hw_pp ||
>> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
> 
> We're probably overdoing it here if I request a WARN_ON when has_intf_te
> is true while enable_tearcheck is also non-NULL?
> 
>> +		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> +		return;
>>   	}
>>   
>> +	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
>> +			 phys_enc->hw_intf->idx - INTF_0,
>> +			 phys_enc->hw_pp->idx - PINGPONG_0);
> 
> Note that hw_pp wasn't printed when has_intf_te is true.  And it doesn't
> seem like that pointer is dereferenced anywhere in that case, perhaps
> hw_pp may even be NULL within dpu_encoder_phys_cmd_tearcheck_config() at
> some point.

No, if I understand correctly. It is only called from 
_dpu_encoder_phys_cmd_pingpong_config(), which checks for hw_pp. One can 
not run CMD mode display without a pingpong block anyway.

> 
>> +
>>   	mode = &phys_enc->cached_mode;
>>   
>>   	dpu_kms = phys_enc->dpu_kms;
>> @@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>   	phys_enc->intf_mode = INTF_MODE_CMD;
>>   	cmd_enc->stream_sel = 0;
>>   
>> +	if (!phys_enc->hw_intf) {
>> +		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
>> +
> 
> No need for this newline?

I just usually insert an empty line before return. Let's remove it.

> 
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>   	/* DPU before 5.0 use PINGPONG for TE handling */
>>   	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>>   		phys_enc->has_intf_te = true;
>>   
>> +	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
>> +		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
>> +
> 
> Same here?
> 
> - Marijn
> 
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>>   	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>>   
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

