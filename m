Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FA859471
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 05:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3637310E06B;
	Sun, 18 Feb 2024 04:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gb7J+O/U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DCF10E06B
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 04:04:35 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d23473a563so2832131fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 17 Feb 2024 20:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229073; x=1708833873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1do4DMw/mN513WZiNnLlku81OJeKDVZzYGJeAsIMYbI=;
 b=Gb7J+O/U2ANTVavFFGjstf1bSdOpZtYmqSJx8soepataqIzBVB1bgqWStGCo/TU9gu
 T34oPfp5QLlGagUUnEylDpiddFoCUtjFfu4UdDqRvMlTB5eGwRZoDfegSrI+e0dBDV1N
 hHE2Ldxgf3AN3LUIpHWWZ3V3DGSmqQGr4uccOLG+bRJ2jc56jLBMfQxi9kq/kFqj8m68
 J9haDJ52OMLo4+JKIMHwbBf7H6lcGC5hHdOwYD9J5Dz1i0yFpRABlDA/IGxHEXAVLRX/
 IXWAhNU4H81hq/94TJiOKjshjyR3DcIRsjKeEf4knh4j3OtGlX3sBLle/amySF1Ycjce
 xpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229073; x=1708833873;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1do4DMw/mN513WZiNnLlku81OJeKDVZzYGJeAsIMYbI=;
 b=p9yHitdaACYppU1kDiiGVf7VLoVEYAg79iHsKACgKoILZkG822YzHLdoK7PjlY14Tl
 kjX0pfxSyBwcmV5WMbfV2ZgSXlcBtKKAHO2iLeiyVOTeP6WnX7mvwrPJ8UMD3+1Soi4u
 R8EQz8Pih4C0u2siZjRK1/ANTMebEeWXZ5SA2uKYyj3V2ejS+0njfuXZdjNY901dzDLB
 J8KTHpG8/d1E7Kuh0zN2O+zG89HhlsenyG1JtJAdTvg2IDkTWxuGaOyf9QLgaCrM2H8z
 KF5DbA5Epc4YuvNySlIXFxrWjAL3Wjvjwf4ljDGQvRsyQ5u+UrcsyqrR8VZhoXrDy7Di
 SJyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXBF1kAbZGi9mETAeAEGyavAZBXaEV7bu4Vih7apL1ucDkQyRuavJEi32JZIh+/O0nCr4fn4TqyslZfWsMd+kCIg9XmRjSiJvapwOn7dch
X-Gm-Message-State: AOJu0YxOn5PFpdGOnYaE8WcQ0E0MV/DFRu/PB8/nbLzdlL6tt0y57QZM
 Kfmdt/KId0xBkwDicm1Lv8eMzEgmIqsHny6OjplzfZUGrhreXblJjNPIjrQl3XY=
X-Google-Smtp-Source: AGHT+IHViPNoZZFS9Sfl5oY9dSDsQPlpdmE5pucJhvFd3AOk2Ml2lhRq7WOI9Bsr8e5TNDv9bq8EAg==
X-Received: by 2002:a2e:88d6:0:b0:2d2:3808:e0d8 with SMTP id
 a22-20020a2e88d6000000b002d23808e0d8mr62156ljk.31.1708229073460; 
 Sat, 17 Feb 2024 20:04:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a2eb009000000b002d08f3640b5sm553905ljk.11.2024.02.17.20.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 20:04:33 -0800 (PST)
Message-ID: <cf95947d-8bec-4f95-9e08-2d942723cafc@linaro.org>
Date: Sun, 18 Feb 2024 06:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Leonard Lausen <leonard@lausen.nl>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
Content-Language: en-GB
In-Reply-To: <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Leonard,

On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>
> Hi Connor,
>
> unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.

Please check whether this quick fix works for you

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..f097577a99ad 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct 
adreno_gpu *gpu)
  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
  {
  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	/* a618 is using the hw default values */
+	if (adreno_is_a618(adreno_gpu))
+		return;
+
  	/*
  	 * We subtract 13 from the highest bank bit (13 is the minimum value
  	 * allowed by hw) and write the lowest two bits of the remaining value


-- 
With best wishes
Dmitry
