Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD8AE1451
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 08:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42F10EB14;
	Fri, 20 Jun 2025 06:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7zW9rHg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9858310EB17
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JGPYYm010103
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=; b=Z7zW9rHgAvjhnm+7
 kYL4yUZtbz0UIW6nnqrODR/VmfF+4C/5FGxkDS/zx7TzGL8C9Ct2iiAdlwdUKpSZ
 SiAukqYqYzbaxcmKz4RTPXLA74cmmJNFYTepJ36kl/Ew21UnfcnQw3wUO7LwPE3E
 w+5A1jmH402taX7tIQjYAY9JjCgmshTMMQAW/jzUi7xFIcCsfxGstp5AKbgJitbQ
 SVWfbuzSyugfgB4/jWj98hadZnGarfXFrmDy+CI7pw+cXYlyzMIK71KxJHTB2nkN
 S2P37muGUrtu8FvQ+BzKlYl1gG9jtEYfhRGz+lwHnUPZM+O0j1DvBunp3V5nHH52
 5X/gmw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp60xyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234f1acc707so14820685ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jun 2025 23:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750402515; x=1751007315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=;
 b=hMv9e8LURK78mZQ45SDfEKpaM3obVR4O85YRu1bnRQ0H5gkvwWu6i55jbr+9qr4bQj
 eZsmBQsmgSYlsJWiVtLWzdFJ50HZOb+5iO4zip7PF1Y5kj41jaBfjne6qbW1AqcAWbMq
 H6P1Wgf6ZPsarj/GSeMiTWiQtwBgUDCFy8Ujl72V65pZ016qHrG3Ajrv8vOfZzJFsARu
 PfG7xitR8jhdoFonOSOJ64mi0ZgwDsBWvmt+yWTxpsL88s/0FtNh2mrY84kZBrY31dMw
 lTq1ltiP2SednD0lpd6ALvailrgkopUzjonnAdTql4pFbsfWcIYUu5XGRnDl6VSTqAG2
 +ZQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEtMAsS0EGQpWYwXldQRICqwUFQBsfztmvyBkgRaOzFexdlUTGq9YhnZXqZBZf8hyIbPZZHjSvg/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5nSPE14+xE2h896D7fF3bA53uAeeQWQoO6HAlPNVR/SsGcoCB
 lc5nprGiJOObe5FHjbUgdsMhG4+D12XPVat1BjxOnjcndNnJ3wfYs02nO4DaOm5eUS6F8IK4Wkx
 qqjkVHtTQzDXfQ+UXOIs+17iNYXYzTylvJ/PDS+Dpf0c86Tgc23LgHBmMzhQzSjEXn7KrLJw=
X-Gm-Gg: ASbGncto+TzN7kyBuxAS8JHUUxMR0kJOvtoObhSAlbWgkYTZjbIq/eH+uMqS2FsgriR
 55ipHL8scsZKkgCML648MxObj3AE7/deI1BYgiXMCoOZKZSwTJpFXnes4VC/KcWdfxW6JIpMfd9
 iledkZWkpS/M/9TaLk2+ep61IDhHiMWrStXLRX5YcBILsYH40ZcTlFUvBLN4B2x6NUjnYu4GDD0
 pEvYrshUycvNbbziLVrFysW/byOVkon9jEjTj1N9ZZZo48gGtqM4uq8uL84fp4ZR1bvbCQa92Z8
 9wAPYtoHs6sAq+cEd6Zz8pmi+AGeSDMv
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id
 d9443c01a7336-237d99064ccmr28616835ad.16.1750402515083; 
 Thu, 19 Jun 2025 23:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiXAnjhsU81dzFSNF8XeE5n0aYS1wi4Wc4hIGCqzrClvvAQg3nAWi7A56J6kwNx3saDQ1gfA==
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id
 d9443c01a7336-237d99064ccmr28616285ad.16.1750402514633; 
 Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:30 +0530
Subject: [PATCH v3 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-3-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=2100;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cb1ncv5kKe+9beezyK8P8PEh4cB50d4o5qsPw+1gBfI=;
 b=6DsTJ1+fRdhEPD5dnhpU8R/Gz1ebwrb9QGaqZxTAvYnxQjpNbqZZnZeVEtrXDr6XOrbHpho2d
 D3lSYE0SnesC8otPnX0urguqEuklaUZlab1toQoIuaDx+Bast0rjRDM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: J7sa3nC0Hwi6tKrW763dtsq0zRCtZAHd
X-Proofpoint-ORIG-GUID: J7sa3nC0Hwi6tKrW763dtsq0zRCtZAHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfX3TGZMXGoK919
 EMw0bh6bfEdaXrY/YgkX3irMCFTeSvLNjifn0+OGgL1WSeWMSTXjzZn1vMmbQ2byHdH6hPGsPZ9
 VBzQLuAQyDqFV2CXJxuuOKQ+Gst1y6klp1ZWEms1bCNMuHVqD3Y+szz2cg8dIzwyyWNUAiKLL1/
 CBO+67ZeGhP+VSGM07JOyA7deEYL1NEYwW5aGKH4RwiAfWrX/2J0PaEWMKSRXmyfRtoyicZYuIy
 3Yakf0YbfvPs65eL5JOAMIMpCqDlbsLvIxZBxv/JN52CNfEM7MOdC/QsVaM5SIykHX3tyJ/tGb2
 wbQ0iYdkh+kH18HFUq738HA+v8Bm8Fx4Jtl2Bphd8X94hjWzM88X4rrGBgY23fxXQVpU11V/kwi
 NwcJklBGUmm3a4LTPi0Z6lxLyl1JkZKcYuAH8F0y1T3KaP1p/zI9vlWNf3TDHq1fmnyfPd3t
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685505d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
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
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

