Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB2D0DB68
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A8010E109;
	Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7k0IuTt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGj3QzZt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D9210E109
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AIjK6u3955486
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Yuz5Lly3tjYhnq/oakT1C1
 zb0K36bzeIIake9asJ7G4=; b=Q7k0IuTt0bgs+1wxYDvIkBRI3uhXRA8Pnf+mMl
 kfjoas8A5lFet0DZ5Gdyq1fP+KTvc+znxbnqheYWYwLTbY166jzO8ByQg7SZW+CG
 z9njqtC87FI9/b57paRf78O9bSIsT0pBICirj2ImuF5szM2NWnw5m5js8Jh7zPSG
 piu8sNp92/XgtCOu26zMDwflIoyW/ZjckQzPU9t2g96M33pMzvJojbjc7ci3ystx
 7zQuenkCCUzDnNzW5kLEA9vL5mskEPasPNHkQ9EBrXPzuJslq9UgiMwNk8PrQStJ
 /cDQG0sdidsvbx8tNel8brs1TnEW+V0ScrkIAcECCKjixihQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pm3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:37:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b22ab98226so1230359885a.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073878; x=1768678678;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
 b=EGj3QzZtIkfsEaldZs1CpAxPV6rlDfJT1FvPnCEENmGv5jL06/YiStXqhb8vitL5Qr
 Lniwhwdd1Q5jYtxsuk5RWB2zuarZ0dTnu6tOGelknoa9ek2P/+5ZY/JoRjA0JeVKJGLr
 bUDn11IvFjyjw6SBW9iLeT5bL+VNz6732iiuJBktVFvw0SNtNNjCJJgQHJIowqQB+Dis
 i/wHXa6Au55c4gu7BeADP69/POVV9Ujr0Ij110WK7DokTn3tmSM1L7V/AIr+cKBUmiZl
 Ewg8kKalP7A6OwDWHxafdcFSLj5I9Mutx0aJMY2o5clLx4p3fIuMZRxaabo/nJTbMSjK
 00pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073878; x=1768678678;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
 b=RB8BiHmmNtrEw7oae4zaAPDvCgYkAuK3muuwy5+crUPuw05Vaoj8rkUpi8YiAGkbgY
 ZJpen/6e8mbiXNCHyqo6hGEFzVq708N7YHDEoGtr9LstX8Yg+Hq2AZRdPubGxpN6obRC
 2pRSxp40i52nCPxG8vAUoPD6lJfspRoX9iQTWnSK4KJfKyOi28gsOROGSHdhlVJj3V0L
 9D7JHtUGB5NozTLWHdYJlK7D6NxDWtj92rC5/TlK8HbNkv7DkuxQvYY8dQrns3N7IsvJ
 2TDFbpNp/a9cvT30q/QfXa8WVj+M0U+cNBdZDyTIltsYGjtKl9jS7pylO2D1bTaaFKSm
 erbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvvDO2jkuAZ7W0vJ8ubavc+Yc/kEw+H/sGIOvBM6O1fsN4mw9iW0dfOk58jqSN1lFHdZqWWiWCIzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWve6kkBLl+ksQ+vEYlAkiseTRoVEOOz0M8vKIuzOy5y1XWC2H
 fnf831AxLmqruMRHdtBt9F4KDAn+e6B+UqLUBV6FU+2fdM9Z1kSEkgAvdS/8T7cJ0Pm3/KYnJ5w
 KMj3HTEHRh1o/doVsDb8hA2B1OdLj3dk3uGEQU1lQ7plc4Xpgc4xJ2iRhmVUx254iX9eyQxk=
