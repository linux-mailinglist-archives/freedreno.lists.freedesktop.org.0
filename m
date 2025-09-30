Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46EBAB8E2
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1963710E4FE;
	Tue, 30 Sep 2025 05:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8t1+gf7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39C410E4FF
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hlww009634
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=; b=F8t1+gf7Zqt6bPeW
 PUh6Z+R8qhw+F3Q6PJBiM1Qzqep492fR6RUsliAjvRSTe2p+DT8EWB4o8IoUfzbX
 ELfcAiG/BIPjRER4lCiiKrn/rvZ5PYhRIhGQZNuLn8R91AcP/cXyGNIgeWNE8dxs
 25tjE7KxvLzfYqxDxtzqOSXShqJx7BFYjQInpIVuDGGdhZoqAf162rHR6fwmzV2N
 tRj7yN6UnO2QXjePepPK4jqNlDisGllvcohoCyJlxYc2YOgHZBmJt6ZQtmItK/vi
 3/CghC8gwf4n209TuaIhRLcy5fBu6e0jYVSxDHpwXQGnoZwZoPnPNhLyTAC6FRht
 WInjUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qj63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3352a336ee1so8480844a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211509; x=1759816309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGAhTN0/MK7tzTuxs8B6KT3k8TvrrLVML7xGTqGXHy4=;
 b=BA6eUCyU9uKd5ayfgNRaaSgUOXUekCAYyDIgWGztwty6VdSsUdFtdcwN6x9CYWWWWa
 cj1XOJTAT3g5TyHUvjY8FVOmxbKTLM1POOmWrROw4SZgcMd8zwNNRendBEgUeo+ROX8i
 TXikjZl0jIXcYwaEUg0hLCpBUANop8U/bgW2iHZg1E3PXY781gsdvE2RS6N8czJGDLQg
 8PfbrE29n+rQXmVOPBr34oV8zBx3XQQmKs5fPgCdMnEbZ98qrZjhZ8ZmzgL08krMx3AE
 SfZ8pWFd2O7e+HYeesMtqjxSCznJifmecdInApx/i/MYlN+LrQBMIlANEEQI3iN+k5aA
 fAVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbryaRJLXjNWdaaoWf60SkzhlTzC+7Qr/VVNp+ENz3P8MyZxeL/LvCCCesztJliBm1yfcwUikyoXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/HX79ESaRd2LAST2MHWHqDwASfmCwclKi+YL1A0jIQB9J3iNe
 3TMdcQ4gupIPYDBc9tF3XlK59r0NYo3IX00rChk6mEGw1U1VY5kVZYWaCuLzy+xl7iN4xqIlVBt
 tvZZLCx7NsHVJNkwVf0lxLAWEP2hcEx632ERI0UIyGYwJNFmEc9sYcNlqkZEvV9iQu0hHdas=
X-Gm-Gg: ASbGnctUCW/tR/uQ9WsPLakut2TQ1u6y/tYH7dQPvSl1cWJdfoT4SpFp1cidQHM6vht
 Qj9NTxij4Nxi2vEH+jk34r7xfYIx/OyYL8nkRCokbEkHngj99oSC58IC2zsrhOusFNo1GZYNWfE
 MAdX3g55nQkVF2hsryqzrAFoi3JbTiAlnJajNGxY4VS3okaW95GXQgWTsL0bgCkam+xIp4OgUvW
 SRrTypl+xjnpJj2qyYEYhmxvmHSzPtsYV/Ay4uMS/imsa1zXhnwTRZhUr93IUVzVr0BSX5p3UEo
 UNOk3kblZL1Uc98Rzi/Tg06+ydF52AjQKVbmPtCqHOG+n2792n07ZRT53UWinfqCWltmKg==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id
 98e67ed59e1d1-3342a2e3881mr19323738a91.34.1759211509378; 
 Mon, 29 Sep 2025 22:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHqe3cLZLc7xLZaXETZkTNHqotOqlcLKXPv0OIyQKyD1TA/j/7y3gfQe0rZdWjF2vIUaLsA==
X-Received: by 2002:a17:90b:3147:b0:32e:7bbc:bf13 with SMTP id
 98e67ed59e1d1-3342a2e3881mr19323711a91.34.1759211508854; 
 Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:21 +0530
Subject: [PATCH 16/17] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=opy6bEwniR0m7S+4M/eY23ORBb6vxUsSguJ3ntFDLtY=;
 b=xkyLJDhvdjtv5zH0t4R2/Ltq7yscuVczpTRjglKxHmFMzhfzxDbXmuA1k/vXF8VuGXusE56aM
 ze5RwHw81B/DIw0VoSyDnGDCDBLO1lvaar1+Yi9NLQ4Wmw4MLZC2JXb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: glWmgFck5VjVMZOcJK5Zoj6BEvrPJRcX
X-Proofpoint-ORIG-GUID: glWmgFck5VjVMZOcJK5Zoj6BEvrPJRcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX8ZjJP2uxle1C
 A9/FuWU0YUfX7ou4Dz7vjH4WMKq2QFQvqAtn44gUlPZ2Lwe1yoLFaTSpNJ/nYgRggFuwx7ilEFk
 rcSVzsfh32ElP5KRjT3WejMRRJi+RxwbrToe6y77iFOzBMIACFNjtiRzUNDjpXZilM2XjqlmvmK
 V94mOfInw+HCceYiCXRQ6nIwRlnvRg+5YUe5KUB9bp3OiP+/p5ZOgh3Tkha7eduFnPQ32WTG0uE
 m88e8ymJGUm9c96TqWe5SA1Jr1aLX8tFLx/B17T3kwlvh9eE8+LE2SxHwi12cKRU6vkaJQpiu/V
 Lv/esPOqrORCjfjvKNxICCxA+EDHkSd9LD8mrBr7BUvfAbS/fWsS+Sag59Ez9Wn0vc6HEt4egrL
 x+qBohMHVZc4Y2g3drX/XD797BumUA==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db6ff6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

Update the devicetree bindings to support the gpu smmu present in
the Kaanapali chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..4c68e2f2c6d776d18a2a306ad67718ef7396426a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -88,6 +88,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500

-- 
2.51.0

