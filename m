Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F10A13439
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8710E1C8;
	Thu, 16 Jan 2025 07:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOkPke0u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D7410E1C8
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:46:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so726072e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737013531; x=1737618331; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
 b=SOkPke0uCE8VxSr5DZvujjJcMWadg4nQkeeOIXYKZi5yfu+VPQUnbiKqFCuLHflTcg
 knntxDkHDOs77FE+7XVVLssI+eKFsKQdOPBOnG7unITx6VJAMKVC0g0KXOmbjU0D5p2L
 pozO9n98MEfyuoR4HRAEXyfhsg8Uv1jU610TM5UKEoEJYIUeZKCawwgwyu2A5qDRy/I1
 oct1vDd7opDHK5HpORgvQzij/jK5Em9ixUohf83jxcI8pdEtGC3yNecusjomcIFyv7Al
 WuGMkLjAxKUxORjEnW9IqJ0gja9iNmtP/VJikdY52oe1I3ZTlehZAgVtjclCMXh2MfHV
 Jgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737013531; x=1737618331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SF4kJSME40b8HtlbDBsx+ifq4mTDH36yRswbkqZsxSo=;
 b=W9bA7E208163MIPaOhxeqRM2RCuPauT7sKpz22MubPLBysUlFawWlRIyXvZzxPzT+e
 vweW7CjzH/EprR/YYO6Ws1qxbaKJpHpBP6PF85D6qHmZ7G06k7PqVpEBsJzm7udSVxR4
 5lO6evaiym8ge2DShHZh+QT9WXvO3USDGktWQYV+rpgFtTKEV/mpoiXzs1RIjnnp0vQw
 eA+M0x/676rSNpCiDbTzbWY9nlbfhhHoXLI+Vc5Imd3Lm2/tXgDGW736Tq7x65cFWC5B
 gCHShn7CHkd56aDAowSjOM/0KMRWSdoaG8KrtDpZ2hp3tRjRvMtzg6G48+cj9a5Cdyqi
 NCDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs+2Y2nSj5EqXlbczEbDqmj2TIU6bkvANj90QnZFRvbzAKuEfwToWcFYBJCNSRBxoZls4KYrcXiow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVIUJ5DPT5WjoMj5uB54a8roxk4Nfvc71lhoSb2Rh+8iljWMeW
 lVifGfLBpghR60ZUCljK1vew5id0wsyB43NxF0rYAua/SfYYQZTe89nO1/ZKS9k=
X-Gm-Gg: ASbGncu5UBnOAsa/R/NWAqgQ5xz6lzb4dWisuhH/u9BE/pxGKE/KO/k2DMQbg08cBG2
 yL5InOCCiqiHiVZPudatZyPA5ml9YA8WlnpnfQ1CSuSiDb+QcerB2soBhFxZbxhNB2AoskhX53i
 DBBBxXKYjP/PAVIpFbmedcI+pX4A943VGpg4QzR2k8VtI/dw4z7zLnbiUpsrjxmBuF6KEotybTB
 8DW2rrbt2TrEyNtH1P8rO2Oex8XoIuFUD6n3gotLVzpbi7kQny2+hzVavF/e7emBSqbtXiTbAdV
 YSt4VAKgLgVI6F4/opIwW27jdziO2n0Si3xW
X-Google-Smtp-Source: AGHT+IF16iTWm/Ux1y1yeoWpVsxtYCCgAEvfeQgL8CcjHyHteM6fc3KbQL2N2YDTvHojx/4UlsRhOg==
X-Received: by 2002:a05:6512:10cd:b0:542:1bdd:748d with SMTP id
 2adb3069b0e04-542845bcce9mr10097421e87.13.1737013530854; 
 Wed, 15 Jan 2025 23:45:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428beaaa1bsm2219099e87.170.2025.01.15.23.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:45:29 -0800 (PST)
Date: Thu, 16 Jan 2025 09:45:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dpu: Do not fix number of DSC
Message-ID: <3ea3cus4mgruw52r3mqbhpzj5afgr5762izdm7jqdyhsikhpjx@klo7sce74jxr>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:51PM +0800, Jun Nie wrote:
> Currently, if DSC is enabled, only 2 DSC engines are supported so far.
> More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
> get the real number of DSCs to decide whether DSC merging is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
