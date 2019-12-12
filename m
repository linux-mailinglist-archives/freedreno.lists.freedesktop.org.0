Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A111C643
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2019 08:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D5A6EC63;
	Thu, 12 Dec 2019 07:18:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C806EC68
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2019 07:18:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c23so201944plz.4
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2019 23:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
 b=RxxXcjFLgonLF4fmVQ9Uh8NGPA48JCLXcBG419PPiBNe6e/fN4bT3KGOPvAsCdib1s
 CV7whYpnFFggopMXHXah8xrpY8aY0pwmZyDzR08smFDcAuwxKR2Sa4xjVGgiJxBQSm6Z
 5i9ViaE59/8nrQrcp9mRVH41oPVaQcU8Qr9ZPo2HUPw7SVcP/osuBNIHgu/RtPlKNbX/
 6yxBEheHDeIB/oaTQP6sATllHhzDBVffb30K27VGcaJsenKqYw9gcYYxM41KUnIxeoaZ
 V2bCnEheP3IyYIt7YqG/Z8nuhlfHRZ1oqmKawJHvW0upRhf0JvSBVVrFJPefVm2vbB3O
 4qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
 b=V409CAOn1CEG5wSA1J729GkZb/BF4999yXuMNM6f1uA7z6U0xW4qAe9ueGvBC6PIcn
 VoqNdbDVTlHCPt3aYVKVIaVEFZVwWdrIH98Sl5RZHCbbqM0faplCKwbTZsgO2B67Buaz
 p6zyFTnjgIFOFC7Ud9g+yphhIokJabFou3OQBzSdkW2YZTrdR5SlYO8yEhlE/qrgMCGH
 qtIymK2MgxjCLLVXwsXRQrX1Gfo7nSoKTsyi2xNtuISz02O35wBxt/tiudm3UytXvVtX
 9Q9Un6Xu8tJlmVJN7NrH/N3wwB01nTcmyWLbIez/Ar5NRTqFOJWExzrpTA+mbqy4C2Sw
 XzCw==
X-Gm-Message-State: APjAAAW76UuifvhbVTs405eH8oJyXt84RxG74lsW6UV4ywNF1DNAIhKo
 QIrOCwkNKPQ/SB3hZ44WfUTmNg==
X-Google-Smtp-Source: APXvYqy+m0lCq/UpeupyAuDYMkcEh9rkfCM4GG+6qHKYU/CjEuXA+ig6axKgP0DJrVQrHbcsf678BA==
X-Received: by 2002:a17:90a:2808:: with SMTP id
 e8mr8279272pjd.63.1576135094383; 
 Wed, 11 Dec 2019 23:18:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id i127sm5601071pfc.55.2019.12.11.23.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 23:18:13 -0800 (PST)
Date: Wed, 11 Dec 2019 23:18:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20191212071811.GN3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-5-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/a4xx: set interconnect
 bandwidth vote
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jcrouse@codeaurora.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, daniel@ffwll.ch, sean@poorly.run,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Set the two interconnect paths for the GPU to maximum speed for now to
> work towards getting the GPU working upstream. We can revisit a later
> time to optimize this for battery life.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a9e89e..253d8d85daad 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -591,6 +591,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.
> +	 */
> +	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +
>  	return gpu;
>  
>  fail:
> -- 
> 2.21.0
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
