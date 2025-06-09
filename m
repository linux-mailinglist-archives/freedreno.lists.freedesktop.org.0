Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D29AD2624
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD3510E1D3;
	Mon,  9 Jun 2025 18:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrs7N1q4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B818D10E1D3
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:54:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599WeJt002402
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ol8PDG/DdkJ6brMjCQQkiTgY
 8p3wDi/HNTyGiH3uujY=; b=Xrs7N1q4BL8pGdFZFko+/h5MmbRBA5Cg2qicx7fn
 sNZcVPieF02AA5TGbJlY1kttzTNEM+fqjv/AWrBoqtEaJovLbUixIPEgZUe7azuX
 yYH8engzC3xfiA2iu3gKnRbljmbKXHA2+l2ysESyrMhotjWnjB6Ze7QND/3RrseK
 z0ALHpQCxajEKIPWEuBCivTs+IMK+6YSjcIwFyYUEX/P33u6jW7n6WpH8HMWHTJI
 z7USDKL8uejVZ2S/L6b0V6/baDQxy4plucprQzhtlEZGNmgVV60FvXKd1oaBh2hj
 4TDjfVQk8v0apE42uBRpsIGj4p0BctBSly4drSfg6DFqgQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66w13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:54:31 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-408df250dfbso3957342b6e.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495270; x=1750100070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ol8PDG/DdkJ6brMjCQQkiTgY8p3wDi/HNTyGiH3uujY=;
 b=Hu60MnOQoMVR6LJhpcgMotE0GTpPyRXIvZvWvpbpRRDKkB7GbQaFPv6m2wsI/8vY/6
 xQzj4ypSIbbsNGKjo0NzXkpzEKNSmcGKtn1fiHHyMLHZYKpxWgLd71nmsYpG/fweD4mE
 3YQeMmDGob0v/8ljwVhsn4qi/ZkKWdsV82FZxMgn4Y6qCcpp67pNlPDeU6CIh0/O26qo
 D7t/oycJ9HthXv6oxDYpP2hcBhiCNjlBL6UFaC/FD49Rn4nQ9kHXPeX3OLJOfU/FozLx
 7ymvXoQA6XP6uVSLs2dxM0CQnXk6ItsRJAcAJQzcpltSwIzJdutx0htUBj1O0NEoR8CE
 M8Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdNUEAXvFT+YsgH8St+SOqgNfxmO4H3MzCMukPSQqJoodilKBVfx0pmAcmAUQ/K9bcKWTWYJVxgNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXnsimXyJb7N0x+G8nWOswXsiTOGBnnZ4/MKa8llAHTGvjLPwh
 1XilrdqMMcTAjaU8k5B0RoxlD6jF5Eo8aziBGYnQ9OrYEMZW/TtUPdCfyaagyH7lgsmD24xVkV3
 Ff/RfmXhsasxrZoi9OAgjjnwJu4DSeiXbY4S+EjwXMqnB/+IRiFRS1z2vHko/TKHoG+jvZLuuwR
 r+rrU=
X-Gm-Gg: ASbGncvZ5VjLqxVBBvofz/PuYD7PFNw7vMpdAC3y74Fc6NtNjAxEfcSDWuavceWnIZ4
 fUdqwXrKg9M+Zjj6NR0qrDcXm5X9oL6PXyLTupf99NN1ozEe8Yi/HgXpKfGLgvf6tpl0/lcCyb4
 9QksKO8K20n9I52MtJsELxZpSCRRKFJxvkTs4/+WjcOMUL8QhBCJBRmghs6eCpKUSgmZqc2W044
 c/8m8+ClT5nJ+POXwJ0dMPMqVTA2l231QyclOS0X9cGUsVSIDdm/sEbPceykxbBCO4TgcwUYkS4
 AhDw846a7TXxc89SpE9d4MHh/dKah5AWAOzrN3ChFDbEDtGqOXBJs0wset58iOmlV+B3UivFNgk
 =
X-Received: by 2002:a05:6808:2385:b0:40a:52af:e91e with SMTP id
 5614622812f47-40a52afeab6mr1534986b6e.17.1749495269862; 
 Mon, 09 Jun 2025 11:54:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO2dqN7vYHPlmZV87m41nP8/ZqssxU5L+Yh0s+1ZIu2+sJsllrp9Mz+wf1imIYHMK4S61yLQ==
X-Received: by 2002:a05:620a:2b83:b0:7d3:90ab:814a with SMTP id
 af79cd13be357-7d390ab8376mr930036185a.24.1749495258901; 
 Mon, 09 Jun 2025 11:54:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0476sm1266162e87.35.2025.06.09.11.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:54:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
Message-ID: <jowyn4tkqy3f7tiqzkp7nw627ddqgzgqms3q4rp5kveiqh3xc7@wzbhbaxxuftc>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfXx7FQZ1Mf620F
 G9Y1lXNqbciAY28RkeLQH1Zq7eid9wlBhr0OaZeIXt+8329QVGzE7edNBeLwBis3LheL490dDa0
 ZikOffjqybRe9hiLUeLcmCBpJuEZW8uuY43kk6cRYzZ5pYVk8WeeIeaptkk3x3/SPl/uwTY7K3e
 wHed72945nTDnXFTlm+/1iLYPNb/KJZaP+2uBpldMCzNm33GmutCBLZ9AgUbdyu4TW2RnnPm1E1
 LpvpLnRn0vwvWjBWy4gL/WI7z2O1Nx6elPV6aZ3akpAU4xkGU/PfEj1kQq9yUGuv5J+9w2gR64d
 crcURRGzbLJTqcftUs+xzOlZZm3n+smcP31C0WD/VTRBQTISfhn6lQLgX1W+wNfMMXccnr0VOMY
 f4hvlaHSruFMdKJpmVE+Eeemiwh2fRBy7qj8RBGh0roTHoakmflKFsoGBVjqYRq5IYSRO2JH
X-Proofpoint-GUID: tszILLKK2AHpIcDQ4QVQdpLyiAyuqx9b
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68472de7 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: tszILLKK2AHpIcDQ4QVQdpLyiAyuqx9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=721 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 11:24:37AM -0700, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
