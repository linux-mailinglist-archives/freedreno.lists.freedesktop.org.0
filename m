Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE6ABAEF6
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68210E1D8;
	Sun, 18 May 2025 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWys5Eu5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1709A10E1D8
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5KYdj022138
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hNr/pl/r9ZOYN8rShfMawc0k
 SnbkC2SMTXuLQZV6004=; b=aWys5Eu5LT+nYM7eRo+y2omkFE0d3tlWSCZ29Qbm
 Nijh+w7OKH158G7LqzSkKiOYszi1vj9q2L2sWnqwbtvSrOYW/tgxesky4aYSSSOj
 PxV4tjtWY+HXZhXq9CmnTAdPfbLd28henkQoeAV9O2Q8bxmuezID0n6ZKzy9orMs
 cQ5TIIitDYHB/qMjpD06fdKMis69NbPShjjMbELInU5NfRXO46B0Y6FHclU8ynGl
 iY9AZJ/bG4F+kYSvZ3UqZZb6Gas1/iZ3GxEux/GA9p1b8VnsGLyhrQzZSU2uv6gz
 W00AltwOwD+VI9snqFRk1DTqGybC6tY3d6+sTs/LOPuucQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9q1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:24:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so4116146d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560294; x=1748165094;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNr/pl/r9ZOYN8rShfMawc0kSnbkC2SMTXuLQZV6004=;
 b=hmpT46anl0ejZJ2JAkyj3naT7BINIwcev5Uz1oWGSIFERSyjLW00Xo3LB6ubRXXa7Z
 rLIRJ2A5xrR6hYAfy/09Ntm9fxGNK0smPq1AcLyu6izFV+g2uLfF9yc5RTq0xXuVh/Dm
 xtNM12iabzXwmTmCXSrlQFmfwPmH27XMssnmLM2cCkImDaC9EzLQ9235tW46rgYxvYV1
 dpPih4MLb3xd+isE7ABugikFCMko6VQQT4+bwnHSlnvVm48uWgV5dvhAIpQIHBsffpoK
 XiUsm9bS7C1RjcyASHLsMYt8XG0EEU94YZHMcOXxfUmILiCxolOwhrIYv7yW6JVflZzs
 9s7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMF10TjSBd1LQ/vHoFPzzTSBDEHcUtZQ1kHmu/KUfMyHR0sIoJjzRVtL6VFkJCMgLvRu+SA+K1RHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9/Pl0feTX8QyOLcUfrqQAaoFVpaTIznUeMd3B1B8zxdF/vJZz
 5m9AHAuML86NyQWvTPpWE3SAU3h3HYMG9AsNiDm1RpThPnq03ijWg9SOzvilXqWQ6vvbephP80n
 h6BdqDgMYicgjXuQwMV5GO9pzRCxWBjvJbyfXT5tR5EJq8su/ZfKH7DS0OoNXFgsqKKVk2yE=
X-Gm-Gg: ASbGncsVlT86rwSUclWh1izQWUYcoKViJCU5Tgmw7wkoiPbG+PxHk/ehvlkmuT4U2ZQ
 rRAAoBH6HHkOsqO7riXapIAI0H86zC+FNxZm9Zl08BEgQSUknhYK7pINaxUV/Jqb0uje4c8FaLc
 Q+dgG0jkl0hhtRUdK/bE1hEfCSm5THItPlgPPkCfGdzK2Xk5NV2bCJaJIO+LjY9kV/JXOXE6Hkw
 csnTDyp0cL3mTJCWRyhKRfUgjm23TN7QCr+Nq0HmAsUa8LcHPNHOauTFawLewhoVH9XEye7Xkrh
 VkWQtSOJN+f77A7Pkxs3TEIm3JBmXvCis0DuVfm5/JLtnE4iDYcgLYw5wz4pm0RbzZVp7XSEHvw
 =
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f8b08fcfc3mr175740256d6.34.1747560294205; 
 Sun, 18 May 2025 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBE8AEDRXC7fGaZuy3S3AMRf4t761oNWgvl9lJpRdtkIjuyHJ4BLR1QQmRYmnMD9O4Vus+kw==
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f8b08fcfc3mr175740056d6.34.1747560293854; 
 Sun, 18 May 2025 02:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f097bsm13953151fa.110.2025.05.18.02.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:53 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:51 +0300
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
Subject: Re: [PATCH RFT v3 06/14] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <gtmbpj26nsidusqg23a6zghahotwws47ghsq2vneikpvd4b2qh@uihmkxl7nfkg>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfXw/Ke9I0vHGbd
 sLN96iBnBu09I6d40eNfbS7zMhGybtm7MhUMkmuyCt0aXCwEw+ORkxoFQsgXQy+jLG/TBABnAeK
 KvLeFgPJ/ZtBvIDC2WnhJUK+TF0n+P7ErO11iCeb3Um4UCBZ0wBH5QhjisBZy+PcuASNtssGFtQ
 8sYIaQyqp09q/TbFTkJJE90uGUvAYjx7se4u7pWIlNzM8fLWCpbc0OczTXY0nEQvMhGjDux6jRy
 /xLYCfX+XHFTK4xh2BhiwFyeDfV7FvpTWH4wSS8sSKcwtbepFjrXocROFj82IETASJ9t0pR6Deg
 arpSw63N3mfcj4drG9wAlEK4fH82cuHpVh98vGiBacOB17xslXwvwdmDiGXONApBtayRi1Nkmtb
 55iABsI8V/JCXP5hkvFyv3IjuSrBEeuEY7iwDNV2BQ+ZEDjtOgXyX6ZKDmOB6roIqmeG49dm
X-Proofpoint-ORIG-GUID: IFY52X1hZtIfjhipL2n-gv0fhP_D8Wx6
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829a767 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nx35QXo8bFDwqsARtNcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IFY52X1hZtIfjhipL2n-gv0fhP_D8Wx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=889 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180088
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

On Sat, May 17, 2025 at 07:32:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
