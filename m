Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E168CB41632
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 09:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6207A10E1FB;
	Wed,  3 Sep 2025 07:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lr0n2wkN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E7510E1FB
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 07:20:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832x62r010139
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 07:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v+6e4xOzVaoqWdl3BPy6JebZPRvDVcagEgOuEn4A348=; b=Lr0n2wkNLANQ2zog
 JDSEYgYJjxeLku0RcngqH875j0lKKfXd/jD1QONj8y4IzuzG6nUlhI98aMkhjsG2
 QSSs6d6xdCjvHz8U0pJ7VcwZfsVoapOP86jm5OrtSA6u3r1WBLaV4fzAHirAuFeM
 +dQZ/uYgBb1G/+g1AWmjOqlF19FJF0EsLp/t/X0xc6+T/V+Y8f5Su2ngHOrv8n72
 A3hhq+o7bF0nEP39iIBvsYQjo0OLOzRxjlBcrQuof/Y6cxm9sGC08+uHWRd0qMQK
 /VRUYPcm43A0c75mckeQ8A5bjVEQZw1XwkpyA3GkZB1v90tYeIK53SVx7NmxWdTM
 +a32zQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ejqmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 07:20:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77250d676b0so816135b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 00:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756884024; x=1757488824;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+6e4xOzVaoqWdl3BPy6JebZPRvDVcagEgOuEn4A348=;
 b=UEDQuxnD+Hty0taarq5jGV6Zkppv2i3Qa5jWuUnkVrgawZrqe675Cz/MsA392oZTuG
 lTp8haugDvRF4XMelemqyK1VsXJmK3X2IP699G27Bhj+WuVCw1l8MwsWTYPxOOiSfidl
 YUkyuJdTNdP+83AyKphJhsg52ak+qgIUBqx5uGI+g8ZbqLuzoEDgd++c7hAndIltdCvI
 A7QUfejPF0sSQ8zcczBQO51k51wLa+8oV/Ty13BXlBJIFc2/jFOrC34D/rd1w9yF/Xxr
 PczX0MUDU5QGN6VQZ2urTY0QqxeY1H7JzEWCt8F7Z3hKlV/VMkaiGaskHH5+tcaB2y8e
 pahA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRn9hx4UJOTAhcQdVrsbZTF0gDR1T+scBqJR45bZLkQ6VkC1jBkN6EwrMiJ0Ltgj/frfY57nt5rKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo/F2Ra+/04vYGEf0RCOqw1HckOJDHcdTOquUkUxHyLkPjbeTX
 qBVD8asX1edAont/5rDfPIrKW2iFVxhuthTTB/5ycVLs8x7A4PhrH3iiq/met1Yy1XSmWFqDgGP
 wvhWrhSl/J3IADJwAUpcRETxcZ0dinFbIo9tspHw354dkbnJ2WG9YjsSMO/0x81NWtlpDtjk=
X-Gm-Gg: ASbGncvpGHh5gJn72UHo5oFgvzjeBrxbXvrSco2TaJkZw+3XHj2ZcccWTxK0YjGv5q5
 C9QNfgCsaX8+C7dyT+D7sKlIVd0BQjbyAxm49UbqEZChh32EvzIt5C0w3UO1DKlygvv7Q1D2ixX
 aFu5wsnTlWlQibib7s2BDrXvuahcHzf/PWjwjkppZmq3w9N7ab8qjai+sEzQlJzOFjYs+5a9R21
 bXUyRe7WlQASJtYNPfPsVeVYIU4C5modDzeWjDHMdNkNhN7VXpj0NMbZz8PZlqxuIeJG/1PFtoZ
 xOGl7BAThXqFGQoa9DVMGi25+fx7AlbCrn41xeCg99LwbWmenbOdY5n4rjl6T2kk
X-Received: by 2002:a05:6a00:4655:b0:772:2bcc:d2d7 with SMTP id
 d2e1a72fcca58-7723c3e5048mr17242859b3a.2.1756884023728; 
 Wed, 03 Sep 2025 00:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kWes+kmSKDdJMo8iXbuniL1stlElvJ8Rvpw/70/MrVB+qiWNE+9keUsOzaohXoVM9Up5LA==
X-Received: by 2002:a05:6a00:4655:b0:772:2bcc:d2d7 with SMTP id
 d2e1a72fcca58-7723c3e5048mr17242816b3a.2.1756884023248; 
 Wed, 03 Sep 2025 00:20:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 00:20:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:53 +0530
Subject: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for A623 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=774;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ql+8P5N7vQ3lwxnd+dbI8nX/wXVxC6V30jvlih6vQVM=;
 b=NQb5LD9y8LqyoVpq4tTw0yWHyAzdvABXKjSiYBepXTEqnf0bpAT7UGb6tTfoIaZqNelb396kj
 9NNDud/mxA+DwrOF1cbuOIM/q7b3JBgvu+6Q4M4IsCsxNlpogf4+wfH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: FXRI2XNcBYswofvi68Pkkv5cl0B7tu8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX8H+xnUgS0wmG
 j57S/Y89gPtblfnmb2ruurDgV7iNlo7EMVuYhlMXMRHXy65ci7WnM2u8V3Gc1VOEXdLs/Vvko0z
 fUl/UIgmJeuA3fcHFSlL5Txoa6ZLWyNwat9UOCarZC6SH//ttUy8n86L6h5fCk+WXfIj3F/WMyh
 gPlG1FlMZZP1i9IVOb1tTNLesYsPw/jJfbAPRe0yzXAM9nZymR0KFAptZ35U2PFZT0zVZbbguPb
 sA23w1pkRbku4MteEBK2znhLMO4xT0oBhDx2Tftrg+EU810R8wSSqN5cN58xBspUZ+bihGi8kbF
 rVxI+zR2gRqhwjAdp01rA5COImZUFLIhQabIZA9dEJSnXkra1q9TbZpXW65lYznqjNfcjfYOzah
 8aCchP0+
X-Proofpoint-ORIG-GUID: FXRI2XNcBYswofvi68Pkkv5cl0B7tu8a
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b7ec38 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=kzp3Ga1VzSMNCBmXpT0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

Add the speedbin mappings for Adreno 623 GPU.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..6a793cc666d0b53e6869c2b82c65322f92e2486d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -913,6 +913,11 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 185, 0 },
+			{ 127, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,

-- 
2.50.1

