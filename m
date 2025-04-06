Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22446A7D038
	for <lists+freedreno@lfdr.de>; Sun,  6 Apr 2025 22:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25310E0F4;
	Sun,  6 Apr 2025 20:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jme3Wz73";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915CB10E11B
 for <freedreno@lists.freedesktop.org>; Sun,  6 Apr 2025 20:26:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536Ax5eM032040
 for <freedreno@lists.freedesktop.org>; Sun, 6 Apr 2025 20:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UjGwNH6c05e2ZJVyDxHhI0Wz
 SpJhkNhQNLiWVKWtit4=; b=jme3Wz73pGBnVPz9xxvf3BndomAwtGrT41KUZrFn
 a/bY0uXX2DhhFLvBbxjV09Xx50nfeSq5YZW1IwlYe5S3nAdnflBvInjMY18BZact
 9iNjktSyC5TeSb9FnGJxv3RrP9nRsRl85+DkAIcjoqOEow0v0La7aO+iNyTLo7eF
 j49cLVexYSYSLTawBzvd4YCTsYYtjsIffF8iHe6ze0tSufkwsVeC6eHyP3l7pTCy
 b49giFZM72EY6krXk1OBSp2Vcao1GU7q+yEpPE2nmI5ZR0t7zV0I/iyCjUbbGMzv
 HkG3goKEvBYXV38HXCLnjJ4SYDxdhFfkDQ0K+kPNZX9EUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe2aah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 20:26:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so1147802685a.3
 for <freedreno@lists.freedesktop.org>; Sun, 06 Apr 2025 13:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743971187; x=1744575987;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjGwNH6c05e2ZJVyDxHhI0WzSpJhkNhQNLiWVKWtit4=;
 b=E5/KD+0Rp+Yj+HCq+iwXdtu7EqYH13cupdHEUDHDGHl1TTi1pihf+2jDKuGMfhBd6Y
 3KeQFg4n/ojXmY9i+yogs43V7ZRyvQQrB35YH7fpb2sy67OAlA5jH2g5rpc+X8QVB+r0
 VwfCyoQJgp3Y6poO66ers+3r1KLUdrKZmll2HEhvPqg0jh1/smHuWDLPi8uB194UxioZ
 +HlPisLR2PlYWj5h3lX1rQGR15cb4DQbtnueECV9q5jzxzVeJrdM5in9kMyh3e5Vklw8
 nWMq6yxK8HaSeKpRycQbABMZmjtmQOsbAZvWgT+USZc9LYz3wN16YwLQP8upJGj25A1/
 iYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV3OTUcgWSwkWH18aZSgU2JdxAoOmUDgSICwW/D3kwzA23oqCjlLQhchDYlb7HVZDiZcRqIjUjFDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU9Noa7aMTMx5mxDRb6LVyJjYSN+LW+RVvI2WrJIXVedzN1Eld
 tFsxQDqREh4zndkHKrKv8C05vDld2W3Gyvq2GCyFi4I86vkzpWEFP2NAomzcIrE6HONZ4XZ6nni
 tzi1IwdXZB3MnBUsk5fgnmwGWJSoEw4HWvhduL+NDcFm3sLIyW27uIFagSFkaCzdLazE=
X-Gm-Gg: ASbGncsfFVZUSyxKBBuFafk+IqzsjbKHwvdlgspE6Cgo4heVOQmkEZjK4rgFeE4ZnQk
 FcCV1dbqAUJTL6fPsUQZpedACSXJYMfNe6cSoA9fERgPQSz1cluPJKk/aFYdeXb2t1jiE4ZA5li
 LNv4CvGQY9IR0Y3/OHHUYu5aGmENkGE0cj0ccpJvjdTkTx6CU72QLV9RGwss+wJknB6DGpqCDWr
 KEd2FfaELqn5A+rk8O2lAuOtq3gtBwxbZVdfX9GKFvddkb1Z5xMyywuTol6SZRXqtl43+0CRs3B
 mGpPpl9GjGKnl0lm4YR4C1Oav5AEMH3K+zq2kpuf9j0w9A5IZZvU34ZcfWOor240eQgeQD7h0v8
 BJuQ=
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id
 af79cd13be357-7c774d2cb64mr1319174685a.15.1743971187518; 
 Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOUC8/sge2Zws3JbtbtlXIqzr1w+PRoazsYS05/FRkX06ItoCneX0X4IELGp4ykgdikcb+3w==
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id
 af79cd13be357-7c774d2cb64mr1319170885a.15.1743971187219; 
 Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e671b8csm1078793e87.223.2025.04.06.13.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:26:24 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:26:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <srobukvnruqkgwbtfeoc4aiam2zw7j4oe2eyoqd24fn54m7s7v@v4roslimt7gn>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-9-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-9-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: VQIZ3wIDXXUX7730LsyQlaqr2hNbqQIT
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f2e374 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=dfltxrk8hYN0BGuGiOAA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VQIZ3wIDXXUX7730LsyQlaqr2hNbqQIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=656 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149
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

On Fri, Apr 04, 2025 at 05:25:37PM +0530, Ayushi Makhija wrote:
> When device enters the suspend state, it prevents
> HPD interrupts from occurring. To address this,
> add an additional PM runtime vote in hpd_enable().
> This vote is removed in hpd_disable().

Please re-wrap the commit message according to the recommendations. With
that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

-- 
With best wishes
Dmitry
