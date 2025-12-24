Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10ECDCB8A
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924E710E391;
	Wed, 24 Dec 2025 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H87ZBlqg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHEwf/e5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72610E391
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7JobI1246312
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ahp6Ojr1T1dTzkCeHaWTBi7T
 SqRyKpSOmejJAEutSL0=; b=H87ZBlqgAWXj6rFxzzkDWk7THbA6HrG5RqoLPEB8
 0d5NHzKYbN9uWLZZ5yl92DU1m2T9e93KEsIaZAyG+u6NpWYMtTYsLoNqh3fUFGDZ
 k4MkC0Age8CGbSvXSBEJYJq+20GwJhFrW6LaA/ODMfbgrVuHA6x6CmIu/4z0tRQO
 9js2VX0nnBWiSRZvb1vCRLVy6Cd9gzpEduNcRfVIsL6z2mFkhhbVjc6WgibDlgAN
 xgp9eKDEDHO7SJeSNqlWDC4LDpAlXsdvXQU94kKDKoe5eOK9mvEPzEQSsOImu5US
 rRV4RTcDaA1O2Ktj1dYBB+8/+pgVSfQf6m5deFTKVV3ngg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cuwu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:37:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5e53b3062c9so3680412137.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590638; x=1767195438;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
 b=KHEwf/e5shiCTJDRIjkCnx6VIYnnMSwfQ7eFVm14gv7rap67dBe9hYzLF8ZF0JvSqw
 hlzasLpaGEKJz9IAJNcR3J2dtQcziuezYyPcAyN8zhvFEom1kP11RaH2fFEVI3tFBZx9
 vqJS5/1fygBvaGs4i9vcvbMDVdmp0JaNYics4HSUXpblwDgVj7FAjmAvY5WJkKGfyEeX
 o8GESKopHYc9yWIgOt0YaqB81ghgEg3ZSqau/9QZaRyT1dbz3SzL3W3I3siKqzw0xzPh
 sKjYZGllXnE/tkkCfGl76kAuwKjzhiLJxNxNmnB1itSxrojqJ2qZRrWVeLZ4NRMJ1l4C
 coYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590638; x=1767195438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
 b=XgduQfSrO+mNI6iID9VnzCLux/8M/S3J5fDwdJny/F1KNq13V2e5yTuE6LGZdPy0xy
 w/wvg8mAbX8yMyuj7z+J2ui6c0zhRbbkeFFs2O1urotAjx1dYdvxOF6HNvNT2ftS0CCh
 To0LNNc6je+2U8fXSDvQeXo7/b3DwdO7ArM02m3w2aoP2R+uiDU8NKJYALJhQuWVshFU
 1k5WWXV+yLbxfNWY3jXb3bIxaify58z/WsfuEdxMkzxKcBhB8O5UsCFYpOn+VnqIuRzb
 ZcjiDtA2ZePDSwsjxK/mopub+NySnM5HI2dgpJBylpLpLN3cY/UT6eejhR8U2mKFuKRm
 opZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqD7rSj/3xroL3r8TOmu39YXi/3hGukEIEwN4KZHJYt5FzjmBfItLKsK9czHFVyjtlHWIcc8QKPAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww0QmFfQzwwX2WjkJedssy9SBubfYs7NUoLNmF7eqlQIRic15i
 G5dPI0+MkL40vHoCq+v5tj432uUJm6H36gORjgE82Y8X1S+SH/edT0sQYM+VIz8hFqdp5Oc10Cb
 P+i82dKTgVbKheHq1PpaCxJhek3FAxIkFOvwgAZkXU+NRjTDQ1rO6iKfqZe8OES5fv3P80wI=
X-Gm-Gg: AY/fxX7CCWze20eKPYP9ZqBEGE7mLgDGbwml5Rb5mXbP8bWoyTGRIxBX3XwV59rUG/3
 OQ1MvOFbz1Dxuhz6d2ut5hOIYZnW8EaQQ9q3k2HWu3aMjzhpxa8fIaPdgKQnv+DfSr2eH8MlOQC
 fKGFA+ZnkLn8Exa5u1oCSWBEfqFpBF86IRtl5AacmKF7yLXaiGMYU8xIUJQiweDzk9kAwI7ouqF
 Ht5q4S826oaH02wSRlH6kwb1hIkdhv6TDfb+X7feYF6t4P/X8pn6Ll2Ex4JAxYOrfWRbs1MeURT
 fyqeEUx8dbx0ausYgImkCoG3kmizlhZilDNr+oYTrbuoIgAnODpKLOlHv3/X9/KQDuxND2HUBil
 BA1ZIggJlhRlwr+C9Rfubv6svZ3aGt05ZBScK3SzB4hOGzhzzfev99UOAzqAbW2fasWqbMPPMpA
 EOwAvvHIGVy2e0pBf0GCQaayA=
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id
 ada2fe7eead31-5eb1a634297mr4990674137.4.1766590638153; 
 Wed, 24 Dec 2025 07:37:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJq3Jx5CPK5Yuo8d6I+bbObGv8XhlHpPoLVOWUH6L5Yi8bjzN0AKJz+ybPigDU2WS/GbMYzQ==
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id
 ada2fe7eead31-5eb1a634297mr4990664137.4.1766590637652; 
 Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm46356511fa.18.2025.12.24.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Date: Wed, 24 Dec 2025 17:37:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <ob46kpwnd5maaffqesozu7fu5xqzozt5bpzdrxvxuiqfaca5z5@enazdt4gv7fn>
References: <20251224124254.17920-3-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
X-Proofpoint-GUID: jqhb3syl2ATYMRDhPtJsAOD4GGjCfwiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXxMmUKtdMixS2
 h3TQoXeErwfR8kvCXj8a0zYQ/IGpQwJwKM73jATmz+i8VDRdMZlxKka0rmdKBw1KWcnPkzGbi3b
 FEY18hkuoJRsSsVEaD92rErN8crffOmHFjMgJ1NmaQJmxz5N4lNk7bqFvlQf8PSDM/D6q8C9GlH
 uzxVYwKo1zgJgc1PLrZEjY3qP3wTjc0RsxSCSKLxDl2aNy9y56YtqGbdgiQwFTFkbIDEq3RU1gu
 eZEQAmJASbL9/80BVbKRfVnLHF9dfiDUZG1O4W9pX0ksyGr547RwQ93tKqSkK5nlB/Cmerv4j2S
 1t6MAPdTsfohdaUMEApCKwuXYKZGNg39SP4wpO18enx4ZzRvYc1rrH+/35OPIN3gnmR2eD3WIpc
 ARdw5ZG1TR6MueqKsG83gRbqZYqRLj3786j1xAyFJAbRNphDGGBsNiALYkz8mSoI3PtXpwZ0RT5
 QupCB3VjW1PwD0n3rWQ==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694c08ae cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EAWue8hiOrRKlVdnu9EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: jqhb3syl2ATYMRDhPtJsAOD4GGjCfwiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137
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

On Wed, Dec 24, 2025 at 12:44:22PM +0000, veygax wrote:
> From: Evan Lambert <veyga@veygax.dev>
> 
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> Signed-off-by: Evan Lambert <veyga@veygax.dev>
> ---
> v2: Use real name in Signed-off-by as requested by Dmitry Baryshkov.

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
