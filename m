Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2FFB52315
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C963510E5BB;
	Wed, 10 Sep 2025 20:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDapsa8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0B10E5BB
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGFHSR017739
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u053Z73zkai4Xa8yTebTvs2P
 Y20porEuaLkDE+bAlMY=; b=hXDapsa8K+egvdzRMaEhilqeP0yTemicIzJ0URnN
 wgwkvRdsBx3kxYKkiQ3s1OSx/KfUXHO0+Xmx3ndGS9iJmP79m5ufXz8HUQ2Ub00W
 utwmBv2RzHjZgjgiMd5RCs6cqzRxOjqk5hXRjudiGAvfOIbVX0qt2YZcC9oQMO2v
 9+Hv7SD7QbmaWyHwArB7ep33Xqu/dZeSn9oXyKrAdEkpPo9XCq4hXo8CnuFfgmxv
 uMgRHDw2kKWIeGc4ZqWfh6Jq7uvvmyRZVqdCzGAbnhDvHI9MTNHrEvRNi3RJd89e
 oyPv6e9Jpsmz/SO/UIj+MdQ3i6R/4KwFA2hPNrFgeNvUYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb0sjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:55:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f290579aso1816681cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537714; x=1758142514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u053Z73zkai4Xa8yTebTvs2PY20porEuaLkDE+bAlMY=;
 b=IHMVreTjppI7Xedd8k3xOuWpReoHOK1OJKtGSEyVwPhjZdOL0nBYJfIaV/tlJbIfGt
 bLrmcdg8V79tiSvhSDQJDFpEQVRrcAkOBbnGI97VMMKKtR2ShDLvToAhriQEa1zrD7sw
 QpAyenPM9tTVv5MeFeeZugqywHjkxipaXWHjfsoTVF/aWvjwy/mAs0z84+o7hpOmYgnl
 B6sKO85cuNG186+fTAXeDv+Glq91LhAzeW0pgipm/Sk+MiicJZtxuert93hJohQXXD3q
 6RjqQbN22/E0ebXP+vhqLvo5Ef69DKPirtR5su38y/qWM3uQtFrm40LAlJejIdtoHuMV
 7jdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXft77UJpBOQ6HfVK7jmfLMaYB02NXRlT/qcRwJ5h/PUmNiA6aOzMiDVqJuUSWudRsxSXQyJgDYyTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAAqpCY58dHxv/XrtIZDJQjZQ4lszdmQtjdGB1YKtqmqMFE0Ec
 QO+mkSt1i1euW5ZZ/19bdGjcSJU9C5LfJMigF7A0/GNv25vYdRfHW7U58IZNQE+qyN7+v/Tb0uE
 Mks7nR+klaO+bFbbJSctyriij80Pqn8Pj1vnK2NgjCQBEKxLftcg6AKaOcwaBi5a2Yy4+lEU=
X-Gm-Gg: ASbGncvVEYxPvXdPzCo4znO9/h8ikPgM7lIpp/BpcFJSVDq/Iby2IgW9Hk12eQaoNs2
 cLCgCDg9m2EPYOyGBn+jnYDj6ltKsfp+e14s0WXzreK5/+3/B9hpzrnCXfZPWUSMRqdFo7/JdFN
 9VAU+kfpbQWII074BxvQXvrmDxj1253nhpidZvQFCJtB7+OUQ7ysrDaHKEN3Y/3rW9kfrKFd89p
 H5j6QBWv9uJpAu3WMHd4eHYm3lx5jOmRLLxuG3bmHPEvnrCRidMsyQ8X3LJg8QDTH/34Ie1WStq
 W5cNG4aijxT6BX8dUNJTKsYU1yLBSA/Luj/T/AROJRuAKLmXfP162yx9iTmi7PndPwSiDL+sLJ1
 eELOPtSCA4IT4j0s7JD6Fn4pct04GvgnawT/vPHrNO6rq7DLfwoH1
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id
 d75a77b69052e-4b5f8464f56mr172407751cf.64.1757537714464; 
 Wed, 10 Sep 2025 13:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuiI0Sq3dAwccCIQjFGmfMsKB4O9JNHlu6WabCdhUocfd0ddszBa/a1EYJO1myy3iU8qHCg==
X-Received: by 2002:a05:622a:17c3:b0:4b5:e606:dc0d with SMTP id
 d75a77b69052e-4b5f8464f56mr172407211cf.64.1757537713811; 
 Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50332cdsm47364151fa.36.2025.09.10.13.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:55:13 -0700 (PDT)
Date: Wed, 10 Sep 2025 23:55:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
Message-ID: <7vs4f2cofte5jkvoh2dzd6hm7pwqaiz4holt7fosjo5uwsavrb@oigtd3lozmgt>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX35Inv6psIx3T
 4pcUX97bPU94Fbw1ZKxUzgUXa2zTEF3W9xxsycA9X7mqNp9zHaD6zW0WBLCuMoMPUWu5g9Bres4
 CBNkZRqs9W+6ERI/qQnQkh0UQGbNgxYZlNXadkqwUb4de2kf7EgECq5DO0Tq4zzplJwzlvvFPXS
 8pKaHVTvsbhVaU0QqbISFiTZBrZyCHi1jYMv3SknNMonrAaTnywa3LOnu4tImqFdf94ldHzjzoL
 m1QhHfmuHzJELsTBiJUnQkA43yov6lB+VGElBM8hS+retTb/s6TXNf0iQgOIlCImYx+4LAUpVx8
 bUEIxxoq03QzwvNfOAHWcdCRjMG0PH5EyDGki3zmoERYdRy/pgcNGjeSSLgDnJ2EBgzP9DLWaEK
 ah8v4NCW
X-Proofpoint-ORIG-GUID: nLTvZFPAOTfiFIv_LNiWs9BFgB8irjeX
X-Proofpoint-GUID: nLTvZFPAOTfiFIv_LNiWs9BFgB8irjeX
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c1e5b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ui4H84HzkJsvguT1G-cA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
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

On Thu, Sep 11, 2025 at 02:14:03AM +0530, Akhil P Oommen wrote:
> A few changes and fixes that were lying in my stack.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Wink-wink

> - Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (4):
>       drm/msm: Fix bootup splat with separate_gpu_drm modparam
>       drm/msm/a6xx: Fix GMU firmware parser
>       drm/msm/adreno: Add a modparam to skip GPU
>       drm/msm/a6xx: Add a comment to acd_probe()
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c              |  1 +
>  include/drm/drm_drv.h                      |  3 ++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20250901-assorted-sept-1-5556f15236b8
> 
> Best regards,
> -- 
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
