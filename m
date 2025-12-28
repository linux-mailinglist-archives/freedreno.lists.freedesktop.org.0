Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050CCE48F6
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 05:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF5C11A894;
	Sun, 28 Dec 2025 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muz37/He";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQq14eTz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE0511A8A0
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS1s2a61798320
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=Muz37/Hej5t/bkPw
 VaS8uOKDyUTIDL7rtceX2OwSn6XhhJ6kNRdasFTr9dB7L86exxH8GJh/lLxReQ9b
 4prBZfExpufj3C7OP53ojUGaLMC5rB54RXY1p0UIRBIU9pKS8N15jCF81TiQqkC/
 cIEomWXGEzhxWqRtQKcH/juo1XEamUJh9D9tx/cmUHSfnNzSQf3qhKL5uIJ4gLif
 A9dA7nte3kTzI30V6i94AgShtCbn9vGEVIT732qFp8LisqG6LglPmHbQtx7KLNWU
 3WAMJcdWTbOVwwNwSfG6Jrxwj822W9g0M7GKBgPaUg6kZPqHwEq5m9YHChO71lIM
 exMXKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wsn5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso308099191cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 20:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894563; x=1767499363;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=eQq14eTz3sul10XzD65Dt1V4PxwFbAVNXNwjw1KjZvTBDk4Fww3JUgFoBvPVKZY17t
 o8pV8azxRspHcY8LA2138OheYscme9YkImDh2iC+xldDaHgk8OpHg6cZZc9duTrNQxk6
 ryAc22hZ8QyuGvRIHn1a6J5oXMX8NKgMEedyCffptefyVhuiLBjaaC9C0ejyiJ45lxJt
 PBDlTNaho2PYIubcSni8QTAj9u5xAfOyw+kWLbqqsvJdb7taTKnmbNj7OjKYt7VhUeQa
 FLpyA5y5hMMYEzErZl+r39WwwNPJGTClrHH1MHSeXQASqgU81tl2QpsFHLcfc0x5JdjF
 DtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894563; x=1767499363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=he50ZX5cjpAzhqFYRDFck+vUBSil3FCKx3pi19K2Za5vCwhW8dOrpa/8zjmOo9VzGi
 EEsxVJKBw94oxxK+c8fZYLSiBBB/+KJk46N6mfebbJF06lf9syYCxj4K4Z/hIpHTcLkK
 0BKqj/m9tq9kSx+iaX9O80Lsf+yGxOf1ATMbArPLmlWVj4KpovcpmcVZoy73lxx5cobG
 Is9o/6N8WrzKQ3YAyIwflXNxEz9PJCfX8/AkuwbMrTjkDPAsPb+XovNYh10wG1t8L6VV
 k1915eozq+JEZfPE4eW2Z2VzcOZ91m3B/zxoL+H0NTMLresDyAxWtVFg4qRz0LHPPSZt
 T73Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlwMV8lIsFaAtviqLkjo9ZhvSJjWk2gZJ6I0wsp/pO3vr1KJxPOM2EgeJFdbQN/hLbx0IwkLKC5os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOqx5Lhc1tZ74fPBVizjv+9POsYtw+4NoQhcBZPGZyqN3t064V
 mG5aCFuc6QO/NHT4K/3tfBxvHJotns/M3jAXgQAVWg/yPPLxWEhLpPFCdGqK1W5+MHp/0+rOcJE
 C1Jcqesg6NiywEkWW9TP2AKEzM/kLW5iH9QummEH6IJTgoqsgxE0pSK0ApvD3OaRcWU/XiKA=
