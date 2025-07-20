Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3728B0B5F5
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFE110E458;
	Sun, 20 Jul 2025 12:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj2VxrdF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A6C10E457
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9Nf1M022559
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=; b=Cj2VxrdFlmCcBmzi
 rs947vicwhDfLMZSTo9JAa9w+4MBd3BrFjZQTr4vmreMlaShC+zf70VYeqI0Cid5
 lwzdJ3Ab+x5GwT006RnWn+GpVAYysY3WunyD83VRJqNGsnfzUcJ6rQ7ANBFsXRYG
 OtV2GygEK2wd+VCjsCMB3++2IH8qn2y6AeX7KCs1kP+i9Tm9wu0Z1Rw5LF1JHK4v
 x0MN4BS6GWP+RC86A3gLG6RLqBXFxWclCCBqubyMY+a1dChQOFJRoh21r3VaAaK1
 9CjVbOrznBScdMPA1vVdew1uVXxQ6Gm97ehrtYGtQYL6DEu7ICfXUZd8uB5uLmaL
 nFhJ8g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j5vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:18:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74ea5d9982cso2539028b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013879; x=1753618679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TScNC6zTNOCvvTMV/4I4HH4gXtKqdB6Thd+WQC9r2s=;
 b=ChbGN/jt+kMob9cMxSv4hjErC8DKXBt95ztzM3xhQmBG853Usk7pdomf9pCTAnR7D8
 DW0QprMreirlqJWqnVJuv1jQzw6PLAM77FYVTZ2I4KR6YbWLOQDPToXXDeuIgvWoaN8O
 0NXhhvsbNbuoFj7vx9rKaJ+7js45ZfIKd5/NC1neQqyIsjR2SOCSA7QR9w8tH32OUMBk
 KQm0TV+09GEzv6DmbUhrngKCFceOuCSya9WdJ9jTguvqqvWwJDCe9aYsmQiftyxC2y82
 0Vh71eaeEcKkuQYIvt/TaeWdBbWJUReEEysyqX5WlZP/tte1qijg9fA4TtaMLxfBcbmo
 JswA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Lr43v63/r+qw04Q3aEUy77eSJkRghzbo6iodewsCKkeZCsGotYvZXOBgA07bdMu9NRDN9WKhn0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK2iJDBi/XGQ4jJ8GySEtWANZ7icNROPqRL4ME3NSFcNRy4USV
 qMUZT9M4beniVSt0X44SQQSinoMGMYHZ2Btjk6xWrQ+ORVbq6qVF5D4BVtLzPmK3Bk3w+aqwGgn
 +hdKEA0UVhDcPgRZyOxegLThKJni6svfRZmGQ+rZAi8fTDLh0v3ANf2JcWCTVXJtkBWZYidc=
X-Gm-Gg: ASbGncsj/YE/TXTC8iB81KK70WeTKiLC/Kks2kAuuLfSVyR2xVcOC4gctillE7bbDlk
 rMKvdfwdWq9+Crwjen05wg7DvBzjSgwGdRNBw+M2jOOv7++RjzmOuArSlvLKn4/a4F8jvOSq3uQ
 vORe0b+TF+UuJRSLz6fjE/gl0PUHyb6BnI+NDFAbypNXknkTm9hgMpZqrRyYP5IG3QVgUSWtU1O
 A23iYF7Z1wgNQ4Apbui1ZR7zSAH3PRzCB4Ncp170DEMZqACoo1MyIVrHCPQ1jRnonDiM93vpSfg
 ElvegXGL3/RYFo2Mz7NFc+RYrB6RxKGNmIJxU2DzUBquFMzPoL3PAzACBiE0G5oB
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12676487b3a.21.1753013879247; 
 Sun, 20 Jul 2025 05:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7VV3dIbqLv0Bda7KAub7izD7dYBl2htnDCyzsK/RNWmk3X3ufAsjrIqpvrxS5nYqsh01IYQ==
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12676431b3a.21.1753013878679; 
 Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:18 +0530
Subject: [PATCH 17/17] drm/msm/adreno: Relax devfreq tunings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-17-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2469;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yo//VXpe8iX48jIZ0sCMtloy5TgF3OidJukwu7tRn5s=;
 b=fgzO+9t43IUEuMn8OKI3RpLpyTPjIfZFm2fuZ7JUwHO5rdQh18cOUA5e0P2EnAGfWjI731t+L
 30I15mVzH/SCXUskrPfsLIAz4Cbxjm7knH19i9nyCmqWi/Y180GA9j5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: c1xW1fDGX83iM0_lWl-iISg6zuHHanSi
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cde78 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=A_RMCc231MWr08KmCZIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: c1xW1fDGX83iM0_lWl-iISg6zuHHanSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX89fpKudntI0j
 H5ibpm3OyjSsJAMHssTb/f0kGh6fwwV6ViyayfcDkgSvI7ZyfYgD6/tc85CEkOxVWG056qElZsw
 FEKgeW3nD1kxps/x+Rm/Gx1yABmHg1Yr4S+bhcs7PSYdIVFI8Av2XF+ODkNiTdV6hppMIua6NLh
 +irb+NI4WxkAbzCpX3sgv3kx8pzOWd8yEzLsx59I586V7C35oq7evbw2qlphTOhUgB8iDEKMSL2
 k8xMCEEuw3bAwzG90dTvOcjOrcdXNeN+cbIin3KrpP6UQnpSXN7A1duAdWvfbgTiMijk9UYByz4
 S+OMOxLErfXdX+Bih4B8eZCw/vpnLvJfW4ZTaDyQ7qtG3YIJORRyZHU5MCQhi+fnBWhAvBkBEIp
 AN4Jz0nCqDhvjnJWnD9oLEnZMWC8rhLAnWRmdSyJS4BoiplKXv462mhPWdqaENuHygAIXPLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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

Relax the devfreq tunings when IFPC feature is supported because there
is no wakeup latency that we have to hide with aggressive dcvs. This
helps to eliminate the very frequent gpu frequency spikes to FMAX even
with common lightweight workloads like UI scrolling. Some profiling
data from X1E which shows the improvement:

DUT: X1E CRD, 1.25Ghz GPU FMAX, 2880x1800@120Hz, Debian Trixie Gnome
Testcase: WebGL aquarium with Chromium

Current dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 29           | 300        | 120  |
  | 500    | 41           | 300        | 120  |
  | 1000   | 45           | 390/550    | 120  |
  | 5000   | 50           | 1250       | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

New dcvs config:

  +--------+--------------+------------+------+
  | Fishes | GPU Load (%) | Freq (Mhz) | FPS  |
  +--------+--------------+------------+------+
  | 1      | 23           | 300        | 120  |
  | 100    | 28           | 300        | 120  |
  | 500    | 42           | 300        | 120  |
  | 1000   | 62           | 300        | 120  |
  | 5000   | 84           | 744        | 120  |
  | 10000  | 93           | 1250       | 120  |
  | 15000  | 100          | 1250       | 87   |
  +--------+--------------+------------+------+

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 53ef2add5047e7d6b6371af949cab36ce8409372..212963a5b8b57597bf5b01ab90893b01fd9c6e76 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -156,6 +156,13 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	priv->gpu_devfreq_config.upthreshold = 50;
 	priv->gpu_devfreq_config.downdifferential = 10;
 
+	/*
+	 * Relax the tunings when IFPC is supported because there is negligible latency in
+	 * switching power state
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		priv->gpu_devfreq_config.upthreshold = 90;
+
 	mutex_init(&df->lock);
 	df->suspended = true;
 

-- 
2.50.1

