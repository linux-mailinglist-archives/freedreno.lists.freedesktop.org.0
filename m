Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC855F544
	for <lists+freedreno@lfdr.de>; Wed, 29 Jun 2022 06:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B988B12AB61;
	Wed, 29 Jun 2022 04:29:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D595C12AB61
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jun 2022 04:29:53 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id p8so20034424oip.8
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jun 2022 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LsNHzGbkuQ0ikYT/nQZumtGtHKyGK4TJkVZyZ8Oslx4=;
 b=zTBheeC9uY3ar46fXbbYgTH1O05N1u298bqy4nNOcoohcEmDfXUDmut0iOYG+xdl2c
 Y9rZQPmLNOiQr/O07Zfik/QSer4mX43ruVWSvEhhSOrgSlYJSl7wcukLqv2yD85cBDB9
 t26B5SAkGTch5Yvng2cpsP9oiqlCEsVjq96VvOrou2/gOqjp4jN3kqfW+FTQE/RxAnRE
 Bk4lVmAMA1W8ad58wDSxJFycFkvZOrKBUHQfkr9q76y/tBSAAWeWu8OEuyx0R8JoXa4g
 afptFf3Cut7L+u/bDr+TTptIOJOh1x09L0LYCp2jcjiMeWPdRrYXMWdPOIHo/EZTKttK
 Eqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LsNHzGbkuQ0ikYT/nQZumtGtHKyGK4TJkVZyZ8Oslx4=;
 b=qd9CD3Kcii0Va0MoL3G9AZb9E0hC6uHw/fCGV8o0GYDKnz7SM62N08O+fSvNznKETe
 vEYQ992RCNYmwv5WIpn2tePDWrcMJ2Uipc9VvWVSPx4IrBoVW0mIN5SZWVQR97EbEGvh
 bQ/UkqaiCzHiLmvO1W1jZT1E44gp3lqH8fKB86eg6vqmqwIrQ9i/IT4S5GNCc5FgFcZq
 VPBteK79xpzmQh24foMuSh2DmVuAN6dYY1kKzY4RVWsKCgYbfOXqB08clxMEV6QWYjzI
 80c2wKCq1dC4gf0c99Y/OQRKBRXu26qT+QHsRSpJlM3lhoAYLKXqTmaFRu1li9QDzh20
 FhmQ==
X-Gm-Message-State: AJIora+OdcNNpd3GPScAptdthStfJtAEHZae5TtuzegzmfiaryjkBIP0
 gfuMpc+dtWJHjyw+rMI0IRy4ig==
X-Google-Smtp-Source: AGRyM1urAWT89N7cpLwph3oPJCnPahOlsnfZJ9b7JsB3ugSECMdMylrbT0nE50nn9tcWXfcklF7JSQ==
X-Received: by 2002:a05:6808:68e:b0:335:4901:1b2f with SMTP id
 k14-20020a056808068e00b0033549011b2fmr842227oig.149.1656476992933; 
 Tue, 28 Jun 2022 21:29:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 r15-20020a056830080f00b0060c574ebae6sm8965045ots.76.2022.06.28.21.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 21:29:52 -0700 (PDT)
Date: Tue, 28 Jun 2022 23:29:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Message-ID: <YrvVPiLQL6d4MrFV@builder.lan>
References: <20220510132256.v2.1.Ibf12c1b99feecc4130f1e3130a3fc4ddd710a2e9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510132256.v2.1.Ibf12c1b99feecc4130f1e3130a3fc4ddd710a2e9@changeid>
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/a6xx: Add support for a new
 7c3 sku
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 10 May 02:53 CDT 2022, Akhil P Oommen wrote:

> Add a new sku to the fuse map of 7c3 gpu.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Is this series still needed/wanted? I've been waiting for patch 1 to be
merged in the driver so that I can pick up the dts change.

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 841e47a..61bb21d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1771,6 +1771,8 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
>  		return 0;
>  	else if (fuse == 190)
>  		return 1;
> +	else if (fuse == 96)
> +		return 2;
>  
>  	return UINT_MAX;
>  }
> -- 
> 2.7.4
> 
