Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1291CABAF11
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E04E10E1E3;
	Sun, 18 May 2025 09:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ob2VaQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF910E1D4
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:47:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9aUKs027901
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TFlU0fSZgntNkoaZyg/NsxA2
 mHRMkBsFVOawTRTvNFA=; b=H1ob2VaQRI9r5AAOWB2Ea5Frzx+JtL8rCY9MiJmK
 nQ0DRiOiiaLUuxUNM9rgl/LO0rFBhhC5oXquNkKd+hKJISw5oqYNKs1pC+TvzlQA
 LKzbgv6Z00HM1O4coXxfnicNAyE6/EQbjAqaeEnXEf3kG7PJbmpvq1zquYI9Qjhd
 8PUHmbJG11lurGuVbXOEDn3WfOYv6EMhZJHRVYfi/ZmdaH1xTdKv9gD6+6URK3Zw
 pP1U10hBwQ3jxNNPkjCozKQOw/SoTlxx/x3bhUJSy2hscWy4bs7P5ktCdu/kxL0/
 RKBrF7AP0YeS2LMJPp6HcZNNe6DVLEFhJ7G27RrovTwAKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1rjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:47:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6ee43c4a6so99351806d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561662; x=1748166462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFlU0fSZgntNkoaZyg/NsxA2mHRMkBsFVOawTRTvNFA=;
 b=SAybafGc9ybQuOvGA/bEvFfiZsW5WuxisMp0MlQIACuc1cM249jxU0NfkAAmL4YeVV
 XXUPPTCSqdLDhw08lUPEYCsOAY6Rs8+U1T4ViE+k/LWgE4czwIdfsOBL7vCuROjLuszu
 c5TJFgFioTY6n1mXuZAO/dnq0Ut6TzoeFGmG8ZNkS83l5dlTutoP1DS8yUFJ8TIZD0GU
 wCk6/Ts5jAkc9iuXBb1QGRstDq8mu0QoURdCBGeW8lcpli6ba5Y6MKML9rLkeLPJLujp
 rUQZ0+4IxjoqrN+ok3B8A2NhS4JVSpBCfwnVeAST8+Sg2B5znXQ3s/cjC6S6pVv0g/5V
 6AAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ckwmU9pp6AWZ/1q3ptkE/Pw2QbIb9HiVGxCFPgA6Y2kg906MIgDsaEtXVhF23q1e0S5SjhF5+Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ3qQsczUGbmcz0N5ArIho6Er/9USjstHGbYGKKuYvX38qa40r
 Cte4+GGG0ozWOX8cf5bwEFKqGMLhH2fJDOjZnG+RFnpey6H7x0A769+wSIHk6sRU7tVIavjmJwR
 XSoXLRHpBbl8k9Wu3oMIDij0qWqxTLMEgxPkr5hI5grVi/jkOOyj6DK+vnyqNcK1NfPQ0qMY=
X-Gm-Gg: ASbGnculmNxoC/Lp3HrzjoQQYrr7svX6bFRt6gTDhPty72JnxSuxqIGJ0zaLhza4Eyc
 cgFx0H+JGBWhu32PaW72ucgaPYcCFW9CJd9fEjIXRgyZfScARcsLjcFUW53YO7gs9aZT13rcG4l
 7a6ye6Afd87hW2MiN7Pu69Pcubqw1MFi/ZcXyT2rJiPmc611zjKOAWdhwQN01FjxN2V2g2DeUxp
 cwwktUgYrOsEeN1eOBW8BJwFLaJ6YVIXq2ZaMPK7INIAad0LTNB1HbBhtydL+Qd/nNhHvk3J0sR
 SpjlWnmtRZHs58ldosjTAZiC/yhN0pI459XmHx3x5l4Adw5s3KQ5yrsXSkutElsRfNVnsfTvQLE
 =
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6f8b2c845aemr142878766d6.22.1747561662440; 
 Sun, 18 May 2025 02:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETeYU1lKZj8FbSxpmtHQ7ao1CaOfNBSNhCCtY6clLi/oJVGUTSIlf3QIwNUZfc/juiBKD4BQ==
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6f8b2c845aemr142878466d6.22.1747561662111; 
 Sun, 18 May 2025 02:47:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2fceasm1374479e87.60.2025.05.18.02.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:47:41 -0700 (PDT)
Date: Sun, 18 May 2025 12:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <wwty3mev3cihpyo7utwoe4aspeqf6hzuo45p4xbr6wali7axjc@uqwhsgqcllzh>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zDkqo12Xl4aKAR5dWOM-ELjxye6l3dYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX0JVLKFiKiYox
 06/gBaORcvr2dZA23QdBIB9SO/B5dl00w/Hb57/WgvAZXFwXAj1jym2sE7APW/tpR+FFqcIPSdP
 a2xr10Hh1XWSKE5PmFLg5PsaoI5JR1jXImVXGdFi9ZOEYx4ZmugFPvbnZQiPAgPOzvSCxXtLwLs
 qPl2RBhFhLaKnPZBfVmTAl6tZF2d8B6nem09eCw/8oYCdy4YNVaZ1w2h97V56QnLMqSNsE+Uvnt
 rAsWS9uc3zId07Qx6XMD0bigzT8qRwldN3kE2w1UsiVFFiqkuR7fe2E7ZqdHiHAaqyo5EGzIUTx
 XOolLPpsAyBikWkPPE/CKW4NXHK+wXCOL+ORmNpv7hmU1+dJM4vYb1XTq6Ar2eDq8rsYTWTy7MC
 Rri759ypMCqPWB81FgWXjbPF5qGwlhHPgodr7T/WlTc4uW9sNTmjyVK0wSlkc4EpHAfiMEYS
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829acbf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Abfa49PQOijBjWCf-xgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zDkqo12Xl4aKAR5dWOM-ELjxye6l3dYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=991 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> This commit is intentionally cross-subsystem to ease review, as the
> patchset is intended to be merged together, with a maintainer
> consensus.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
>  include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