X-Gm-Gg: AY/fxX44h75ib5nFeTuRBX31hje+f0fUKI5MHoMDyf208/I+Od8tmR42CfFRjW0yFdS
 mL6kIsETLQJY39eXrdfzScj05rAIDe8oRUOjptAlsnawI6lYn32pyIhms2zdZBmBpJvvlZi1GAP
 YCkjqpoOCwGhl/e/pdlGf7Wguup99s3wz8pTbmiw0bkZjlXlEa6kO8K2bgKnXcsRTf1+LNCzTX7
 iiASE/7JP28cZTryjOUoOly6OnlnIZ0FGsGpv+ZQ7glgj+0Q2LBS6Ry8uGV4D166rA6tMeeIX4C
 3iZDrNTHe6knrc3qGPS9zEZmQ1jfXj6DdaWoMRUnfj3CO4ndOKCwMBeeya8olpLLFCiCvPNz/cK
 fdt2vu6OiUm+Lu3PITTGYHDZRcub+0elIEZ3RuAui4ZmbTKiXACsIjsaXQjMIroaYVrVi7P81di
 vQzs9PY16fWqbKY1c+DG3/E/s=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id
 d75a77b69052e-4f4abcef65bmr405971921cf.27.1766894562580; 
 Sat, 27 Dec 2025 20:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjwlhdAkWEKQJLXeipUEE3TsK0r68DKPQO32dQw5IES/ATdDN83UnZEGSb7qmG18xos6ZFkg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id
 d75a77b69052e-4f4abcef65bmr405971741cf.27.1766894562139; 
 Sat, 27 Dec 2025 20:02:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 20:02:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:02:27 +0200
Subject: [PATCH v4 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-mdp5-drop-dpu3-v4-1-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvbjejpcXIDufPZRcwKyaBy2RNUdXd4ttop2
 FP3OZLwRx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr2wAKCRCLPIo+Aiko
 1QbXB/9B1mhe4T41K7aJyN0cYdhvDYqNU+LDp9NdJ/cExGkosJ7mVG3PE1Vi531K/aKKAqJwvVh
 UqWZlZwrQ1hYIWcatRCRn9VXlj5Me0azR99qyjvGEU3VGCMPYAkZrXsBDiHHNQYA9IYF8mp06jK
 nnCU3abw0xK+aZBmmaTh9mXBxE++Ppk2u/78WrSECtoQ9X2cOqD3sm7AuFN8LOFuszMg4n9akb1
 oRDU6W/CspOwKmUhmj7QXtQ899nKhORkYN99ZIwTt7TpYFvBRoku4DD7eqO66+87CG8k4CYUrcN
 f5W6flKFzieHKk0b1YXjzXtQ9tT6HppIQb2eIwTKMUaCI0sH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX8fuIq5S6dR2r
 /WYduPBIlBTBo0lIt63f9COp+kDPy3WgypzV/naRozpk+WfQdGNXwHH8HLsqFgL7LA+vz8879AK
 vTQfG5nsU/U9OyWyTqH1s5VvThyKoyLLgO9r2ziftcmbkOFUSPetbiD+sDBHj4L0nqjGeWmrkvH
 08Hn8lI5UdbVkNYyNP6U7r1BXziXV+HJyRoDwWW7GZkGrLOWdoRbL3Cl65xhK1sZmf8/4WO2Pf/
 6D//zsXR78/Pd1ncshnkVH4O83o2waZZqMSfTabhswMGO3KlGoaQ+IWb540IORlytahk4I0gQQ8
 neFCaJSzxVy3K49ADulg95mruCdAY0mVZJwBHfMNsJE/aOS6DtaanXGkCtu32UJnm3YtGZbtQhG
 N0mGcMM3ozvBPvx6QWCxTKzUPx/n6Sh5Q7VCVSqlJ9Gxev4RBDWCJucfm05YKxkm23tNU2tr3wz
 /x4s14ciPenvEp06nqg==
X-Proofpoint-ORIG-GUID: rIQ_ygYZtXXgWigb938BovFYs9oLzK1_
X-Proofpoint-GUID: rIQ_ygYZtXXgWigb938BovFYs9oLzK1_
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6950abe3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280035
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

DPU 3.x don't have separate intr_start interrupt, drop it from catalog
files.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..b1b03d8b30fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -42,24 +42,19 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..64df4e80ea43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -37,24 +37,19 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..b409af899918 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -36,24 +36,19 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 

-- 
2.47.3

