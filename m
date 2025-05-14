Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190ECAB7514
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E639A10E6E8;
	Wed, 14 May 2025 19:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E464yPX2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD36110E6E8
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:05:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw1o015190
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ywYtj0jJCUfwAnlUn+KfhCG1
 HPC+N0krcot5RSineC4=; b=E464yPX28jlgQe3n5SUSqJIb7FKLpRL3y3uvX299
 3aORlz1ybgZA3Up+TgQFUwiWZgEL+f4z/eurMb6+4iSN9WWtaUdiOvHeJOb9GcUZ
 T9hqBhHJ6SPe4OA457ZuEagma2U/HtpKpVuonLR86vH7EeixbF/0dnjiozkWLNEC
 sHy3LSjNnI0YfE1TuN5rbPWZ3DJLH3FKOFfB6gx44A/9SbD8Sstjf0IBadgAWU6e
 bbR+4RIhIYKZUgDO0LwarnTe8bN8beyymbSxYBtqxPXH5kdhZwkxsRfamEcpxjMt
 t9RKqnS1OVFszZUYO4N0FuiYT1Sn79SuaUHp1MH+odHrhA==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3pr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:05:33 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85b5878a66cso17342339f.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249533; x=1747854333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywYtj0jJCUfwAnlUn+KfhCG1HPC+N0krcot5RSineC4=;
 b=aW6JAMxRDamsNKy+UxhdZgcJqd0y1m3W1ofou+M7pBsRgDgm9mC1kAnUFvEcdorhKc
 ny5jq/5MXUpxTLgbGnMHnJyyz6zOF2objbeya9qwIKNVBz1tPxHSm3q2ohFD5SFSUrLW
 mrxJUYL6S/T4lmYu82gBKBNVnFD9CBzp3xdQtALkh7tNUPFgiu69FGtzT9DfjdtHqLZf
 PoCxUd8eOedoHaMcmHgCusiNxZSeW52OoLwWdTUgNkJ80oK9ptFNNRg/RRYpfpDv6lh6
 rMnJ59j52mX0njx3H2sCPphzVqyhL1lSbhO8uv8E09k0Fi/D4wxmpFYXz2OUgwH0azyx
 0kmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcK9DGaeO0QyL4PXPkxeGJRcCKJRh2bTYQ54sqwK0gBsIaBD0gYcfefb5uPk4WRXyts5XNZ7MTNyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY9QRvM9daHbbMk99vC95AxOwDiZ6R/EGBnpzP/8QEPqQ7bvxu
 DkGKde+EFMxdNtW5jRLJnvPrSuyPCqWFJQnnLwk+bFdy0742HpUEWO7fL92AxiPrWTfrpTI5TlA
 ObCGMMV3PXSf9qgJpYIsJvMfpoN+iXc416KWCIx3p0hkdbah2avBoL8Sq9YdZvo+w9dc=
X-Gm-Gg: ASbGncsUbVOl4OuqzJgqoY7/AwsjY9qXtdpIm0D31g+4/32t7085GomNkO+7ZyOIWsT
 YxoPQp7NN9ibUGLtyakQrmJoIF+u0o7xJGOtrB2ErROmCHxTodmUoHx3L8CgfPX4cXicTaDpEec
 T02Jy5yAL0sP3S14hEo7xVlh1ecR0jCyFPnHxCuOBmbwfWa4u4nyALJgg+D2WPJvuCgKRbJTnhT
 RIBWMWeSTg0yU6SP0tBOweAb1VnZtgJ7yy9WLTpbpJn1WNJXjJcPeR+vpVWJBkkvcCBocTXOgsA
 6JhaZ2NLASzs8W34V7bOE4DHQj3GkGbHcThXkSUFn9z0cRfVOIsvpZu4/iZ9Gt1IFuM4JQv4k4Q
 =
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db6f7a5a65mr52467265ab.9.1747249532557; 
 Wed, 14 May 2025 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYTQv4QXSnMN9YVJaEI3JUAXQjoi8ESN5pboKgw0mTBEWnrDUyYQEekWZqNeBYQdzQK0Khw==
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3db6f7a5a65mr52466645ab.9.1747249532072; 
 Wed, 14 May 2025 12:05:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6bbesm2340443e87.154.2025.05.14.12.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:05:31 -0700 (PDT)
Date: Wed, 14 May 2025 22:05:29 +0300
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
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config database
Message-ID: <g654eiekiyqfjt65dtueowx4tqdg2tqs2xoik7xoun7dzz634f@ikftorfburay>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sTD0IdxqzVhqfe6rDmPgmLxWURRFUflV
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824e97d cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-GUID: sTD0IdxqzVhqfe6rDmPgmLxWURRFUflV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX7Wq25fbyoAFV
 lSUoQtl7S1iiwvtvOZkJbtZ7gN8hcY8M9NAgE/Cp9ARmEU1VhqlqwHDtClusDoANIITuLaa5LE/
 Ewixx2swfDLqxdZq0+bmV17tikqSpIh3RVUxpBG7KuowvqBCaH/iYCC0i7HRfxgSBSLarCRllNF
 xHo5ZqTjSWKuumJ+YIZA2aBSk7K3HqFsZJKtzBjICjl3pzRibNoFrrdkI5pHF2moGbmmCcVDGHn
 x5KIyWeEFIm/xUlBwEx2gMxcM9Gf2/enP15JKPQT0eACWbcNot4A3OEjVZKmN5l6+UtWtHAAEMS
 +zAft39Akfe5fJnl/cfP/JX58OTVPdanHD3M28ZFArLdW92MIkoQoewcGUrCnZjx+4w7oLZ1jGG
 DErVPEKcYoFMSmLhHztwpsu05D9YPFaboMKxu4hmhPqI8SF1QHWOf25gYNjmv27cg0IcDdca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
