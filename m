Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D2CBFD1A
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 21:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28E110E4FF;
	Mon, 15 Dec 2025 20:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVIB/ia/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaI0O6HF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860D10E4FF
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFBSqRl189337
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5pki75WPCYaCGC32sVPKpS6f
 I/bdegMiprelgAi5BB8=; b=mVIB/ia/kCldiJCOFdtrqEX8ET1h29tPZY/1LXy8
 4JpU7W5CxK7bpSMjdxiN853d5HA3oj13c+QnU8zcg0clU8Rr+chRIVKYRdB3Ny7b
 ceNarShcH4Jtdh5deNfnN5SFH54ErI7yrdWZaud8JRipqx0cgxBdCB4BljSQbPQb
 M0nH0N/ccvFiCRhwBEE1823BnTfTIAr/9576ZN9IyK+M8Nbw6+HfxSIethdj92SP
 hq++FHIoHvc10yIAxAonWwkGYfT5NCBsEbeHJq5a+DK09UmC5u1WV7ARgk/OSa23
 djsE629VE5UT3ekub+jP0+XdnOAUbvpK5evOKtY1L9KmNQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgashpc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 20:48:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so41915586d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 12:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765831715; x=1766436515;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
 b=BaI0O6HF7LzVZ/6G3j1IzoN1z8L/vK8fvZNmF95521Ydrh0z+yZwIcpANuflW4KZjP
 FGxkj0qSH6yHVMIhfINxLwK93JFGNLoFmdCrcV9R8WPdh2IBXvo2zeEJvnTS8XzCThfu
 QA37bHrAnGarHX7KaTya95LVVN/0dYyB+wZoJq02IkuY911+6JYCqtizj8sg6OGp2jNY
 brQDmWPScbsK1OIbz8Z+4eDlhLAUv3X+q+um3aAocUsfFT7bQUwH9X4meloyjUQbMy0Z
 iK/loZQHYBef5zYnrsYQDXH6kBha+/yk8XJ0udNRYdqfWlgbRiRLcOSYXzQHu/NpGu81
 F8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765831715; x=1766436515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
 b=ZR9wKcbyxt1UV56lz0wBsRhEICc2M3lvfEbYLJU5LAqOp8yx6ex2uKN3AS5fKbsyrz
 st8xdwuaJyJZ0V4CmZoTRb34bh3H6pJjrW9XWQobs3RQhJxSDIn5tRDVf6fuRken8Mtp
 kVpzekY6lM/BwR+PlqwCLLBwxJz+DScIWRfFpXqxGI1w+5ILK2rxH3+fmKsVWDy2kn4i
 EooaSvQ+WLzF2PWdZ3Vfkv/6E8eoLC7p8N9kIqqGbw66rGlKyEqiplz76wuqjdOEDNiq
 HQ+PePftj3604laJVtWKgLXg5uIXAF4VBmjFHhuwfcvVpCf0iHbGPQNCQkO2uZ691lgo
 LhUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMQKfHaUGuebBxXjLZ9GVoHDUKFWbhsy7X04+jVSsjS76nXUb1zStDaxPR+ZmdKJALA5d0fFzLA4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM6ogr+7wlH7RrU7ayoKIFoR4f+js8U/J3OwJGD6f55W+2HiD7
 XNl4DO9951ojgb1flSVOkdZaWJk45qVTX35A2Ome9sq0GI/7A60YqYL/l/1vtAyNDG6wz1KavIP
 CJL0Gx+o7/YioB7ryyLlQlljsYsVhb2CvLLgPI4INlp/k5wnkjHBf/4pWk/nHzHTVhVDvnQc=
