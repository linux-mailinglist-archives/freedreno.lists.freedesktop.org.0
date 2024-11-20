Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6829D394D
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF7D10E70D;
	Wed, 20 Nov 2024 11:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tmtS4/T9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466F10E701
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:19:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo2157969e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732101562; x=1732706362; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0rdRMEcIeKMxsgTSwvPC2Ggi3/Ka8/LNcXy0+kUwfLg=;
 b=tmtS4/T9yx1HZS1b7X6QtpAfoPi2BxnJQwg27OmY0EiXommwPs+no4Z7Osdvb9exQ1
 4LMz+JL4azFIRBoDZmeg9uLL6FunpEfdDAQp22KfpC9J99lgVRrtmvCfE94mg9cRqiMW
 a9Cd4XHHGRbhdQ0RBSkRg4dWErTyoGYFZ1C112JjfEo6fEwQA7YWZ4nCF8Jkmx3K1uAQ
 Zf+JK7PEVdTpnvC5a7hU6uoN1+OziCO0pAGadvEH1fUaOD1bc4aOnorrRYiahLOsTo7B
 YkN4SQAuWJqRCAFmkgPx9Bvaj5yjk5uwiUaeR//+jV7o87VXcCMxeCW0HrywPChpHtD+
 P05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732101562; x=1732706362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rdRMEcIeKMxsgTSwvPC2Ggi3/Ka8/LNcXy0+kUwfLg=;
 b=D4IXcfmudCJlNfVuuBlRoPth6rqp0ytwb682R/G73AL+BjeFSM2PznVvDGce8ZjRNE
 xEf4pG8AOsm/rwW46pUUyE0Zm7h8sjNqx7S28dWDAuGpg0nIXtdoU+Rq15ORrz4m1Ebz
 5O1aqgTk/k6BWih2KsUrYcBQQ7pxN5FcDw7W1doUcrnbNxvJewYW7g7cQStUaZPiSKB4
 VjToprNlQmnPl2wduB1n6uPBZxMGbJabCobBzsLxWDRi2V+k4KiKIEZ2PLYplrylccCe
 B5+S6DFGqVys0OaOkuRwdHScfshKzNpgR+OaEpgr0P1zvKf6XSYrzYbofQ8x25xpl+QV
 FosQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5miK8BayXwm/QZP/FMuqyOaYmVgyvDHBVofOwB1gMBi8soAItiuKPOgLekBWXqkv11mzeEDpgd5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIw+wqvDJeQ7k9+Rmjg8xnOrAYo6WPnzOR1uY9Me2v4UkRZxfj
 WGPmz1AYsjh/rkF7eZ6jQRjVIVPQrj4fXT1dU3P3l5yVcWqVOtusEjEgoG8iJgM=
X-Google-Smtp-Source: AGHT+IFz4/wMpaCWcpDGZw/e6uCaZaeyezhXZTQfdXVBkzxU2f5cPxItg85GBW91OdibreTQE0mP0A==
X-Received: by 2002:ac2:48ba:0:b0:53d:ab10:234a with SMTP id
 2adb3069b0e04-53dc1333888mr741916e87.21.1732101561756; 
 Wed, 20 Nov 2024 03:19:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd4670e6sm595236e87.159.2024.11.20.03.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:19:21 -0800 (PST)
Date: Wed, 20 Nov 2024 13:19:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
Message-ID: <iw75ptavkqw3vybfov2f7koz5nh5lfzxcou3wey7rdsqt2gj5n@7luy2kqrzkj5>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, but by default we leave the
> OPP core vote for the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> While the feature will require some data in a6xx_info, it's safer
> to only enable tested platforms with this flag first.
> 
> Add a new feature enabling DDR Bandwidth vote via GMU.

Squash into the implementation patch.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -58,6 +58,7 @@ enum adreno_family {
>  #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
>  #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
>  #define ADRENO_FEAT_PREEMPTION			BIT(2)
> +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
