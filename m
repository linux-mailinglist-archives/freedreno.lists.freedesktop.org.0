Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FDCCC4CD
	for <lists+freedreno@lfdr.de>; Thu, 18 Dec 2025 15:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291610E9FB;
	Thu, 18 Dec 2025 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGqp9xqV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkW54Y3a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A69510E9FB
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI8aHa5167389
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=BGqp9xqV4INw9bwg
 HrKPfFA1MBdG1N3ZpOE68KEHyMRHpYn4KiUV8Ei2EfFgP8w/rD345kaauinxeIx6
 /TUdZ9uK7XVo/WTBChFK5E+9nJNUrWo14Vj/MayUREogf7rC6YnhKWg7sbDr2fu7
 zVL5qsMQH+UJmPux6YVDq2RyzBKHbkN2KiCHP7nioUSOt6X5S4gQP2TPrRMg4YOx
 p8rD0WkcdAXvkNt33FE3igOtOLL/Hx9yxewzMvlXOKNbO8M0MG1nrW+r3EkWBAnS
 eS7CsBSlafmOB+XajdVQ/llaLv1FPNMDj2cu9L/k1ff45zbK/5RbC9VLp1wyOhvB
 OCFQQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w52m01-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so15825141cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766068709; x=1766673509;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=HkW54Y3aMwIHubs8ayrYzh/O1xp2is834Iz5B65P9TqiZDkHeAofV9Gyf4y2T9A9NE
 CGx5J+9j++m4SFuh6NztKIgzuxMduZuTusYAR+YVxiLqVYSQvVQCZdG6jvUsG+41kkuQ
 5k6xBbkvy76hw71oZduZp4619TM80Bo4rMdEZrs9bn8+BMcUTSaHNUXmI9Ud+GQ4h6sU
 rkhGQNZXTQhJLLkgGfsB2tcpNK5YQRDdIJqlZ/bnOUj2NK+g9VC+TyFw7Oiv/HZoIHE8
 W47AHPBhdhdZzuKT95HvJ4VdD5jpsDm4bbhuIycDxqmpKuxs0qVtNkPiGzYylMiy0Q4K
 xIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766068709; x=1766673509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=j6P9HFCJ6zlEBcRKRHgJSBHu3AYP1/FQhjPxmn92UmfZwXQr4uVdHjXiVuynDNoz4D
 qiYDuEaKP1wiuPNxu+HHr6O9Ub82WvoCIrs4qeppNRgyUfuYgAUwcVHU8csT5Hqv5fbC
 Us7fi6jf6a2JBCAgOj9zsTzORukPTJcL75j47/6NvMeDIWK6zUpeA1/pd8oZVJRNbSKt
 qLnRbcnID7QQv91pZG/PD4qx8BOweDeNr8WlFKNUpedISNN5NCmsJv8HGesy9oBr9D1y
 X9xcJ/RO10zWfexrRaFIkQ7hvOdcXP/M+sVXq8FYk9oGe/s7fY12cbgN7Pyap1J9WATr
 uJlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmnTs/Nh+jWoixmPD42ybGSYIwpsJxThZpeb0/QtPIIS2Nuyzl81sFM0lH6svegEgYuNBHcx65hVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc8wU8psX4gx3yQ0TRbZNnioBn4ufQvunJUFVtMqyXgFfAvhqj
 CkBbOPuExZe2qp+islB9p4IDHaQHmG5Wc1G80IBbh6YbgEh3WR9un6UjYbiPqad4C11FsvKG/AN
 iN+NimhYU6Uosi9oh1pbx2GTBRr0q8l1sPMVKl+2+KzXn4npGwHkqQCA4DgcNAGIRdd7l3eU=
