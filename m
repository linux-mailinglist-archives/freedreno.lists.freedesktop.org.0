Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E654767C0
	for <lists+freedreno@lfdr.de>; Thu, 16 Dec 2021 03:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49010E691;
	Thu, 16 Dec 2021 02:12:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D010E406
 for <freedreno@lists.freedesktop.org>; Thu, 16 Dec 2021 02:12:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u22so36091892lju.7
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oN/BkkxAzh0TiMVlSBz5FLbx67Y+EoaSkeGmdT8a2+8=;
 b=hqMjUvbseGgiGYDl5Qbaq4vQtnZIGaJQXqPHIq4tnU6P7v+h++jnmsE4PxuiA+AH8N
 /VM9sAODroW2HZ09MIr5DM4idU9+EI/mt6VAl7mSUjvsoVI229LH2eqNkLZjCthCYotX
 PXLS4Vro8Kmeox/ihgl55IUOWY6C263GJ0xqxHrp/5liDKyPqD5TI5AZmpxN0n4MBnJ8
 75ioiYeFBomV0uBquc5/Y0QjNaBfNvzxDVt28p31WJNdlueFp739E2MpwaEs09V1Vi1f
 3h9JzIHtOX48MibsEofJIAqAECm+1R6XVSGZZz0+O+ibY7pR5kwPrkM5Og3Ax+otckMJ
 9c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oN/BkkxAzh0TiMVlSBz5FLbx67Y+EoaSkeGmdT8a2+8=;
 b=2xnwjOTD6HuJytWT9UomuG6EVWB31dj4qZyrhxI6YWuE1aoWQdQsuuSUizH9hiUCvd
 9Ez8eZgux76U2pqDgQe7S/Rhyrup/R50YVXq4zcZc0CYJ6rRiHJ+o58XZnsKdwCe0/Jh
 c6uaeVH1PQ7M9L4G/pCQYSydUQ8Gd/UVzDRVaBGg0W+sudCsHN+UmokTu2rjLR+65mKa
 7uSLI/DO+UiTR3koF4cspwWqWcVy5UAiOv2BYOI4Yrb5sRTvII/IOcJ3qbHN/Z1sqUwW
 E7M6xeOBe02fZ3KgcJbcktkxSVS+16PICLpmcb9/DEy+SZtS4el0Hd4nFY8fYR9xVuqU
 tnpg==
X-Gm-Message-State: AOAM531wsI332IcB0FcltriKrzzPGM1beGUV0eWkPrzfDAeCi0rWpaTb
 7QnxKxHRCeHMIKO2fDWkY/Ohcw==
X-Google-Smtp-Source: ABdhPJwFkqpGRH3//LQhIXXRkFcjQiigOlWwY/xfN/YQ/h/cjLG5rE/ffQ/Bqh+WemHQh9E+4OLXCw==
X-Received: by 2002:a2e:b163:: with SMTP id a3mr13430601ljm.264.1639620760128; 
 Wed, 15 Dec 2021 18:12:40 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id m3sm798052lji.112.2021.12.15.18.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 18:12:39 -0800 (PST)
Message-ID: <ccd98cd9-f8c1-d4df-3849-3844e8b82e89@linaro.org>
Date: Thu, 16 Dec 2021 05:12:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215174524.1742389-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/disp: Export helper for
 capturing snapshot
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Doug Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Alexey Dobriyan <adobriyan@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/12/2021 20:45, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We'll re-use this for debugfs.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 28 +++++++++++++++-----
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 10 +++++++
>   2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> index a4a7cb06bc87..580ea01b13ab 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -28,29 +28,43 @@ static ssize_t __maybe_unused disp_devcoredump_read(char *buffer, loff_t offset,
>   	return count - iter.remain;
>   }
>   
> -static void _msm_disp_snapshot_work(struct kthread_work *work)
> +struct msm_disp_state *
> +msm_disp_snapshot_state_sync(struct msm_kms *kms)
>   {
> -	struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
>   	struct drm_device *drm_dev = kms->dev;
>   	struct msm_disp_state *disp_state;
> -	struct drm_printer p;
> +
> +	WARN_ON(!mutex_is_locked(&kms->dump_mutex));
>   
>   	disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
>   	if (!disp_state)
> -		return;
> +		return ERR_PTR(-ENOMEM);
>   
>   	disp_state->dev = drm_dev->dev;
>   	disp_state->drm_dev = drm_dev;
>   
>   	INIT_LIST_HEAD(&disp_state->blocks);
>   
> -	/* Serialize dumping here */
> -	mutex_lock(&kms->dump_mutex);
> -
>   	msm_disp_snapshot_capture_state(disp_state);
>   
> +	return disp_state;
> +}
> +
> +static void _msm_disp_snapshot_work(struct kthread_work *work)
> +{
> +	struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
> +	struct drm_device *drm_dev = kms->dev;

drivers/gpu/drm/msm/disp/msm_disp_snapshot.c:56:28: warning: unused 
variable ‘drm_dev’ [-Wunused-variable]
    56 |         struct drm_device *drm_dev = kms->dev;

I will apply the fixup locally.

> +	struct msm_disp_state *disp_state;
> +	struct drm_printer p;
> +
> +	/* Serialize dumping here */
> +	mutex_lock(&kms->dump_mutex);
> +	disp_state = msm_disp_snapshot_state_sync(kms);
>   	mutex_unlock(&kms->dump_mutex);
>   
> +	if (IS_ERR(disp_state))
> +		return;
> +
>   	if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
>   		p = drm_info_printer(disp_state->drm_dev->dev);
>   		msm_disp_state_print(disp_state, &p);
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> index 31ad68be3391..b5f452bd7ada 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> @@ -84,6 +84,16 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev);
>    */
>   void msm_disp_snapshot_destroy(struct drm_device *drm_dev);
>   
> +/**
> + * msm_disp_snapshot_state_sync - synchronously snapshot display state
> + * @kms:  the kms object
> + *
> + * Returns state or error
> + *
> + * Must be called with &kms->dump_mutex held
> + */
> +struct msm_disp_state *msm_disp_snapshot_state_sync(struct msm_kms *kms);
> +
>   /**
>    * msm_disp_snapshot_state - trigger to dump the display snapshot
>    * @drm_dev:	handle to drm device
> 


-- 
With best wishes
Dmitry
