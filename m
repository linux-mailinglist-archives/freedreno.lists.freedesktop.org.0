Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88BC5FF31
	for <lists+freedreno@lfdr.de>; Sat, 15 Nov 2025 04:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4130A10EB73;
	Sat, 15 Nov 2025 03:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAWU0XNi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpJU6huA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799B10EB73
 for <freedreno@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AF2CKKl1474977
 for <freedreno@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U65TdZ0xWh9RTPUOJQQdTg
 JX0pVxkPF+VkIbt7jf5ZY=; b=RAWU0XNicy2pzeWvhi+GH8iUklYxRBrHGlITlP
 In1P47D7RICMJOAHNrspvyOSkViaQ6ui+JklEhXF7C1+O9FYl+YWfe+bcr2DpjpP
 Qi2u4qSFEhCMCL49BL1uRlIJYuKBsmtij8LdhNNk2q6lRxDRjqkOaVwocZboC0hm
 RUDBfOCetco35fIqO15KPz5OdcyEY8AkpDHyaGYjeoVY1mT9+V6uv1aAW5zGqQvD
 noKzpLwjdkFy+TvJaXqpEMISe/VmhC1OZyOaFTaGc73aptncWjfPuNJ66dhsJYU9
 cGL/rTRxCGrZ0GTkHJxkBP2wFhQI2DJ9Y2gaJzjP6A0mCkGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aegh602w6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8803f43073bso95046196d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763176093; x=1763780893;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
 b=jpJU6huAE/mAXjbpmbp6Q1KufKHx3UwdxjIwfKnaUlJGXqnRnQAIoI1QAdeojn4aME
 /JO2zPlQRgvmNBbUGI0YVxaTS9TACEGHmY5gWPXcS/07ACi7MgTPpxD+kZEocTRokc97
 vytJXaf5Ve7Xtjn0Z95ko5Lc5JYl7gy6UnK63SGKIqzDyVpAvnPY+Edx2a52PwV5LybH
 4BG9+vidRc7fAKbT2opYp+QRQCWhkzZmw9OplVr7dyLhDBWqtkPAr4tTYXmEueff2F0q
 FC/G38KhFc1RkcG+XOWKU0nmyzI/tk83jnklR3TQt7OpQ9r0HvmpYue+JD6WlL2F+XZT
 cQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763176093; x=1763780893;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
 b=Nd8DOY5AKQVTlV0ZTR89qnor0KILAWh9USduiL1qzOIoGlt6DNIPJbeJJWa4WLmKo8
 BdwwocMCHaVDJ/rNdg/by6C7XXvL0hlkUBOK0PD/PXZXjeJxfHKi1MuTE1A2izFUqEpU
 jqMw+k7X6X89aVAjU1G6BcHVU6xF+V1KuARrysh5kNMgf69GisiPEaFB9a3vUBnSv5Mo
 XwElS0bq8LM55UWbnsh6ZX7pOScfaSZGGNIT2VtW9mY8Qnjuhb+v1wAxFFhzEDG+Y/4/
 A1GpBT1lqQvcVEUsggk4WOcQye06l+WZQNwsZGQ2GyT5g8NrM666rE/dPaapSU6j1bYW
 IwTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEV+GS7DVLFIGVo8hZflIi1sZGLDpfuHvn9bX3b3pkmnfUPZcT35YC9IpERXLYSTNSX2+EMgYFjYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuBn5bTPPcWqiYndIHwgAjbgLqu1R/NYHfoO/JsJEldwzrzR/P
 LT5+44Y1EYt5ZJf9u+XglAWV5+xYDtXHun+ay9uhE8ldAk6qmQLki9dotcPU0neZw0Hl5D0mZeB
 nkpNE6a66XY63z5kmRwH2gKlzFDH3vsPc5J18yYONFkaMQkyZ2JMWvoYq6KiFhTVBGBuyXaE=
X-Gm-Gg: ASbGncu9hWFDcjQQ5NbN1YZtpC9e+KoLDw9aEWUyplIYiYQWfcOK6CCcZL33p+yixPF
 PvzcD7kfn7SfZo5QWUvxq3EtmMY6VCpGbudkPT+uicn0qTPHD7vhLiElog69DIeHV8lkk12mLaY
 dD+KqjqS8CWPF7s10AQNuPsH8fynSV4Q30/UOLRwWhhjVA/rxDrYyoCuKgNM8+H7U+GWqJaXdwO
 xn755Sol0lvkERUE9ZReKKggQ28NpoZVMhmlJA7xOIxHPAne78BYGHQoGFW5z1hvQNtLn27fA+X
 dOtHdC/LILyrjJTPe0dXzlapuWCylDPzcUS4LHYB27kuAsq+zi1fCX6w3YXhwsqYqTa5vldqDxb
 Ab+Cif/VtPc8aPefie/7PmyHYLVfyDMkaS7KRJHqE5L/IeqNwDYytVHJmOM+4Eh6V7hrwfP720j
 6gpF//B6MDkRxQ
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882926e53a2mr72211606d6.67.1763176092592; 
 Fri, 14 Nov 2025 19:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETRNQmWX8aGvtyoUqPy2210fEEuV0gG5CavmUUbG/DhynOs/idqSmfZ0BxhEj1o5mR+Mms2A==
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882926e53a2mr72211336d6.67.1763176092032; 
 Fri, 14 Nov 2025 19:08:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804003afsm1470162e87.71.2025.11.14.19.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 19:08:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 05:08:08 +0200
