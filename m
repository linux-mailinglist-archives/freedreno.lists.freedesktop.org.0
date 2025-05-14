Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38880AB758A
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118AE10E6F2;
	Wed, 14 May 2025 19:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D04WyHYH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AC110E6F2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuqW5012692
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=toamc2daXxgjaeXdZ8/hVu4d
 twjcBOGn9eztJcSpD8s=; b=D04WyHYH6rOt2gr9pdDx2ne+EyzhnnIrz2RhMmNR
 HWgLozm4McqxnMD+QFxHQmyCmrsa72oMwPPd7FBSluNW2fbYpsHanPNE1eEEdfmS
 dWWIpM4fnGewdI1lwwylUJ6rIVjJSIu8qu/ZoALlu7bT82UqS2SK64AMgqXu0aje
 lcj6rQnpuq5tK/4LDaBhYkQ1g27iX3yvifSV+SMq73d3ci7qWrklmybHCB9XGZrG
 AqrS0GlTl7PGr7+QGLbkNtLupZFiXkGw9LPkoPLu6j2z8Ow6wLxSS8KRHwR30MSe
 4Hgngi0vpQVHG7PCB2zL1X276gCzSZC6S44q+FQyWV9IWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcykvm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7cabd21579eso12318685a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250128; x=1747854928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toamc2daXxgjaeXdZ8/hVu4dtwjcBOGn9eztJcSpD8s=;
 b=WGmL92V6pUWWpwzUVtTBKH8mTLVPtLvb6FlwGD24wlnfX+AX1gOUt9ti3G/UYBIsl7
 SpJ+UBS0oMH5iahDVtaLzgJR4AewDH7uSxRNGmucevuwFBkLUcgdQRVi4OfjsvoEKuqc
 mtqcykrOEggaRSwL0Nn1YHU4HUyHbcm/fMfYfWt/M7Zvg9dAqXMgqXWzUoBTO/aUErDo
 xMl9qTxWL1OfBL3pt1kGcD/byd/Bbbe5Ks5vr6Fal5sTPUncPoBuXLyAguOlhCrqzIdC
 tKstdo75rwRjTdBUs/sIWXfwGKDKfdzOTwcvw3Yd9MYePcHPxnaP3VyLiRk5Xj8WdV1w
 k42g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ/cVt42Fpq6gHcrLmVnQQ7Arz6EhBAZ7/mDOwEoZk3RGqlw3toV1cnfo5Z5t7hm2ZGkjnMlM34G4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkukK9RjcLo03deUJfdxy94/79Qgu+/pfeRjcXLtSnQ22zgznf
 jWJHwejvJvAMs7HPT3u71qbqGOUqXWur0dhUqSjt/5roLNFGfLIgPTcexG41iH+6WnwwGHr4Fex
 QfFtgqhoDpf8H1pvZLO9LTZ1uefhamvD7YOtoOQkap3oMVxU5coL3as+mLMsjyCK2lNc=
X-Gm-Gg: ASbGnctmgTMNEy+zvFV3BYN5ioPZXjWwR5dX0V8zoI247E6Xz/F0N9d5LqI/XLdFSwn
 ESkXmxxUackwYBq3p0mebTz6KpV6HJtdhvXmYpDNq7ey/BpBWZwChQ0LxEc/h8hhOgHh3Z/fohz
 Z/ZAKe8RDE+sPvNoplysUJUDRpTUBmwiSwhuToeha/aVkE8frNp+Bp3SBN5kxchvUaeFubYckBL
 DZquqReOm2bySQhHPi5x0jkSpYMgErCxD2fxV/Nel6I7keN+1WpAdMced+W5779dlxahQrpdAbF
 nsPLwmkK5w4JQ0lTg/TcDe9RATz8A1LR4G7llCHhnjtULN+RacI32T3e0+KX915UiRUk/7KXFeQ
 =
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id
 af79cd13be357-7cd288557b9mr577861785a.35.1747250127865; 
 Wed, 14 May 2025 12:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAmx0iWZKMm9tkE65sUZ+0KOPm2/eiRcewpi4kWrjcOrS5/n92vEonleB4k+OU4sB6qDStmg==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id
 af79cd13be357-7cd288557b9mr577857285a.35.1747250127440; 
 Wed, 14 May 2025 12:15:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33b7c1bsm20552461fa.35.2025.05.14.12.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:15:26 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:25 +0300
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
Subject: Re: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <vnjkfbxyfpeb5nbu6nnasdcbkiviefi7hu7qtpthz4uu6zwnnc@2u6e5j22ozvx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: atkzi7m85gzHZKFWYLkLCCvpfiurnSLw
X-Proofpoint-ORIG-GUID: atkzi7m85gzHZKFWYLkLCCvpfiurnSLw
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824ebd1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0v1qzFne9LvPmFAOVWMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX7pwlWlVQXAMD
 +cUWBHgFMtalCo7rpK5lL7IDtRDtsJXEbpFuclcYERUGXY4wHHvr5cATSO5s6NkjBI+0+wukSzZ
 9Zfew7stdc/bDAChl6P8Mjf6hEayjLYYymtclHYQ598p3X0c1I7PXKYNQthu7HNOboK5FmE3wxT
 eVBMjzP51UCd+5AtgSd8wPJHooyAa4KyaxU42f9TDLLK6iZ1Q47KjnKQRCjIdE4r4q6B5NweUWN
 sZytearKyzYSzt7vYUT5lbEfDzXZMGhelVrh8txeV6WdpOlNsneI2MrvvoUD3+Bcpb8xgfM3IXS
 sAhstTAACClqOIG15KDLTaAFA9q0XQMjPeM1W49zzCYJR4uLIlLaf/pJ8R4v6pYNekdJhHDGq1o
 FNNW5XP/hsGuLDJu+UbYESvdUA54DuO+yz5Zm0ofkkxEUJZkHZabmTVO0CUeahZD2C89PWiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=758 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
