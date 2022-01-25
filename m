Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27B49A3F9
	for <lists+freedreno@lfdr.de>; Tue, 25 Jan 2022 03:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271110E911;
	Tue, 25 Jan 2022 02:07:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61010E90D
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jan 2022 02:07:01 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q22so5860974ljh.7
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 18:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=03gjQlgR5Dxhb9WkNowyotEgdW202c8d1VlLtX85qok=;
 b=Du4AGA7nF/W00f2LVQw8lhgAnoO0ZwqlUuMelw6cNUYR5/Ma2Fv7dOVrFjkwmLv6Qm
 tmohqjX9pW0GxAkpVFO2yqIFbr7Nn51fCIXPrGKKKwnKLMIjo9hcUhIyqcbEodsHKY1p
 G7o2jGSo/tgkX3bveHJcQeRdM56Va17Jrnhpm+Io2lffnZBEezWiiA4ijZvN04Buv5PT
 3iTCUueNEw6iiJTuwv394C7St1sNAYYPasKNopsuMIqG5BoKjgx97YiOcl5IvhSYtLL3
 7vEIy5hPLu9VYpqIsIawF/tuXJW8MoS4YH3DhddGH3aPL/QEatiy8exUSejEhJmFEbQh
 x0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=03gjQlgR5Dxhb9WkNowyotEgdW202c8d1VlLtX85qok=;
 b=8HlbE8PLZQ6oAFC8ai2wdytvoHAAo6KcgCSt2kSNjXPOq9D1cSykd6+cHAZXnIilco
 gUz3Y6r+ihgIsvs/E3yuBUi7MR4ml1B1fN+hOkame4AedIRZlGr3pA1KuZ3fyiftMYSN
 ueEy/rKiZ/DX4I6aXE11NcWRQf3t4KIgjcY8S1sdBjVBFHwkM4YqsyBSAD9Zwb88Vi3C
 wPxl7FpU/LewsfwQYZkCuyOFBaOcokD9MfhX4tmpoolGbtatCEO3Z67PNIYRZM1jJrTu
 bU8VoLE96UVubbhomKcsjpqvm1w07zfufPQa2pqyKlbTvt8s4TzthcNiIXd6hN6Ihc9p
 viMQ==
X-Gm-Message-State: AOAM533QLRemHSQPDn4mSOIfCWCFATdv3WXAwQxd7peeFWvL7Ct6UU+j
 fbskwqBzLLLzedOHTIO8fDM0/j2wjx4vvg==
X-Google-Smtp-Source: ABdhPJwpuM9KRu0Rv7HDlKS2t+F8icSc/PHdc4SswuzcxRomivyaxQfI2OVr7fcX9oboDIopEgrk0g==
X-Received: by 2002:a2e:9148:: with SMTP id q8mr7558833ljg.258.1643076419522; 
 Mon, 24 Jan 2022 18:06:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i18sm1339400lfv.257.2022.01.24.18.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 18:06:58 -0800 (PST)
Message-ID: <c4c56b0f-84ca-0a56-6618-73e24f4bfd46@linaro.org>
Date: Tue, 25 Jan 2022 05:06:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Xianting Tian <xianting.tian@linux.alibaba.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <20220112123334.749776-1-xianting.tian@linux.alibaba.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220112123334.749776-1-xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix wrong size calculation
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/01/2022 15:33, Xianting Tian wrote:
> For example, memory-region in .dts as below,
> 	reg = <0x0 0x50000000 0x0 0x20000000>
> 
> We can get below values,
> struct resource r;
> r.start = 0x50000000;
> r.end	= 0x6fffffff;
> 
> So the size should be:
> size = r.end - r.start + 1 = 0x20000000
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

Fixes: 072f1f9168ed ("drm/msm: add support for "stolen" mem")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 892c04365..f04a2337d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -466,7 +466,7 @@ static int msm_init_vram(struct drm_device *dev)
>   		of_node_put(node);
>   		if (ret)
>   			return ret;
> -		size = r.end - r.start;
> +		size = r.end - r.start + 1;
>   		DRM_INFO("using VRAM carveout: %lx@%pa\n", size, &r.start);
>   
>   		/* if we have no IOMMU, then we need to use carveout allocator.


-- 
With best wishes
Dmitry