X-Gm-Gg: AY/fxX4YUA+6swHYS/tHuuzuBxwpYdfuIQZK9P0FT0j9sZ9OzIZJAzwKh2sJHIEzEWD
 bMiqCvVIi4tKslgnMjU4JzXCG2q0yJWIqQEDEdAcvrT3eJdex06d8GR9kCYqR2Rv8300alWg1+X
 X8Gc4sQrxh5M0TAVoZxOZrTZotLpk4gPcQ8Xv2l3Pvlcy/XDOrqOC8PbPo05642xZ/4Emcmux4v
 Vat43Sljf3J8PHe+/5tGZdaNRxKS1HUz5KeURm9cOeuKh3ux3MWTriwR19FBbNY18F+qpBs4tuh
 b51JRMbB6L/G8NPG1pa7niWPT1kc8RB+NUO42P2NOOTfX3+2eHSVXNAQNLc1UuuMERlyXu+eDpA
 TddZzK4gzPUQ/5v74TvB7YZyqTahtGFolbFS+l/n20cMUzJm19jniZ9eN6iirNqauROdDXc8NEq
 Ubh6Rnr9FKnJefON0UmaxRYNA=
X-Received: by 2002:a05:622a:14:b0:4ee:197a:e809 with SMTP id
 d75a77b69052e-4f1d061d706mr302051971cf.75.1766068708761; 
 Thu, 18 Dec 2025 06:38:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcg8dFCAsyO9pwvmK9MJW2JZ06mgPgkK4l/4HdqBgJw3ymeSyRkcOvfkIParY+kVgr2ypNJw==
X-Received: by 2002:a05:622a:14:b0:4ee:197a:e809 with SMTP id
 d75a77b69052e-4f1d061d706mr302051581cf.75.1766068708240; 
 Thu, 18 Dec 2025 06:38:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:38:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 16:38:23 +0200
Subject: [PATCH v2 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mdp5-drop-dpu3-v2-1-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHg8OfLvn0uQIXX6WQcuVNIO8Sro9H2Ob8kA
 s58zG7Nv0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4AAKCRCLPIo+Aiko
 1RufCACyAvrzOcUC+fY/wgdMyLVgKXHpxwFseR/uYdJ1oL9zzrT4Ku5hHF0Bg0HJ46DQm80VODm
 9cjGRdANAieLloTZbZjkxwQCqDLCzgKJmMRSRA/DtoGEIh85M3Q1tQ6E51xhyQga1yFB5Oj9zBm
 rNWmihuF/f+5hixnO2QwpRtW2Skq08PpBcBPpcMEPdKLZ4lMN8qTKwN1wBKvTX4qHRMCdHYjpv3
 tOom2izrH1HUjG76W+9cdQW8GIbe2UJqZ1c6rASXxIvvaZhzmBJGG7PgIgzj37KsWUsZ7cdRPpG
 Y+Lr3a9R3MsxSV0dkdy4BrYX1mlFse9q2fknJ/hTZlEq+by0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PhCeA5XHRZWoLyorz88Mb2kKe8C4vXT0
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=694411e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PhCeA5XHRZWoLyorz88Mb2kKe8C4vXT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX+z3PV+A0/OHF
 VvLrk4qsCVj0rtLQvDI3qBIvPGcbx74Ad7UDeXR6Eej/MqGVhMxs8UD5hG3uLXtmD1hVMsOGqYB
 avaTso1c924wSu9iUyi9k7OAwmm3Sa4pmoP9JJkUs1s1aR4OKxCXZpCTaciH7fHZfmxg4X7i+qn
 NPPnKHf/qK2iXm5z/cthcLWztWlWtxRVcijfJsrMmDVV6EHdb5SkFq+2i8C7lBUrxCuOBpCC7rn
 6qm9AF1epV/EAmU8ypKDWqNzVGG5Mjh/o3QoY5Pm4EkThgxo+fmN4aeQ2OHjntIxhlktiRcD46h
 nSfCcDXa28Fk/5k7k9Ui0WmKVVkMn3Up/arkmWo4HqzzoX0akzHoWxwthVN0SU3TLXNjGFLdkCZ
 g3Vk0V2Xlstxq0vQmXGf7aJLddqdNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121
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

