Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68566507253
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 17:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB7410EF05;
	Tue, 19 Apr 2022 15:57:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8950C10EF05
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 15:57:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id w19so30157077lfu.11
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aBBlrcuINY/huqI+pmNpt7ezjRhcp+EsZeDz0RlBbYA=;
 b=oYSRwbUAXncHSazO9/um5GURByFyEv/d1wSyWc52WIGTl0Dn2fBv7EVe8HLgBQaop2
 q6XNg7gZCRjdwhctLljfU9EYI4JWF+aT2nXZ7JUtsuoqr1ldsayYtbNq56JtkDP+uHhs
 EVISorbf2Qb+HvhQlrkODKLDY9lirkhtgzJ/Xp9UwuUAGHYsX3P8i3LoMKg1jBinFkGc
 8HpiDB+f+HYE+kRpEVCBQ5xYc8vGQWEVWZ3OwLaKUsKNSxOqcOQU93sfMiGB5Tj652i/
 OfdAjRhzNoYxolGuewaXMjdRf8rgOo8zH/3YFgHzOnlP6v0Sq3248bwvXIKypJcU/bSv
 YUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aBBlrcuINY/huqI+pmNpt7ezjRhcp+EsZeDz0RlBbYA=;
 b=a7gzM0+H25PEb4AkNStHLgduZkEiKjTG8IoTVp0Wh4IByh3PXUR62bjcWD58BOnEzv
 /8tzB1Oz6tn23aVlmznFmYJYUVVl85YF5rn7xKI5qm0mxewkhZxzX27K9i9BM4rZ4uHE
 HZPmMryCh/erAgPr1RVBzBsUys5kH7HIzZU0EOVs3UzkdbLPm5IRS4E+LB6KPVQvj3gN
 4S+k27O9ZZ4Cb8bkRd8sX/obC96R2cf8x144w4+dtuOMwjr6uqkP84efWW3nTiaWChzO
 c1fZQvieCVaMmrsWCTU1MtLZ4Sk4tFJLeyA4rqDR5+eYgRpDNraNWxonvcSQCo5TTrKe
 Ivbw==
X-Gm-Message-State: AOAM531WMXpnblC8D2Eh5oDt1Do6Aho4KFxCpfnYFVIdufPHJpkRnCc/
 gP3Cif4FDpETrFbiX3/tyYKAqw==
X-Google-Smtp-Source: ABdhPJxIyRpDkdE3DsvHCugAEECr9Cihw3eu2sWWZa6oOoYWQV5BWYcP0qZa3q08lMbeYZwFMdbP3Q==
X-Received: by 2002:ac2:4306:0:b0:46b:c41c:1478 with SMTP id
 l6-20020ac24306000000b0046bc41c1478mr11760488lfh.559.1650383830827; 
 Tue, 19 Apr 2022 08:57:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a056512229400b0044a6ac1af69sm1546934lfu.181.2022.04.19.08.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 08:57:10 -0700 (PDT)
Message-ID: <aadad18c-5a55-ae30-6158-f6c584c59fae@linaro.org>
Date: Tue, 19 Apr 2022 18:57:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Haowen Bai <baihaowen@meizu.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1650348980-19050-1-git-send-email-baihaowen@meizu.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650348980-19050-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Eliminate useless code
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/04/2022 09:16, Haowen Bai wrote:
> Since mdp5_state is initialized twice at the same time, so
> we make code simple and easy to understand by delete one.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 428f88b786f9..406c34e9f3f8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -386,8 +386,6 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
>   	if (!crtc_state->active)
>   		return -EINVAL;
>   
> -	mdp5_state = to_mdp5_plane_state(new_plane_state);
> -
>   	/* don't use fast path if we don't have a hwpipe allocated yet */
>   	if (!mdp5_state->hwpipe)
>   		return -EINVAL;


-- 
With best wishes
Dmitry
