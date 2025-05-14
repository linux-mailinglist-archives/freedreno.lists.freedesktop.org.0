Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B1AB7717
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 22:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D14410E723;
	Wed, 14 May 2025 20:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mltkatwe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853E810E723
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:32:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWJXm012652
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XxPdt9cqTUOBy/MQknWD34Qy
 9JQbrEE6AdpEjUZi4wY=; b=MltkatweJY4EspyZRwcEgq0QjsOCbL+hMj2X8lvL
 MC5913jkkE0xXE3F8a275nrpNqkgzGtEpJdaq6Jt8MORVO4Zu4SWCdiD+UDc17BS
 XQ1ZtgArq6YvvXWGq8eGhoAMIJLOUmeNvpB7LTmox9ImonGcb0iFBmr2PlNv4XJq
 GLEKwyYCJ/boTRjvcfHof9eP5DPN+Dwnxmd+BvX9YyyDUkJS9dO7PsEfvy0klB3Q
 z13BN8ZqM70TguWGi8JUDddvPtP9vDgORCiLNiHCir9MMaZao2VoCWlHUe29GqTJ
 8lgTQ7zAQhJYNcvcXtAifjbP3xt8sm4oJS+L93Rs0N4/4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym217-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:32:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caef20a528so37991085a.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254757; x=1747859557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxPdt9cqTUOBy/MQknWD34Qy9JQbrEE6AdpEjUZi4wY=;
 b=rqqT7/9izk6lYOMobcCv4H4nJHAYy9gOM/POY4wU7H8JtIHBs94HVQhO7Z4XiV3YAc
 n0I59ujD520TUUiOkhj3iekLD8P1eY1wyMB4bhwSShx/VVCwvwbzQxecFc2gwjc/DMpH
 f9CdEL/d3ToF3GUUaCrB3f/quu501ds+012nxLwDckbG9OXxY28oZa0DPzsz+9dQjTR1
 lB1t00qgEx0lBW+qrVkdEGH2wP9B/z0goLZ1gTz9sb3UzmXgZKP4h/35M121+rINPstE
 G4AY3cqYRV56qhT1HPQBVi3J38a7UYvblvBzGF9o4FEXRqtPE7QIktWSZiaQwXiDivYK
 sjDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMixiChSGLgi5RiMu0p/klHDZL3AmTlxiMQFDsdZkJOjC14MBS8jRIQbdmIigAAfA7/K6ba1Zcgs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG7vA1w5EaJDHDGcjf7524u6OJk+JXgR+kBrIKv1+PWMZ8iDl7
 cKeCELaeehJcnw8/D40knzEDTdP0E84+Bh72j5981c5SMO0g8p+6O01BNiBB6FPWR3jdnEr95/b
 m6vrJcoH4fYZKwxWlfxPDBPrCsrvIGDa9nOxt7psDbL6CymwYEoxi03Te0nnZzFhm6L+M0zXN7b
 k=
X-Gm-Gg: ASbGncsmdljZJnv5weMqoU1lKmvZ98gLSYMzZrHGktgFz2kKxlCGoTDpZcXDHY7ke/v
 1Bzj/aXrasA6wU/nqaRnSXHUZPUyrsC3uRbA/fjkzgUW/zdrsuorBoAuizcH90AvhTcsYkzbxp3
 EPwuDlhnB5ehPPHzzgPM80anipSKAGpIYpj2LyLKuujniZL2+8UdOrCRApob8QYAmOz2s8rHa8t
 k5m9eTVaQac8nHreplAjmD78O5TBGFP0fi8Sm0FwBwcPTNb07NVvxMZN+SW/Poa0BtifbTLT1+j
 brN/TQhBGsZjxJkNjG7GwZnXfM3UG9wQs1xdnbZllyIj1EVSfx2ZpuZpTICLFCyNt547ugYiAVU
 =
X-Received: by 2002:a05:620a:c52:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7cd2885cce8mr838424385a.47.1747254757376; 
 Wed, 14 May 2025 13:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjaViNcmlJtAKHvgfVZ3CjaBKnxNHVGmEtfw379yfKxDhn5w+VxEmOu10Ygw0Vu93zhM+Xg==
X-Received: by 2002:a05:622a:a0e:b0:494:78db:1e55 with SMTP id
 d75a77b69052e-494a32bade9mr1639071cf.11.1747254746920; 
 Wed, 14 May 2025 13:32:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c358ae30sm20781661fa.94.2025.05.14.13.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:32:26 -0700 (PDT)
Date: Wed, 14 May 2025 23:32:24 +0300
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
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
Message-ID: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: -xiBgsy0be4n8OA2b51cR6ueeSxEtD_f
X-Proofpoint-ORIG-GUID: -xiBgsy0be4n8OA2b51cR6ueeSxEtD_f
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824fde7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=YFUBf4FbcCgwuu9kWHgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX5LIRm8FIXLi8
 Xb1PWDAF8pywJDqPrBLhFFlEktdJSM07hysHl5tNqZHWNt478Q+AzZ2zra04pZmmVygOC0i9YSG
 pUZoaZ2O4+sH4/2F46ilDMbIripUn1n/NMTx2Z47sK8CWRHn+61f0Gh8Y2x5uf/bpqXpbV05mRs
 huW3TpAQWpAg1qCRD+bg9QSNYKFCDhHFO+PLDVTfCTSKag65yak0L6rn6C3Zr1l3e9zlAVyaQ7m
 uAjaiUayi2U9qoGl7EDXaeLUQadgd9AyJKIyDnpFQxMgcEswoRLvYAwczTz1MtlEVUc/ulC8jHZ
 z+WSd0rxk9gk8bbe4SXLAE4PfXDXtn48IWCi94gKEVjWSGOcZV5LFxad4dTEfakpgQduaUCcsu7
 M9SRPkNPKIto2Bwtw6B1juuF82eiHYQ42lytbe7r0DleHWyB+1cLSsTHkr1JYS/XyXNumMB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=878 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140189
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

On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On A663 (SA8775P) the value matches exactly.
> 
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
programming those). Should we fix all of them to use 6 by default? Or 7?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
