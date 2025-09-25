Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74182B9DBA0
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 08:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCB410E849;
	Thu, 25 Sep 2025 06:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h54Asy1e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7903410E84A
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 06:51:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so98206166b.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 23:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758783091; x=1759387891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
 b=h54Asy1e2icw1ousLavfVWDNBA9lrvfHGtWm3mHC6fSHmpMZMuCq2dbGZ/n0gTVEow
 LvwfnMKGZblAErTwqCrdGMhkadt7A0SgbJK6xk0ncSp3E7Z5q+TEY6/IvktSMjCIuP7K
 pNM+D3oITfyZzoG/yQJ7epfCyKIjeBjNjyMLPElWKbgzL1d3G0fc4QchXoHUo2VtAW2Y
 /GdES6ur/x1PbW39a4rbMGCDnhKmKexlJa6LQAjy22c3vummgWKPWZctE4h2wRizHnBE
 LKjvFjRbrlAObOvKORuFpoEVCNhkSBZnD+WhVhMv1CUIOojDfhoqH5U/+4ldLLqSlESS
 e7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783091; x=1759387891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
 b=E2Xn+ZYo/KA8xrLgliNWWnsJNVcwFvTHyOiFDwvd6A+HG2nZAzWAhQUGgLIGuIdbSV
 5zTEaVfCkix7Kt9oMOBsnOenO5ggcRn4EvHbgVE8C0T7EvlKDFwX7Jkz1xG8HwkFNAIE
 GkcYC1PPA41xk/fLjpmfnJT8yn9ONSi+ztcIhSS/S04vG5qWxp/utIeGAf6qd2lN0/S1
 K1hEJDQ1z5F012gzhLvOqZvaewSaaQPsGcUoZpd9Lxz8o+0EatDKqV7nXL53J1a3IP73
 HjpzNCq9xSls+CX/8e6HiKO1zPWeo3iBNplAwcWcdfO+Z07uVqI7bCdPToFGCplzqy5s
 kUBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoo7uP7BFr8CNNio3g35zpL2u3S6n8tufxzF825indRpxqFTr/n+Zw3GkzpfA2W3G9ZWkFsQ3qF8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw01U5LUrIE7mHaGEr2fbPQsHG4UX2aK7npQ+YoI2fqz+Zt3nvy
 8HVCwaz4UqPsuBALkRWPVA1aNDaWozWqPqcxdLDvDKtdyRkTr/TGJsqv60myL/6pTtI=
X-Gm-Gg: ASbGncuNYSLRyh1B2HxioCWaMot8nISirYDXrVsIdr1TxudCE3fj4vSRVNEiiAodrat
 8PyX+okvfmXAgCHWKEA8x82CP74piG4xtGmS3TEGzdxnfhBkHTbMKYbINf5aAGW1pQ1VNRpmKNy
 +KLBOd8I3O7R+Vd9snT9/GZrYgEsX3qs/p9kgEInwT2k0uFgxh8bBSMkvZS7XRBUZhBbvJANWnq
 JO/YqHALSUhas/a/AXK7giipCoUUEYIdSIb411IIXGzMgujZEzazmfy5dUykRwygSySclh3CEgt
 x68E+iammAiTFY8Tf/nGdJfwhOa1+OwWfBvrYVShkLFYMYDyI3iFIe7BRKt79P19da/IaboU2Eg
 ux5IgRI50DBnzxiOtnn+p8A==
X-Google-Smtp-Source: AGHT+IGGfQ8eA5qoYaBx6N30tlw71g0bFTIZMRs/lzQfK9Y0ST7ZgWV3GMVKow4yUGkj2uKHY4Qx0Q==
X-Received: by 2002:a17:907:7283:b0:b31:5c9e:7ad3 with SMTP id
 a640c23a62f3a-b34b8da5a4fmr250151766b.29.1758783090705; 
 Wed, 24 Sep 2025 23:51:30 -0700 (PDT)
Received: from linaro.org ([86.121.170.238]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d11a0sm102629866b.17.2025.09.24.23.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 23:51:29 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:51:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
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

On 25-09-23 16:03:50, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
