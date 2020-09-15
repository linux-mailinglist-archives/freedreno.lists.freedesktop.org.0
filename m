Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501926A940
	for <lists+freedreno@lfdr.de>; Tue, 15 Sep 2020 18:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415189A75;
	Tue, 15 Sep 2020 16:02:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011F46E10A
 for <freedreno@lists.freedesktop.org>; Tue, 15 Sep 2020 16:02:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p65so3575249qtd.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Sep 2020 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qHGhBN6eHyO69pll+88g/3newfhKOBOeL1YWhiUfNUQ=;
 b=nqulYA+U+8v+m/92Wp/qSwp60FLL5ppEhy1d4NMu94BSSy3H2Ito9aUNKNk/I5IuqF
 2AE4pe89kb9T8+IkNkK+64vp4Ge5nYKuazgHAAaffRYj3+8m1pVdgR+m3KzypTAW/i/a
 D+qqPTFpwVw9dtuMkdYgfEIt/mJbD2MVLHjG6KXwJEcwTt3v3mO4mgIqigOWTLfp6EXF
 GCJWtRwdXqf9EG8mvvOXTJjxHrzejopjiwSnY8eGV5haayXSY6V8wwuUdO+7Rg2gMf6/
 xNHcvBSDcXJNH23tzlQX6k57Dp56al2z38KUSiRqE+wjWji75xqAqd2o+uhYjNzFbOtt
 92mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qHGhBN6eHyO69pll+88g/3newfhKOBOeL1YWhiUfNUQ=;
 b=B6FjNNWLqYnCspcgEbzoSuDe5tI3KVIgWf48to+MPxaV9W3eVPLCxGEI+wPK64tb5s
 ak2l1tIysqimu0lwIUZ/iPDVukVaMV2Z/i1mDcvmc+xy6f9Mv3I2CsR/fhqxBJpQ6xD6
 x5oND6ni+MCau+vY2KrBYY9+iTGlrZ932OFA35iJiBs8MWaKyMLTKMeY/zuPVy9S5bfw
 38oHP8UBOoHVG+/Pfd8/YQ2exUHvapg5bQGcg3jCiVZ9BTSRGt2m6q1AjSzBrFbqzcUY
 2rQ2F2NGZYjBLHcCe6Ykfuq0bfSTzHaOzTNQc+5Xo2PjHhOc+2SusanTTOYxFf4TFgmD
 lzEg==
X-Gm-Message-State: AOAM533RDexa2ZIIOCrKNkbeBkzsPTL0qTUWlBwFc9EZXnWoIBkTj4Fc
 /IPInwO74mjtFJMl4kO6Y8hR3w==
X-Google-Smtp-Source: ABdhPJw6xKxWuntGSjSpo2t0XQrHAfXtHFl9zB7oY4bDRoJpWdY84ipY+jn9cSINhlirpBQ32z97ug==
X-Received: by 2002:ac8:7188:: with SMTP id w8mr18494777qto.134.1600185729108; 
 Tue, 15 Sep 2020 09:02:09 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g37sm17775925qtk.76.2020.09.15.09.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 09:02:08 -0700 (PDT)
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20200915155638.1706161-1-jcrouse@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <821c76c7-32dd-4914-817f-7f52843e9b1b@marek.ca>
Date: Tue, 15 Sep 2020 12:01:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200915155638.1706161-1-jcrouse@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix the a650 hw_apriv check
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 9/15/20 11:56 AM, Jordan Crouse wrote:
> Commit 604234f33658 ("drm/msm: Enable expanded apriv support for a650")
> was checking the result of adreno_is_a650() before the gpu revision
> got probed in adreno_gpu_init() so it was always coming across as
> false. Snoop into the revision ID ahead of time to correctly set the
> hw_apriv flag so that it can be used by msm_gpu to properly setup
> global buffers.
> 
> Fixes: 604234f33658 ("drm/msm: Enable expanded apriv support for a650")
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Tested-by: Jonathan Marek <jonathan@marek.ca>

> ---
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 74bc27eb4203..f3b6d93c207c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1048,6 +1048,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct platform_device *pdev = priv->gpu_pdev;
> +	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct adreno_info *info;
>   	struct device_node *node;
>   	struct a6xx_gpu *a6xx_gpu;
>   	struct adreno_gpu *adreno_gpu;
> @@ -1064,7 +1066,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	adreno_gpu->registers = NULL;
>   	adreno_gpu->reg_offsets = a6xx_register_offsets;
>   
> -	if (adreno_is_a650(adreno_gpu))
> +	/*
> +	 * We need to know the platform type before calling into adreno_gpu_init
> +	 * so that the hw_apriv flag can be correctly set. Snoop into the info
> +	 * and grab the revision number
> +	 */
> +	info = adreno_info(config->rev);
> +
> +	if (info && info->revn == 650)
>   		adreno_gpu->base.hw_apriv = true;
>   
>   	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