Subject: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJfuF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NT3ZSCUt20zArd9GRdS2PDtNTEZHNTcwNTJaCGgqJUoAzYsOjY2lo
 Ac/x6PVwAAAA=
X-Change-ID: 20251115-dpu-fix-gc-931feac75705
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ar/QIifOQLCAoE88Y/UPeNAcQ8ZidFpXscg4CHs0wGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpF+6aIYfjo0upzZFrpTKA6w5gwaS8l/xy/i+Bg
 XtDzufUWqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRfumgAKCRCLPIo+Aiko
 1a4SCACRd6VY2fRsbqKupUjg02if9uHDZMa1MI2Rl7krml3BiE1IJahoi8BOkY3tEwKN6oP+XFE
 HDmVMgWp+LJLImUqHSeoe/QvRjgvoZpq2piGjKWFuuSMsA0LHLIFTDkfKEURPqDIGZ3YSuChfbn
 fuqh/6Kv7+oBml+JT1uNL3UnL4MzG0JjE/hcNBcou161YO0eLGnRwAW6vcG7IU9fowU7cktvB7D
 HcixQQZLA/KwGO9fKVaiHdEfQ+400BUDzbwTRO9G5oMAzQoHVC2+ywnPt1p1AAujIUtwUA/FqlF
 ptdWiKrQHXo0G2VGV0b0weiVkUmu/ntXrC7UQ4GrPffgVg1F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=U+efzOru c=1 sm=1 tr=0 ts=6917ee9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=njhVRvNgssgpu8VHMlYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fsiJ9pEBWO3cg0tDJmqECmDBDe6s2c-I
X-Proofpoint-ORIG-GUID: fsiJ9pEBWO3cg0tDJmqECmDBDe6s2c-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyNCBTYWx0ZWRfX2hNF9b6tNEJ2
 q+lxkwwuyVPq+/rnIsgCdFtogNHAEW6Xvly78MDVncg4/qZGZ641D610pTPK71OyNQDX9sjSAzQ
 a1voAj7N4FmYAi5adOAxW0TtbitEhPXVT6n2neAvGZAphPR0QCImFQd3OPtDYB5qiOCUXAWLef9
 LxpKDgZ2vYGczkrohcD904sX9Mq0sPwynN0RYe2Ntm+hqIhe0Vl01n7kQiEmZC50LE+pyzueDUn
 iKmyGG5M3piwOTfb0KTNo5vzC9Up+IPzr7vevBRGcU3JMUZ0kJwtD3sL/KFokJ0eP1VlsXPbDA8
 INo7rp+oWL24rcD/a9Vg0/NiwbgReXX0QJaLDBlifSbSRsUiv3JB66Cc0tGLT6IpCQ/yxUFo2mA
 Nzj+d5+A4Kb1Xd4W4xBQgPEBH+5lmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150024
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

IGT reported test failures with Gamma correction block on SC7180.
Disable GC subblock on SC7180 until we trage the issue.

Cc: Federico Amedeo Izzo <federico@izzo.pro>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Most likely I will squash this into the GC patch
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db02d65934179d5ad42bd740f6944b2..b6415adcea10126fb6bb29d60a9d4159052a61ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -103,7 +103,7 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.sblk = &sdm845_dspp_sblk,
+		.sblk = &sc7180_dspp_sblk,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23bb39b471b71e3f313321ad1c7a6bd4d2159019..bfd34368a03641651530d9c564a74d2e9398f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -389,6 +389,15 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 		.len = 0x90, .version = 0x40000},
 };
 
+/*
+ * Some of Gamma-related IGT tests fail on SC7180. Disable GC until we triage
+ * those failures.
+ */
+static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
+	.pcc = {.name = "pcc", .base = 0x1700,
+		.len = 0x90, .version = 0x40000},
+};
+
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},

---
base-commit: e2f085ab8636fae2ebe0adf42071e7558234cd7b
change-id: 20251115-dpu-fix-gc-931feac75705

Best regards,
-- 
With best wishes
Dmitry

