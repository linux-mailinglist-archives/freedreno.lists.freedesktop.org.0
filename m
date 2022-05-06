Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1251E0F7
	for <lists+freedreno@lfdr.de>; Fri,  6 May 2022 23:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3698F10E6C1;
	Fri,  6 May 2022 21:19:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD7010E5AC
 for <freedreno@lists.freedesktop.org>; Fri,  6 May 2022 21:19:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c15so10656580ljr.9
 for <freedreno@lists.freedesktop.org>; Fri, 06 May 2022 14:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oMwl69nt03ltzHpIzR8rJJW5j1WrqMF2GreE22q6e10=;
 b=qxz5AD96Jq0/wFGSJTsX8Mdvmh66hAsvzKbOblaT5jCrDi79Qot5CgM7Q+ggVHjMCt
 bvZtb/MZtZKl9J6/kSL/zOhLEw/1BFOFaFU4Oac6aN8mIYoOKd1xsK380EpmD+ZFHc+1
 dSnbDYaqW82cWUMH9Dqn3WChCuC1fL4U7akjOq0XnStIU5Z2IrWM3e/00s+0D89PoF3j
 NiZeQGFqwh6gF7rXqUUA+7h7l0D1GaFAtyUcxtlCs0MfG4+4NM5+Vah+ZRsmefofV9aZ
 BW7SSCi04ZVZ9a52sC8abiqHEoc7Ry5WMVogDaEWa2VxvvUhewHwrAQNZvfqmpyaS4P5
 o8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oMwl69nt03ltzHpIzR8rJJW5j1WrqMF2GreE22q6e10=;
 b=dH/U4jJyUOeRVVMrzxwb52auD33XGKW9g8b+iPaK9611yZFRzkeMn3o2l8sVL/XhSa
 b3Au3doAK4PFdQ4lgt1z5bgqnggYIaSnfxSAJ8bv/LETZnRRW3XyKgwmjXltYNrEDdj4
 hcTjL9FVVzjlGEq/8uEcfNHcp+WHNchoJwelQlWfTjuarvcEumUErlWjY/w0eWAlyyMV
 H9pPIcEW3k5NC4SljqmCXw7mfqCKE9/KQTnKt825hK5Rzg9lHd8pEueD4akjYaD7uXto
 Euc+s0cmA5uWla1tGryUVXqmvr+H2stSFMFvHaIO7KQgDUaUab/JjSNuesHEc/j2aY0b
 SvZg==
X-Gm-Message-State: AOAM53037d3rJYl1JBB2/RFD0f6uTq+WUhvEMh2VrAMYbXdjsnH/TYU/
 o/2B1wvf6qrfSw20N8/vsd/w0A==
X-Google-Smtp-Source: ABdhPJy4jyz1fPpHDuZpaFN7ShjKB7CapLYJg/o0rY1M6hPRzemnQAGJXJeb4GZB22nxkLhDhG+u2w==
X-Received: by 2002:a2e:97d6:0:b0:24f:18ab:2c7b with SMTP id
 m22-20020a2e97d6000000b0024f18ab2c7bmr3135637ljj.236.1651871947230; 
 Fri, 06 May 2022 14:19:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a056512224500b0047255d210f1sm826274lfu.32.2022.05.06.14.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:19:06 -0700 (PDT)
Message-ID: <c11b76ca-20cb-7c68-42f4-1b02a9c2d0f6@linaro.org>
Date: Sat, 7 May 2022 00:19:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220505214051.155-1-quic_jesszhan@quicinc.com>
 <20220505214051.155-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220505214051.155-2-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/2] drm/msm/mdp5: Return error code in
 mdp5_mixer_release when deadlock is detected
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/05/2022 00:40, Jessica Zhang wrote:
> There is a possibility for mdp5_get_global_state to return
> -EDEADLK when acquiring the modeset lock, but currently global_state in
> mdp5_mixer_release doesn't check for if an error is returned.
> 
> To avoid a NULL dereference error, let's have mdp5_mixer_release
> check if an error is returned and propagate that error.
> 
> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 10 ++++++++--
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 15 +++++++++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h |  4 ++--
>   3 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index b966cd69f99d..fe2922c8d21b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -612,9 +612,15 @@ static int mdp5_crtc_setup_pipeline(struct drm_crtc *crtc,
>   		if (ret)
>   			return ret;
>   
> -		mdp5_mixer_release(new_crtc_state->state, old_mixer);
> +		ret = mdp5_mixer_release(new_crtc_state->state, old_mixer);
> +		if (ret)
> +			return ret;
> +
>   		if (old_r_mixer) {
> -			mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
> +			ret = mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
> +			if (ret)
> +				return ret;
> +
>   			if (!need_right_mixer)
>   				pipeline->r_mixer = NULL;
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> index 954db683ae44..2536def2a000 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
> @@ -116,21 +116,28 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
>   	return 0;
>   }
>   
> -void mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
> +int mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
>   {
>   	struct mdp5_global_state *global_state = mdp5_get_global_state(s);
> -	struct mdp5_hw_mixer_state *new_state = &global_state->hwmixer;
> +	struct mdp5_hw_mixer_state *new_state;
>   
>   	if (!mixer)
> -		return;
> +		return 0;
> +
> +	if (IS_ERR(global_state))
> +		return PTR_ERR(global_state);
> +
> +	new_state = &global_state->hwmixer;
>   
>   	if (WARN_ON(!new_state->hwmixer_to_crtc[mixer->idx]))
> -		return;
> +		return -EINVAL;
>   
>   	DBG("%s: release from crtc %s", mixer->name,
>   	    new_state->hwmixer_to_crtc[mixer->idx]->name);
>   
>   	new_state->hwmixer_to_crtc[mixer->idx] = NULL;
> +
> +	return 0;
>   }
>   
>   void mdp5_mixer_destroy(struct mdp5_hw_mixer *mixer)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> index 43c9ba43ce18..545ee223b9d7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
> @@ -30,7 +30,7 @@ void mdp5_mixer_destroy(struct mdp5_hw_mixer *lm);
>   int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
>   		      uint32_t caps, struct mdp5_hw_mixer **mixer,
>   		      struct mdp5_hw_mixer **r_mixer);
> -void mdp5_mixer_release(struct drm_atomic_state *s,
> -			struct mdp5_hw_mixer *mixer);
> +int mdp5_mixer_release(struct drm_atomic_state *s,
> +		       struct mdp5_hw_mixer *mixer);
>   
>   #endif /* __MDP5_LM_H__ */


-- 
With best wishes
Dmitry
