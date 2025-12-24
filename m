Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF4CDCBDB
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622D10FEF3;
	Wed, 24 Dec 2025 15:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1vPqkrm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jg3S05Km";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077EE10FEF1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO9h1bo1561938
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=C1vPqkrmPQ8EOKdV
 9t8CJTtwYStkgR5EM547ilIAjZu8XQgTv0aKTYkDxAKDzYVaGGDBWPM7joNzhvMi
 w+HPpGXf5pfAIUdBQEld9btArFjUMFixaLUDURJTW7Yb9q800V/0qsVExSvTjPyP
 6kW/IunB93/DrwQALwW+hyRSRCz4by40MKoGndCS6anWcJkDafsMjnfyGL9gNgsv
 oPs6Cko1EK4Nz6d6kIAdWKiVbY4CtWQnbbwdBbSeUFRzch2LF7JGTFIzHDhYb/O6
 xcgDmtQDL+jTmcWIHk8ahF33SULriSUpWzRoqxIFbQHw27IukSjWnLghsleYRhdf
 kNAYMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fujk3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a366fa140so281503176d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590954; x=1767195754;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=Jg3S05Kmn4Rz+sMBiaDpBBRHPPcvCc+DrjOwJG5w2beSIhIpDpgJv+ij7y6UcM3xWp
 wpIEwI5Ymxd6BHMm6rgPDpfY6UsJ7O8gikRVOFSvF3pW+U6NPKxDvD77u6yjKhxg5ZXn
 Mrf/5dKfyOWKsZvLOU5ZqpCjqQJNhEkBrjuJlezIN+HELnTRM7yzJ9XzbAOJ/8WbikoY
 GIldIrlEktbrarCb7G/9SPG39AKhJk5J0qMSFHZ3X27K2XIBTQ3Vwogi0HUfGVZriM0j
 MwZmLXDK69ptnqqbzMbu5p6iPjFweZeKSjQEsIRE/cHa4XhSS3dJyh/lVoS6OJyukos/
 m62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590954; x=1767195754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=pdV+PCrlej8ORnXkLBPAL6aW3hhUAkrYSC8ySh1Ssw09UxVl4ChdM5TTX7YL1wu6h+
 gzzrRdcDqyLsraYooOSkV/OgSFsAF9LM5lv+/VRV/SOChY3iSgCGpHeEztJ5vWm0N40D
 HCbJJEtTSfC4A818wsYi3tpPXmbxlG9oQEk8gmSUiVq9N07+kpFgimkKyjp50eXmbdhG
 HGyC0+o2X27JpypdJ72yrtMsabCG7FVJRgfVHzfxle8OKznyFpiUSHHJMrM+H+4y33mC
 R9WUxpCzkf4sLfK0qfD+mAN24LjSBPLR5LTzg19jB83NRO2NyEIcvn4V+QJL12WM5IXl
 SQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU2lBIkZNO3NfkI5YWkEbjExkLGIOhpeOJ/QvjZX7ukzt+DRBzSkqmht4q/gODf+x6cKJkGOun+QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrCPSmi09R3+saHu/8e5cbi04UML94EJ5npVKQEjL/3/TvLw1L
 fm6/mLZE6tRFP8dM18hBFMvVtkJtxoVj2jS+Js2atO/KdSH9LtKxlj9jd7Yea73QSngNABc96lY
 oO/EHzorXnwRNyCLZY5C2Ujd2YKLKzqy4xsenu5oOYlZklIuyC747PZmEMMq6SqQprIiZ0hc=
X-Gm-Gg: AY/fxX5RW3KEkU2vDZXDJZs5D1/A3gyGRf/ZT3jkgQ8vgU/xXM4GV6YOZ3tehP9/bGV
 30itO1Qwl+H6hHuVS39Mvjxtlnm/afKU1D8gE21/Ysnbp1txetIu7aVXvYsWBuxtU3/TqmTECZy
 Bo22Hv9otVFWUM1Ef3WgHkGA8hFp0fiR/xSrNXyJfLruq+xcpAS5p3t4aCPg5J+Cl0pbWL3DAzB
 lbtY2ZYQHgrV266r6mKFBjT7Lwi5Ti0gAPJBbM/N4EB7WEENVCo27wn+Y8N+vCdVBfjyitNh9Tk
 vgHcU18iQ5QYv3KMi+TvJUOwyyq+eS4KJRMh62E4DxULvFB1bqPPUfPCHBAYCyQCfvXO1ozlRkp
 pj9rm603tQNoOva9Lk+HjrFd6A2vpdm2AeNTjrvCa+pG9jB5Ohex/mh2CrheSpQ9zumz0eOR+MV
 0gm40Vp9tGDFzQz6eRCOsYAhY=
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id
 d75a77b69052e-4f4abdd1c34mr264655041cf.84.1766590954456; 
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJUaulADrZuO1E1rW2ACXAChMyl7OHsok4EwpCYelhHOao/akwZn/I2B3yyVgUqAj/Qpchlw==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id
 d75a77b69052e-4f4abdd1c34mr264654761cf.84.1766590954069; 
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:30 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-1-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnziVXM9tBiur/oDhZRvJxxsxCPopAEmiGt
 2MEGkk86pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1d7bCACvxx6Jb0d3zC1nbjim5Ae8mQk1udJasKB08xZ0ijR08IxUFrmLeIaiubgxLVhcG4Kbnpv
 c22USuQpHqJHXMIXwmCfvDGpoQcGZSahvx1JIamkDA6Zx3hYZZrcJ3CWZbOeSwKEUWspVqO+QjD
 VKM2MF+2TKvxiC1/Ve0S3nQ62khUCnvzqvO5piQGtqiDZzEaxlffUTFSw8YZIxRzFlRE3uqCxGx
 KCNkZ3frm9K24UnpsnxOdN30Ca84DElh+CkljqsprUZw76UokPej3azZhkycGl5mht7YlvFeyUE
 KI5hck0RZ5iIzl6vKN/3mqYOjXjhuP14CmCpm+pj8svbxE49
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KWfp7ya__RjULSvNtWU9Z0E0Hy1BKYjf
X-Proofpoint-ORIG-GUID: KWfp7ya__RjULSvNtWU9Z0E0Hy1BKYjf
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694c09eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX32F2ZDLT6bbj
 0B2O36kKpJo8cu2qr/6MiUV/zKFs4r/+50SLhCsNXg4m+Owkyl+oYlMHPZFAuVLxmQ92WnkWT1F
 zP94xFSkw/ZmoMC2CLtvtJbYrQW5Vau+pSHVlTM5gcsUovBMJV7KbSt+BLqTazFgQJU27yWtTkR
 JCkpakW4dP8XlADmSNtULpgFuxa54cgpMj86ZiOI5lc+uySW5ihEWdh4Z9VBCuwIY2Upyfxaqm2
 0TMwBcagRpoGznqQhMqkhnxGjLEQL15bRLdgbQNgtjw7e5xHd7xU1cL0cO2dx4cEYEBbiGDtNaW
 9gvCIp9bX/um8m/cgiHQjOd0W/89IArXYjprqIbNGea9SRwVbe3EfU0HKyWZBKKrJETKGQ4ULuv
 teMVsqKS/gxA4oMC8qwMFJvF9wTbygoLCyFGfwd1kDqyYEwoj4sTKCOFxv1RZ7yvZujtKXl4EW6
 Zf4hGKXO2A3CjHhX2Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138
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

