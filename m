Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C0B2055A
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DB410E42C;
	Mon, 11 Aug 2025 10:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxd7ThhG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B010E433
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d864019036
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/ucSKnN0VabkHBeCyUPOOAp0
 1IU9Td+bmPEMlaDwwOU=; b=nxd7ThhG8UiO8u4+aSNd9NxDhUvou3BAn+kuDkqC
 0g12KNcGvPLBzZnLa922+aQAbCjy1re5GA0N2LweBkFOLRA+D8uL/VfU3tYcp05c
 MVYswdGvFgzsWqtoWc90iiEXIOHc2EOv7V2sEd0ekyqZQiohlxdbKUAdzWgib9SS
 dT96BvYp3AopY15+Xc64JZgnvcudlWTfSJzFvPSDrLbMD06Zp6y9IqlbdiBaRdxB
 xvpbFvtoFJuFPhFmy22IsFXejAVmNxgtkLd5hw6Ilu4ccGPcecZAlprtTxcdwVPS
 Yvs61NKR1WVjdbsB8Wm0jz+TrDKP9OGP1NN7OyfQjOeJHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv08s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:31:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b08898f776so106832861cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908271; x=1755513071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ucSKnN0VabkHBeCyUPOOAp01IU9Td+bmPEMlaDwwOU=;
 b=UlVm4N2x3GC3VOo0R/QUQ3sUUw20Zw2DjsfWa6VidqzTXvkN58u527ILEYxbr5TIbk
 bdje6oC+fxjdX8qSn7gy7yQWT+mP8+XNJrcggQgTv3E/vrMUM6iHBOhtdY3ABaqdiwt0
 /HiWQVpnoX8jdRZm+TLsuCCk2iqVeSvqF4nKABwxRHz1zBXvg5CqQ65VkT8wLYPQUird
 3QXOZOJ6GuMPCWbcSTbnmfrFhSB0wQ1JPJzGuzp1WANPRfHvWP4kinPc2jmkTNcl+crO
 TT8iCqJjpNPvaFE4Nf4XQo4Ti7gcgZ9F5Yc9/m06oOyyhJXGgWRJI7m93sOU3xO5MK2R
 3cbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/cYUnf3ZNALIwdT8+6keXsilcOVxFfnvtO2ig9KXP9BHusIaYZh6K+M1b0YgDoJfgSd1X0fe9S9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/9nMfdyjsJs4rzvN33QhEfraHKvEoqtr5Ra5WGCiWNx8AStTV
 IgfOCTkd8AJ2vO4THwqNBJoDXe4rkMs5lu2E/XsfbIHQKdiU0svPJhyBA5HxaioJvYf+BR0a0xF
 QcZzLKEKtkM6RdBwkZiluF4VD7QhPTRU0Gy2qh+oxCCWgPGYH53cbTzjXA51PGRXY7I5EV/Y=
X-Gm-Gg: ASbGncumCDaTu01vC8GduB/sZ6w5b9B4+rVZ8PBADR/7Ay8PxlaMLWFFOvl762AeklQ
 Miludsoc26kBW5UXuhEJEZehUY3kcB1Yq7CgCeEyK7E49J81GOso2eRvfzlGevKUGzCIsALPdHQ
 xZZxsc1Q/0nWalsJwF5HoWMg7lVAYj2NY5dyMuI67lMZyFbKtXuTxi1Nq7gT9uIkf/s/sOpNvu3
 hELAw1omPpLa4BYF9j9hYPLeYLTqg1OoRaS5rgYJq2kvMj04idIXbagVYaRiFV4Todsal2O9ghi
 Q45Pgnsy+nDDynm7hvzRVCypZufR6Vql9HI9yX/Fqv6X6EyXHabLlwOGVxkm70sceg/l1nrQ8vX
 j99yaFLxtJMyNJVzi6Lei78Bo4uvwbxMSZh1UzaDs5NSxvvQ5cQvw
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id
 d75a77b69052e-4b0aec7e670mr172487681cf.18.1754908271518; 
 Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcBbTdZISUt9SKxmEFAT76YcvHLLyKJL2uxyoSRdkuIyPT1U4jZXtxIgMb19xtPh+M9uOHug==
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id
 d75a77b69052e-4b0aec7e670mr172487341cf.18.1754908271099; 
 Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88caf0ebsm4214962e87.154.2025.08.11.03.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:31:10 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate()
 to determine_rate()
Message-ID: <23yejfrhz3qmi67r63ni7zawmpsawrb3jzn37r4h75s2ax5gki@6ngyqpqlqdez>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c670 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mjzq3S34YNfNjlOJZ5yN2ULua4sZlzOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX7EqRZ93qB0Qf
 GvhAdioA7nAw6zC19Rm96ShMdFgHAUEuEuIPYlLXNEMHA+z7+21hzXDh5ppn+mzXOy6APuIwlcH
 Mrf4KRgX3tivqTN+ATlgUA6gmZPtfyMYOF6mXbC2BWFU9Cw6v9+THqP12qZzNVsKa0+BviceGVq
 cV6Oa7XsAf0UvRGFYAlyfeVPSaz2mz4ylQxDG3lvi/oRSvj3mXOi5pdrUvUUfC6iLbOYeTtWbbP
 nw7D3hgJE+GijWgjtZQh0eYR7K+g/cujVIS+e5Ysn0/b2SPwlDZwfmZeqLU1YEidb4T3GZA5T5/
 lib8xEqZdeI4VNYnywaQrKInv/Be1jEnHjlcwCAuZFlwVp3xcOskpCBWL7S+685CAvafAd0FQAT
 eZFSw86i
X-Proofpoint-GUID: mjzq3S34YNfNjlOJZ5yN2ULua4sZlzOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Sun, Aug 10, 2025 at 06:57:26PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
