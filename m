Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D687AD905C
	for <lists+freedreno@lfdr.de>; Fri, 13 Jun 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512410E9ED;
	Fri, 13 Jun 2025 14:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WtKetZMv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331C10E9ED
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:57:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so25529175e9.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749826661; x=1750431461; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
 b=WtKetZMv7Q2KXPbLDAnlJxJ/suX4RQ68LzCBP+d+z1s//P7I2grQOJz8YyL0OYoHEn
 a+t3UichbLFLtnv7N9rc+1m5vORczOnSIlUwN99pV1r7a8zrOAfvjBlVrgAXv2USNr5Z
 h8CpSq8v4iEg3T/Y/MchMAVod3xyjpuRnxIhnMGGOqR5+Y3mdWxJcogbgw9xcOBRULge
 sAiDC9TslxUgg8HBdjnTQroCGUrxSBpuMAOiKNMxwmnnTUztyrNTYM2x0aixga01XIgm
 nAkZUt9dRIu8aLTyAKKEmXEPpwENci8ebgQMomoYwxdCMRn9XVG1EJROZqUys2ZWZrlU
 arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749826661; x=1750431461;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
 b=XHtn4i/Na3a6XPBdVvA1PUu0+s0C8wdc8dU4GYnAUUeE4GCNl3REXOjhMsTbw8eR3R
 Nz0xWutWcRVEuvkIkkpL/gknKDqbvtkfA/PpwS8MXIPEtiCl+o9q98LsiVCqpReHkDrb
 x8X/ItVU+lXXcYpEk5lnHnZa1q9Me1C5WPHIs+BDpZwAtJa680Q6Lv+8eTIHmqPJl4r4
 kdOoZNwJyj90k6nNNFfe3i7mWfmosH0dAnFjv17kyiAD+sj0QQlE8Q1SljbbJv/1RgZ2
 HIDYFfwRmSRWGbrIcMxMC3kKf6JTAqkQx220OqsbZkR2oxjalkGZhvE1Jt2yHjUpef0t
 Qttg==
X-Gm-Message-State: AOJu0Yy1UDQ+jzCEvvO1hhXwABzJMWK7SyZGc6u631l9qp+S2L1qp6Qm
 wdCuMsm/9X63Otx0Yu2A3t2WebCFNlrgqT4QdzbPKSz8vwAvOca/s3hVxAAe4Eoc2fw=
X-Gm-Gg: ASbGnct12WGVH7rgoCeyADEFYRtqxpJdst8vRCzEJ0gIH0CxixEI9gQCvEBMuissp6R
 KPL7zQ7nLtix18H2zBVHsrywiZhf6MCGKg/A/00pJ3u60Ip+E7VeiTa4xgs3v55x2Ln23cxGNQ+
 Xf/sQkD99rnyy+qBt9/1OOQYEOpU/JjSx0hLnqSJ8aV/DOXKwzv4oCc9pxok1PiudP893bCISYH
 J4bDgMw2gDE6lgAYSuQOVqTFQ9FcdcEVCuYJExL/n2psiXJsP5tQKmZR5mnd7ZssHLxsnW2UrDQ
 YEv9/x7ASooFQkSzEDQhfID24TyiuGCaD+1vpTS6m+2idvoZXs3U4hHZyVxudrNESrRH/e3N3zy
 bCwA=
X-Google-Smtp-Source: AGHT+IHGukDkZVswTcj0Lp6moWGFAwYliY4cT6cRYlRm6eZSgyLpxqv52EshO7PcMNoDb7jfDD7ZSg==
X-Received: by 2002:a05:600c:a301:b0:442:f12f:bd9f with SMTP id
 5b1f17b1804b1-45334b2aaadmr25496635e9.27.1749826661479; 
 Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453305a0d9dsm48887925e9.21.2025.06.13.07.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:57:40 +0100
Message-Id: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
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

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-

Apart from tag problem it is usually a good idea to add relevant people in
c/c. Especially when you fix the reported bug.

Best regards,
Alexey
