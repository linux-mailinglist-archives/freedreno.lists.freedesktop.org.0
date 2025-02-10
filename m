Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61FA2E308
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 05:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9410D10E12C;
	Mon, 10 Feb 2025 04:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oQfztohP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7AC10E12C
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 04:15:56 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30762598511so39190201fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 20:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739160954; x=1739765754; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
 b=oQfztohPcjQqcLL5Ht8t0OIeDDyM9LYSd9eEffTwkhP1hEfSQsfn6OShXEtZmihdHB
 8auB/XetwMBydW1kbsD6+NKsFv5ym7dvi+K0rvbNVn1c+t7/B5UIVvlvD6NTIQBV9w33
 0IAR+4f3Ahsg/RcUbxN8lZB+uOMO7onSd4cAozVwmutMnZDfOjOCeAlD8Y2NYRk/UcuU
 S7//x+aRuLmmnVbLZaWu08GwxJ2hW7t6pBuE7fig+1ujrwYLIu53hIvyRfIuPPelTRss
 cY4kcoqL0AiK1GluY/eQVDCoPus37hubPz4NHv5b5KVsonc1z0gWnKujn1UO3GHdaf75
 6dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739160954; x=1739765754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwzLE0GCgihiIk+dFJwQ0ALU3Kl1sVby5kLip594Ikg=;
 b=QbyCKJh9FS7r7hmZcleFbKqcgZi8OXl4K/QguKDjGWRkkzep+xSthsLeUp10Z69L3E
 etXjqQorEoLI4P4QRtGu7PH6/MyggCONSNDZ3Np7IgmcKHW29oj1YzS3yxjCseDy4oNY
 RyBrXusymav4WqB8LhyL0mo4hDW5PkkHSBu1HpH9Sx3rR3m/hx+GT+3i2q93Kms/w7Af
 ey5xpbDDf5Z4GcA3G9ws1ficxJE8iH1v29/9/bCKZJlJR1caRdhklyo1U2lPmxVqevij
 1p4yvNj61dQLy9iHUJZdQ8z9CrGDwQxweGq9GA8F7+z91Ckv0LS4DEvQywTvLmY8PvWM
 KlXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqin+H2jbmHA5wxZn1ZNDoXlMazLtDiuLsE3EooLlAxE4j+zy5XaaZd+hwaG9Dsq1h2rKGtonD2tI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+HKdP7bBAOo/9bh9FRvQur+tGNuBNnliGIhlZk/ALEZUEydrN
 dqbhS/nHI2/fQiZkRl93OsmWK+axexzcm2dHwo5l3cqmOTUub6td8jdsGSvW+fk=
X-Gm-Gg: ASbGncuEYXeeadJj4Qec4Zhf0KhcH8RozM+gR8bpErj8xqqwM+e1Kz1AT1OaQeFwyh8
 sja49NKFMuOMNeR4bC02cst9OmtNSUmVqBgBp0YU8lhVRrEYGoWxjR6fn0XM297g1H+rKemnSqU
 G9II2pqFud0hqg1qHCN1p/tso/uGXBrIP8DiTB1uf4RmPOrzw1c7MgzCnEnpVQrmH+2yJmwlspi
 O4kWYtInNGy9H5IlPs3NTrspmWjA7r9UQvejF/w7zy4hhIzCmsJEqibgnG/qode4BuWmI86NYaf
 TkQiKWsoq/miEHX8h9hI/2yc/ox755qMp4iQGAJeBbXEOIJNRxnrvEtIFTiOs2t6FMx+GY8=
X-Google-Smtp-Source: AGHT+IF5U6ArPZ8cE6ddrQjBGFIlwz3f3qJFMYvqashpqs6GvurvVMofzsRTGb31NHrx7zoqyP9jzQ==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id
 38308e7fff4ca-308e54d63b4mr13706111fa.24.1739160954311; 
 Sun, 09 Feb 2025 20:15:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de190915sm11354891fa.40.2025.02.09.20.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 20:15:53 -0800 (PST)
Date: Mon, 10 Feb 2025 06:15:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <koye2ppygjsns56xxpdirz5s64kblqjhw264rmfqzlxsx5mzwo@u5t7m2vktfag>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
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

On Sun, Feb 09, 2025 at 10:51:54PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Changes in v2:
> - Return explicit 0 when no error occurs
> - Add hardening mailing lists
> - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
