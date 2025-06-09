Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A996AD2582
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA5410E435;
	Mon,  9 Jun 2025 18:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="camXxapc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13410E42F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599BYV5012736
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wDKSo0B4Owx
 KLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=; b=camXxapca/C/5sga8qhF50Bxhjt
 SNi9SsTxyiRTTSRo4DiMOYHTmJIyznRy+nIm4KDSepuTlI9zI2V/Nv1SVFme4ppy
 xGz6ND1y8MjBFX+E/YWoQVeYv9Yi5jrzitoEX5XnxIzhA2bzI20f5oaJTpcNC9rK
 x3pdqu65IFoqIuQHNc9Dfmb7+el7sREE6HY/Fevb5kpdPwJCPmCqDcpK0g6M1EIu
 Lzbtj/pE5qH640sgzDdUEBAAKrudRZOEwJagqickt5+q4D0xvUALIPxwVtFBWkWq
 cx12eOXdsfHOly3DJmTLE1pBUmZj94gUou5T9GEEcRgQg5nxkI683CZ9GPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6tfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2358de17665so43541865ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493485; x=1750098285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDKSo0B4OwxKLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=;
 b=th9GO0Z9GEvG3lem3HgpnbBToGWKkd7/99VKwPH6O4ssYLb+L2MLSwYMfCI8pwMMJG
 mkUdPb0+yYVodH9EQVHE4kDMBKWTimV/SCgc8CeX6rdgeHbcFEbWbTVnfBsmgp1XXdBS
 QaF2hoSE3ko09XBv4BLZz56sXR4NGaQ0X3jUv9htRmh+CLMJbT1jFz7EnM9ovUDke2I7
 iZdNY4INjNWvD3irGYmnBDpnbDOrKgm7jePTNA/D/S4+z0wWypAx3P51lV7zZ9jg22mU
 h2ojCzBd3YITPNFy9ctnIXdophLn3dXPev7d0kIijiCBhT6R+BFLuE6gr1/9C8L3k/R1
 wpxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmOQzH+cg0r8WVFBZvNl1mhvqLQRR/uN17EKZL5L7d+Q1DCSACdY8Vg+Wrf31Lbd0et1ZcivyEMyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNoGFmXJGCFtLZqJfrtDDwpsK9s4iZYhVofKFTQ3R8jr+F3GyT
 x2+gPuW8SreiCaEhrmsXp7o3bUxHlkJdxphdYq7R6zSXpxvyaoshBXDli1PvfXAIsSp4vwRXuLF
 FklD3q8rM3q5DwYZpxppyHAqzENM4iL/m1IGcNRQk5qkg0Uix1A91cvGvZ9RysL594gZDari2aB
 9nhG4=
X-Gm-Gg: ASbGncsIt2OW7rtDPHfwoD47cP36a+F/ifhUrV+S9Lt+CjL4pt7cUbhAwSyr/VGxzAf
 rJd1qL6yhZQ/MVrAMt7iPt1ubVMUPtT3e3C8r2c9+GC9WaWTRNZkfBTDcquro5CgPsnDp9/I/5t
 AZizIt9rlokNUnrd/WcWKTl2R3jymg/2ye8PUp3+sGbrGB2fMyBM/53rQIRsWi+jkVVkvwh4UNc
 FDAr7hEJNfVATAI3jXhv25yqOTeRYckZDGHKVQ0VvNgvPUCgXx0/Q/MORkXwvVmUxk7EXLr6mvt
 ey5Bbxndwc/PQyWhKJoGu5pXuXRJSaxw
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id
 d9443c01a7336-23601cf68cemr203519975ad.2.1749493485371; 
 Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2xRWfunGxYuE2OM2dbnnHB5b46Yn438TRpEDL3+xKAueWZPA4Xlpunoydd121jW5MCcyDKQ==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id
 d9443c01a7336-23601cf68cemr203519705ad.2.1749493484921; 
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fcea0sm58136435ad.103.2025.06.09.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 11:24:36 -0700
Message-ID: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ta0J_sxP6VsJVMG_nFAyC370SC-Buv3t
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684726ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Ta0J_sxP6VsJVMG_nFAyC370SC-Buv3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfXwlaC+apEEu9l
 OdjlGRvBYPbUeD5LcYfMu5O92qip/SXd/YtCUOTYIYpGNh4xx0UgcHkirdxiapFDhbE6aBON0Vx
 rohIU0SrAgbP3+M0oxFRefzO6KQ5M0+gQqvuauqRxIiC8qxxQErJromCXLhDxGHcdI+kaTCiJ7b
 2c3oP47wDs6TOF82vMhkJC0j0OzDfFEkYF0o729E0Ha0p0JFZeAi8LMYqhZaasNQ74g0EGO67Qn
 KAlg0+GuFInBVA7WFULvKV+LsET2HJ75goIBCoQVAG+V3cbPeS8M5Ag61YgpaePEa+Mc1hmiTp5
 B8S9Y3Tbs/YEuPfW2C8NHspQvFz/BpSKGK909rBWPW8RdJJqwL3GVJiW0fcMB7NeDlqVWVkcLgo
 KthT+2R4b1e+ktq3pf22QyOpjrcqUS+Lf5A7BQYdM5wdp5cfj4ELCGIWGTOsuzoXh7uaoMht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140
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

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..778e6ae7f137 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,9 +133,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, uint32_t *chipid)
+static int find_chipid(struct device_node *node, uint32_t *chipid)
 {
-	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
 
@@ -169,11 +168,12 @@ static int find_chipid(struct device *dev, uint32_t *chipid)
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
 	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
+		DRM_ERROR("%pOF: could not parse qcom,chipid: %d\n",
+			  node, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%pOF: Using legacy qcom,chipid binding!\n", node);
 
 	return 0;
 }
@@ -187,7 +187,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.chip_id);
+	ret = find_chipid(dev->of_node, &config.chip_id);
 	if (ret)
 		return ret;
 
-- 
2.49.0

