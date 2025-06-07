Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34840AD1287
	for <lists+freedreno@lfdr.de>; Sun,  8 Jun 2025 16:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BDE10E077;
	Sun,  8 Jun 2025 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/bvI6Xi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4760C10E3CF
 for <freedreno@lists.freedesktop.org>; Sat,  7 Jun 2025 14:15:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55743mTN009958
 for <freedreno@lists.freedesktop.org>; Sat, 7 Jun 2025 14:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=; b=B/bvI6XiIRUGJm8E
 1KEoSC5e66CpGY+6d174bfC1hO/7oWyqxPk/cxVwAwwABoC/vIa9ZqPFvHUXSylU
 kp7W4Crwn8eC5JuMvMo5nzZsz/bwE/cqy9Ql/lBk1STFjLpSnVeneg91RfUigKEU
 qFfFfNSmTNkDFlj3pYMSSdByz4ciL3dDDj0aM3p0zL0fobgcAhW33E75NqPhz+Nj
 7vBZdl3cEkUTdW9YzvnJOUq8Xni08WDXJdOXaDzgbNy7S4wnu0alPB5wmo4yxVFf
 udTXlcHGeAxfTzQv/1IiLiF9hBDiYIUkTnj+QZoG0K9SHnCU8EtaFfaiPQh1K+HR
 el/T0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j0uu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 14:15:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311d670ad35so2828163a91.3
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 07:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749305756; x=1749910556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RoPAj24rANcl5QX1l3xvSVHABOET41gWukC6+LZv+Rk=;
 b=cJAVpb3CuFDuKz/vUowAbMq4YPE3ALDVjtSDNsjhhD3Gw1JCRaoVJoJ4oXa/PIvemK
 s89LwonWKP9KcVvINKcvZ2m96gwwkFDC+POeF9Luz3PfyB9YZFdePqVg3ilXe5JZXNco
 JExnZR8jP/8iQ5OU9KOdeksNzV+LpOe5D5+wletFnAhGF/L4KWk8QK4U61pdnSd13iTd
 ISb9fHZEOtb17/O4z7KyVIZzKJ57LmH6goQEZ/CTPRD9YlkuqSLS7pjE0idVyKxV5/Wi
 RiDsIyIBZxyndcO3rpGTh/gqkNJrqs84s/LBpKzXMHPBtTdcUlS9dS96LFFdxOeLN/wu
 iE8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWszZgRb+e+5ODYctEvaUPjo/95gjE5hNqJoGYr4hGe+Ai1GnhbNVz8wZoGETRgnBoa2i7iIC4yNrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj3+/7GuQijk1ppWhDr7z9O6AuZlPkryMI1CauiEUtVrt1dfPq
 zLybv5hDjMIPkZ6Q4YmDRcjfIo+R0vrK/Egr6bbWv2bEeW3MU7LwRoTilStBWLQupob3cwwiezU
 181VepEATWNDjab6/9pcHLKAWDE6XEmc5Ay7bDXpHsRXpqmdgnG16Yosm1so2Yo7e7ykOAYE=
X-Gm-Gg: ASbGncuzaFcXkF4oJJcD1IFQJwyov7tlVJjibOnzPo7DFimv0RCeLkMH0TBEEIyrPph
 E7RcqvwzaHioFPm5DwEM17Dxi5Dx+wKoIQABW48PxPS7OsBnn+4gp2reO3GEOwQNt8jY025tiRn
 89DBeeyu5UvtsimIjV7EV07As+lFunyV92/CUH/7dzkiZh99Jtl3UdvHbrYCU9ANyhy2AXsTzpx
 Uiz1NjFEJcBWzh3YiPg0xYeJorUZTs3s8vwh66z29RJg43r4WsCjU6Zmw9DNt358KXlqtjw+02f
 9ljC4g9uXuq5DRFEBalJsSi8eqegvbAB
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id
 98e67ed59e1d1-3134740ab57mr10429759a91.15.1749305755815; 
 Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvgNxf4i7eaFV8gciSY1TEWEqZHtGfJkioV1I3JEgDycgT9Fb002tmr5zfEQLdgdl6qQZiQ==
X-Received: by 2002:a17:90b:3506:b0:311:f2bd:dc23 with SMTP id
 98e67ed59e1d1-3134740ab57mr10429661a91.15.1749305755008; 
 Sat, 07 Jun 2025 07:15:55 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 07:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:00 +0530
Subject: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oPf1vrGDHAcwS0lnY7K2yLQPMKwWkbyxLNEz+EtlmqQ=;
 b=Rtb+J/Uc9KqX4zEqOybb0NgOAX9BBtfxOnJaOBVeaq7UwfCOezjPAEZDGKLncFvUa2/eVR+KO
 IxqmpR9hO/1CczmdmW9aD4svEJuZXtzcb7Jc/JC3rqY8bAM0iYniba4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfX/qbprpKYrxTc
 BtjnMHS37FJrpT+xuqiQEYdwbJomKvYAJUR1vUZjZXeeEzBaLGFxi/Np7NYJmAyy3uTgm08Jchs
 DRW95/5P1GeJVBqHfe9bW4lLVfosa1GK/klDJpvxW2SeyeT6v+frr3Iak2948XkB1ZCqk+A6NfQ
 rxhmPlfMCZixD57O3BjZERS2qTEBabdWUkjrV0wrt+wH3WAaGDYKxADh/H1TBVSDPq040d+gjJV
 +YsaBK+zp+uCZtrzzxSCOY0IeQtyPuxIpHba1Zg+q2H/id2H2pyb+4roHiPZYZR/hKeSmyTD3ns
 4AfNkHm4MEhLWZm+cU+JkyBsp6oFGsR+sXToJEhnZ6xbj+VJGiduvARe+8+FwAHHla6sFrLzJNx
 SH24nLPWTX8uha/ObZZFVyn27RV494XloL973zXDMUBL5DoWCAnN1zqK612mFkY39ZfkrENa
X-Proofpoint-GUID: Vx4YjsUiVbaMowCQTAXVFhhCit4_8_le
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=6844499c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Vx4YjsUiVbaMowCQTAXVFhhCit4_8_le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0
 mlxlogscore=943 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102
X-Mailman-Approved-At: Sun, 08 Jun 2025 14:06:41 +0000
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

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