X-Gm-Gg: AY/fxX5PkQdWUmNAZBSrjUoH862A2BzOrvJ3Io7byTonbuqiUQ7z0qKemReQQIJjHGk
 w9P2Fj7bBt0rIelnMXxEPQpM64JI9dEqyL6KkNXuzNj+IOd1SrqiP0G8u4aIVStoXMq8jxpMqvf
 142WUbnlVXAhepqLuNozQ50TCenB0+kt5JWuGz7nDcPAkcJwRbzJTIZI1pI+yDwPL7fZugCRLGi
 AzTw8MIxhlbEWKDSSbed0del/zJvbnA7y8JS3dYkPp4KmtqztaaYo4hNY4a+I6LWeQTBVKytkRA
 qk024YVvojY37aRHY2VEePo2rNcLPQg4oRLKtkiCfM75cacbUXmi8Nt6hVroPPE1j3eIzxqflGo
 zDJOgMwajapCjsuRqtDlWOEMvh7/glH/eql3HKPU3pe14ZWlgYfaBVT2Q5GpHY6l5oRilxoSJuI
 qZ1zc85MlWtA9BQxMkCCj5/Sw=
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-4f1bfc527c9mr243417361cf.30.1765831715210; 
 Mon, 15 Dec 2025 12:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmN/KDpj3W3F4CvCXgAdna9To5O6vhU/HOdmJWgcrxO14nwGW/q0vweBv6qM8C0DSy566hBA==
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-4f1bfc527c9mr243416891cf.30.1765831714718; 
 Mon, 15 Dec 2025 12:48:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da5dc5asm131302e87.77.2025.12.15.12.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 12:48:32 -0800 (PST)
Date: Mon, 15 Dec 2025 22:48:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <freedreno@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] drm/msm: Replace custom dumb_map_offset with generic
 helper
Message-ID: <cv4we57zxltpys6qf43nxldwwogjwxyglp2hj3ld6talvlteqp@dsen5g3v24t7>
References: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
X-Proofpoint-GUID: hMW5QImEutxFVFSaLEHsGVPLLawgNQ0G
X-Proofpoint-ORIG-GUID: hMW5QImEutxFVFSaLEHsGVPLLawgNQ0G
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=69407423 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=26i9lwY6jznW_AXw1HAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3OSBTYWx0ZWRfXwfdUC1ZB1u+W
 A3m5kGlzBgQ9a6D6USs3rGoblFR0ZvWr3avEZkE6LlrOAJwBpG0MFFFijHevwvW7i07QX3Rxrf5
 CTLYymXtUKv5HP3cO02cEuBoNMSXwNHmmuGrrmOzRpkEfQ6RpMUJcNnzrXGWoUaLroAxWJ8zaMk
 oUiG2JmSeVEAD5xTBZFXjQJCm9PGLLTNbLm6jKHBDxmILbqjTbG+40TX+FPEbE5u19V4ZIV5yvA
 Vw7VUFh0ygvmpeKPMsoWtfhBQ3xJsbpib4P53Waa2HNAd6v93XdCMbdUSPe4wQctCDjaDONeL6X
 xNrB31edEs8vZEJuw5q2rG4txRIwgld+owxWjkxbHsYPxAL/1JlpeGnjKY3BN6mUtzIkT/zaSbl
 XP1pjfBhHq6gMVUeFvToOK2odFx/7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150179
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

On Mon, Dec 15, 2025 at 02:28:50AM +0000, Swaraj Gaikwad wrote:
> The msm driver implements a custom dumb_map_offset callback. This
> implementation acquires the msm_gem_lock, but the underlying
> drm_gem_create_mmap_offset() function is already thread-safe regarding
> the VMA offset manager (it acquires the mgr->vm_lock internally).

Other pieces are using msm_gem_lock() / msm_gem_unlock(), which
translates to dma_resv_lock() / dma_resv_unlock(), so you need to
describe, why it's still safe wrt. that code.

> 
> Switching to the generic drm_gem_dumb_map_offset() helper provides
> several benefits:
> 1. Removes the unnecessary locking overhead (locking leftovers).
> 2. Adds a missing check to reject mapping of imported objects, which is
>    invalid for dumb buffers.
> 3. Allows for the removal of the msm_gem_dumb_map_offset() wrapper and
>    the msm_gem_mmap_offset() helper function.
> 
> The logic from msm_gem_mmap_offset() has been inlined into
> msm_ioctl_gem_info() to maintain functionality without the separate
> helper.
> 
> This addresses the TODO:
> "Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"
> 
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> 
>  Compile-tested only.
> 

-- 
With best wishes
Dmitry