X-Gm-Gg: AY/fxX4Z8XcEdJDDg9Q5TS/pTwLjObh271k92Yfeqi2vpySDUzKSLa/sFiCvzlUud4/
 v0HJ0doqX4QnXYVH9ranDNOwcgtPPaNQm4AJSJzy3wcJMbdk6ZYJJH2ibMnOt3OMQdcOmOfv/iQ
 bzgAM/dx8E1xjWgVvkUpyVWHEiSW2fb0KudNRsyHOFAiuUOoHGF53HhWP3IiUqxR7rIRaxv7hBO
 AIhvk+HfYCqebqFfxiilhOA23RnSrsSphOtXVHKOfAm30hYkixWkVMcBBSlhV4jnswHQV/Awj63
 smv04/vKrxAzU7F1G3g7hF2ooENqTxIZLoQA+f+zkQS7SdjDMuHvmrn6okvX73fByqr/KwjV4vb
 ZrAwnYyh5W4X9iEz+kXBJgd7hJYlnP9/eepWC2DNHzqcXeVWmDpJfHbfy8mpyKDEnstnJBMd/hd
 utjQWfhDbB1/II1VaEQTNY45Y=
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8c389421d1emr1753484585a.82.1768073878416; 
 Sat, 10 Jan 2026 11:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH//Jvdv/1iDO7XXudCXmktmxjLEGbaUM5VpCobiCP3qcmln8zrFrWKnWb1Z3o0q5G1d6WtXg==
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8c389421d1emr1753482085a.82.1768073877982; 
 Sat, 10 Jan 2026 11:37:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] media: iris: migrate to using global UBWC config
Date: Sat, 10 Jan 2026 21:37:52 +0200
Message-Id: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCqYmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MD3cyizGLd0qTyZF0DszQzk+SkJGPDxFQloPqCotS0zAqwWdGxtbU
 ADnX8sFsAAAA=
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSYXXJp+CINOgQyxIC8KNSqNqPLA1uV+wmA
 TBShj2YlOKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1X6xCACQkrwtfDBCLgeJWHdhLUmz7ViXaWlVL0txKsubcrgrqF3essnxA5RKl4ftlpb07gWfkgD
 mxXSxRsuQlaa1gJ/QtpVHdwP4fFZmEZ68pQs/+3TrbYz3ifw9Jze5a3U4yqx3d3xxQgreC4++Gn
 X55d2kJq/5G3Ojqsm+cTR5V8JuWIcECgDWdy78/IkG5vTtUyePREAmTO3H3Hxpv7b0TMzpay6xW
 +NWN/n2lm2avE+UOZNsbuODMTNVWIRHyeMbKiHdQnpm5QzEyHnU/9HfHmNyPubK8hu2wt0FGxue
 bfOCrPiMS2X1QR38X0/pJYtbbi6Lu4Dtmecy3g06bBuaRaNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0QeBzp6E3Z7tG2SxfgVKfzqkyRdc5g93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX4/OGgB5/NXPI
 jNs0E6cst2ns3TgtnlTXZ6wyrZ7MXC4Zb1rANLvJOe0IL2li31UUR4Z88sisIwRJPpEE+IyGb4R
 BPNh4IvsaZg9w3EAj9tnV691tewJL+Hrk6AblrrXXIXVeKZ8r2cSZSAP2BOrF89+kKZXd1eu40z
 28yUAWgda1nN2hXe8VRN/ZZb0tawy4uBqKe2rp+vvRol8ebkXtmn83vsMCrVKlYNKm+tz6tZT2Z
 I9XAV3NV3aPQXXgdI7rvl87IfY4QbehftyW1HKetvUWllI8HtluSQxi0MO6NRlJpl84P7b1lbJm
 1iiBKN7jA4WsdiQg2P4RmPH9mClcwc78E9ULOUV38zADDPbj7oVmMf97tcV/M1Jc5xz6VccdBUi
 leUD0pEVhNolN8B+1wTVsqOx54IXvTdyCFoMa0RAk4Szc87LtJ3hQEomTlcMsjPajUJ46EwfEEm
 sj4GiSxruDnRoCEe7Eg==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aa97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0QeBzp6E3Z7tG2SxfgVKfzqkyRdc5g93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (11):
      soc: qcom: ubwc: add missing include
      soc: qcom: ubwc: add helper to get min_acc length
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/a6xx: use new helper to set min_acc length

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                   |  5 ++---
 drivers/gpu/drm/msm/msm_mdss.c                          |  6 ++----
 drivers/media/platform/qcom/iris/Kconfig                |  1 +
 drivers/media/platform/qcom/iris/iris_core.h            |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 17 ++++++++++-------
 drivers/media/platform/qcom/iris/iris_platform_common.h | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c           |  5 +++++
 include/linux/soc/qcom/ubwc.h                           |  8 ++++++++
 9 files changed, 32 insertions(+), 39 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry

