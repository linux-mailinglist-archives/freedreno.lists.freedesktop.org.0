Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71528B3FE73
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7210E68A;
	Tue,  2 Sep 2025 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0oklpbH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F289A10E686
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 11:51:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AG7Eq021618
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=; b=m0oklpbHMHSvAIv6
 e4GB3pxIvHi3cNzY7ndYtkhNsyPO2fsmSPj/2HU8XnmguTPeAGBz0LGdMkny3Mvw
 Wl+uT2fw4vhblBgRWHPQdKv4UPmKXgC5xd5mbe7i2B6NecSueo+GKCTfzJWnKiPF
 IDlgS+vt3VPOsTnqgSG+EmwnKBr0bm6lugIWPWAYDzZaunBPVo63b/2mf7Qxgeuy
 +8DOkuPzU8y3xf0ogyzPYXnEmt2TqdgnBbzhJ4x/8h4Qeg7o+zg65N2hrmx+lc8F
 dou2AbanwvWOL1mM7igQnDqnO/15dS9/fqmJqVy9p2RIFEL4yX4CAP9NW5eq+8GW
 fIzS9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7t8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 11:51:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-329ccb59ef6so1183840a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813862; x=1757418662;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=;
 b=xFJ8LmvLJhIEHyROgHf6c6n+V70qSWnvlDzltDqp7Ymw8ODhNU+QK0LwIdiVzwjPuh
 Vi5p5fOr5Tis6EmvA4fohr7tLIpXNfy/UF/WGZFqqcJauKfWPI+YX7BWFkEfiglUWsf3
 PT4zgHc/+UJZH9WQ2dM77/HP50rgTWWsOLOrhDqLOC2d3Sjmj+qAh5tR/X+GjbYqhpqp
 oDDK7OAOuVXMxoNEjSlSF6BCZqnfD31C5+xdgMC37w/gjfbELH6IuhZCXmtJYVwIZZkO
 rN/tn9sH+fAItRLX7yqahWLSiAKXUghKcbuF1C0Sq5TG1Tk+v3vs9JFceufaDmfV6InM
 54gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVs4rRhit0A/fftTakNb4uo7OYkt3YGvwFwyvnBI5mcVVbVrhSPgEe12fnAZCqz2eNXGPcpIhjBIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxz8SrNaTs2A+SS84ok+tQWKSatg483oPgmkO2Bf/7knYBHG1Z
 +GfXkfREbLyjs7vN23imAAu8oBTmrN1AfkcL6gSJuWaw/EnF2IAH828F/ssLK/UgkQs5H7M9rtO
 qKEX08CMqi/0/4swfmP0IfJ7E6sNk8glX1nDXIXSYNpKSyOeBWMY+y2XzL2RdZLarrZbptzA=
X-Gm-Gg: ASbGnctd4i4IjBx79lwc1pwvRlxzk1Wb8a1JILAgQSMZfUYIOoTuubJQF5NcpWc9HIh
 3tS0c+9XT7wHaJaDroQUzSfgmPa2RkmL44O0efhQbNc2QBGAVVLed5kZP6BfwdtTgBLNf0dT+38
 owlHO8/JNBl/FSh2xWKEBkeeipqgIFMzYjilWrrrtyxA8+Py6gqQMC2xvUwNF1FNTetp0N31feZ
 pxBadn0ogPLdl9Igz3K4RPjECia1nLseTDDANyT+mHtcWYhQ5zWtpKvoxoCfPq4OHbEoIn/9YwX
 9762s28K89LlXc5nQ/aDQw8kivKmqRvrmnTjmeOYgfgWIdvegY1QY3/aLOqxfjm0
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id
 98e67ed59e1d1-32815436034mr14083555a91.11.1756813861798; 
 Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoSouSKhDw/XMbQucJtw29inwJa9PXd0lM4uXnFSu8NXWhDmuE8ewb2G9NTAHJCIwa3AK6Vw==
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id
 98e67ed59e1d1-32815436034mr14083530a91.11.1756813861277; 
 Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:51:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:03 +0530
Subject: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u+jvzNK2e56X8NgPlWVyKgTqTb6j7//8GPSdT1wszhc=;
 b=h1wuLBfHfxcnM6zFAKgRxWdVDGgBm+1UEUHwJUPl+idhjvX3cN7t259RcLJnP/jnGewak+bBJ
 jWeTxOAo6mMC9ctIPcO0kjFFpFYt5i3C+xqg+hvMMdgsFtncKo35DtR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: PF8qMnIXuKS1SWCsCyvpKFpRiMly9Zl2
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6da27 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7jaC3Q-7aBCS2g4HU_oA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: PF8qMnIXuKS1SWCsCyvpKFpRiMly9Zl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX14YfUseElq75
 +fefnDfRhwZea6N4EJqhLP/3DxiQR5DHA1AytHGPGZ/umGqP6RtzBUlrc7g6zT3coXOg2hi8caD
 BIziMSddBlcw9iQVatSLS7I2Mu+CA3EX6bULqjVIhnNwEXYyyfGqQ+OW1yECUeAYBG2RdM4z+As
 e7tFdT7H+Cx0eSZ5h0seemtaNB1gEOasOyIRDtnCX3gTx7SfO9nVpXDL1LdUjloVgDDTS0Qutsb
 8WkzDdngJpQyFZIGHeYjafY8Qi/1H5C1gBXkMajLa+ctNscKrmmhGr6baYLowfPeXPwFwvH/Lxz
 68/JhwozcEJR9UluavOpS2Vv73wMizULKaRV+4bnjtnxCu85I342E9s+qyAk/B/djLggcVRG5l9
 GugQcM/N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

It is not obvious why we can skip error checking of
dev_pm_opp_find_freq_exact() API. Add a comment explaining it.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 		u32 val;
 
 		freq = gmu->gpu_freqs[i];
+		/* This is unlikely to fail because we are passing back a known freq */
 		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
 		np = dev_pm_opp_get_of_node(opp);
 

-- 
2.50.1

