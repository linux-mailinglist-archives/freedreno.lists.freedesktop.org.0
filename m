Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC2524128
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 01:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7510E6CA;
	Wed, 11 May 2022 23:41:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9C10E606
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 23:41:34 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id m23so4539770ljc.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QQUBL6AAiPvENtz+HDrqxW12KA7JEtcW+/yW68TiJxc=;
 b=VUDr8ggrhQaMK4PwRgjhViEY2vsWFEy4mwnw3k7Zbbb6TmWvmC96/XXibpm2v2XTaA
 4m1O4VDM1S5i9gkgrJLcq+bYWYXHx2QcQ6iDV/HCTj6vkVNCkneY67CVa29ykvtXnG+q
 1uCAGGGdvny5rfhSb8cFeEG3m/7PKDr7uhQ5CPDWiKK5YeHYw4QsSb+tmb2PUgwj98j9
 z0xqliWNzIuTHyq3zbrvLxMWx+g0rsznaFpYHT3IBN44i02P+ouR07BJWLqcIpDNnndz
 ngt6IdHV9AdbXNnURT/4guESiUDbg6nNjpcZC2BUrgjNxGAoiWNrEuwpqGMp56tlrqxa
 Klpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QQUBL6AAiPvENtz+HDrqxW12KA7JEtcW+/yW68TiJxc=;
 b=HXCx4Q8Dre9T2AzV9eQYdyPW5yeuVSaHhhP6I15Ow61FOcrFWtkh2ugZmbvzhh0tPh
 kYkGN5/SkpOv1cKbkqtJBEl2UPvwan0TxlXsIiQQbSCb8+5opUv9YvJA1hQsuqwZJMVD
 XyICs5bl2oxbonRYOEhxyv2UxrmzQr7dNm+zO6zr2/QWBMU1ACewFyXt/tTP9j5kEH8/
 xkXdMX9Eu3w59rXR7VlDUcSXgK5sfKic7Q5tH+3jNm/54LEq4e6DRu5oiU9DlY97zoRM
 Llp82It116hT9rQB2NvPy0ybBOzOuFR1mX+gTwPQ8Eq/jwDPB0f/O6DJ6RuRFPIR7y1E
 yjsw==
X-Gm-Message-State: AOAM530We+oavwmP+r+s3g44YHoy9S0s8//QRKfs9ZbPPJ/ctUx5nCbu
 V8Wi3IqVshNTQrk46miYDcVT9Q==
X-Google-Smtp-Source: ABdhPJyGionT4XPGSQE0dPGjN+7Ju/kSS5aDXtcvu8TNsltNR5JksN4mRMDZ4hR8ig9/gSkob5CX9Q==
X-Received: by 2002:a2e:80da:0:b0:24f:4db3:f02d with SMTP id
 r26-20020a2e80da000000b0024f4db3f02dmr18683114ljg.0.1652312492929; 
 Wed, 11 May 2022 16:41:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bn17-20020a05651c179100b00250d680db18sm583654ljb.85.2022.05.11.16.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 16:41:32 -0700 (PDT)
Message-ID: <6dfee07b-1c88-a3e4-9e82-b17f4e20a022@linaro.org>
Date: Thu, 12 May 2022 02:41:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DRM_MODE_ROTATE_180 back
 to supported rotations
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/05/2022 01:27, Abhinav Kumar wrote:
> DRM_MODE_ROTATE_180 was previously marked as supported even
> for devices not supporting inline rotation.
> 
> This is true because the SSPPs can always flip the image.
> 
> After inline rotation support changes, this bit was removed
> and kms_rotation_crc IGT test starts skipping now whereas
> it was previously passing.
> 
> Restore DRM_MODE_ROTATE_180 bit to the supported rotations
> list.
> 
> Fixes: dabfdd89eaa92 ("add inline rotation support for sc7280")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9d2f0364d2c7..5b5aef249390 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1577,7 +1577,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   			BIT(DRM_MODE_BLEND_PREMULTI) |
>   			BIT(DRM_MODE_BLEND_COVERAGE));
>   
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;

Nit: can we rename this to handled_rotations to remove confusion with 
supported_rotations from dpu_plane_atomic_check()?

Nevertheless:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   
>   	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>   		supported_rotations |= DRM_MODE_ROTATE_MASK;


-- 
With best wishes
Dmitry
