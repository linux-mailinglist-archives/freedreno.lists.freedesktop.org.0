Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D4AD24A0
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 19:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BE710E427;
	Mon,  9 Jun 2025 17:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFlIHAJW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA80310E412
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Yblb010274
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6W/371YKVn8
 zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=; b=jFlIHAJW7s0p0FYHzBnfKk//Jbs
 VM4Z6p2u44RLC8bDfVfumcgJQRvycWQFi4JH3/ojlWcq3nbke/Kr3fLJz+vbDx15
 8ZIovZEa5E5KuF2ZmJ78+jhhfDzPq87m3cYW1YFJqCnzyMP/364oP1RD7faHPPqD
 lbr3YPuX9qrJNhrJLeJ+uUmLbFG+iqJFVY2q3wCbdNSTBCp1aUzicjn3ZENPWpy6
 GKitUW3DlS7KMfA08gPznUeCUBjAZKd5MEaIexUl+hMx9nzPaz1e9p+Ejk7UE3RY
 /qf3Bd9zRoRuwjmqJb3hikSgbW+C8KSl+4/x/0cn1qqOqTsZ1derLMC0bgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jegns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747af0bf0ebso3461775b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488689; x=1750093489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W/371YKVn8zY+sgrwBLaaDGncwtCHPm73vufdI0Knw=;
 b=Tx2rLtegOXAcfpruoVbGBkgRKJiBVefqVCfYwNafeJSxOiYU4RwX0GgvLO3nBAfwNS
 7yeW9P0P3npXMoHseSPLyEaEqFkTTv4qJVZubbwW31EQ0bseHbHiBSC805sJXCBaOh2Y
 xMO43kg+Q6hC+ZOazobDLElrpDtygxEECPhwj+WGFMrECSNoe5lHVS5dH3s+R4FBCWij
 pJuvZiXfHbeTlgkKDyg3ZARyl3pQmhjFa/0Gx5Oi9bICVBsvW7c3frw3A+3yRk+p8bJU
 4tN+6rOWDASjgmfrqwdBGYjy7RlNTEC6fuXTIznCqyuPGXKUN4RMVoNKW8UZTadgsCBW
 a8IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPnjyrfo4I3/ORpMdw+iXj0LIKFLf1dzVIiXvaGFX1dQdfR67+anxTT6GiI6Q97wk5kXvd3vO2PvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysbG4f8xbjIWvHa5dIhK230arwvpsnNVFiFwQrZ/RGwbyngssK
 1hCiyz9lD2yZSrBzOLuP2wxe3txyBW/BzYFIhiXRYwEz+2B/dyN/G9eIlxcZ/8iiuKXVFU761Kw
 Zr+WrkLPHw1/SUFfO/rnSLwHSgHcs5kk4+RYl1nJpCrP8Huat4qKn7HGKid8A7k5G1CXDCuw=
X-Gm-Gg: ASbGncvxv09PLtGD9yb2cU+PoJawJlexLAGPRFRU9Szr5IUoIiMSiKItPl644Mrjxlu
 2tbKqJDthoov+ZOAzhlIRK/B+XEOt20h0iKvqzqC2oXwKB1XMwp0DmlpmXqzdGp5kNhuJYIzc3X
 85qcZRwnl2PC04FBQ4LsU0Jz0A3qilj7YWg6cnbMea1wpPm66ZXQkNTZ+FL2VCXPgXXz1YTph7M
 ECBQAD5NZpIdWW9xTzawjU+TeqXTSy6PzxlldxC4UqOv8kp6GCox0b1hFhA+SWzl50MqA7mk8S5
 UlgOsqmaFU5dJdsEEik0Ug==
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id
 d2e1a72fcca58-74827e4e9c7mr16970847b3a.5.1749488689477; 
 Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVMskIvufXApiy1mvHcQX0CnDdei1oN4pY7QtQVLahbgeU0gQD7OlQZ+oMMskVwE/QXOj6Uw==
X-Received: by 2002:a05:6a00:4f8e:b0:742:aecc:c46d with SMTP id
 d2e1a72fcca58-74827e4e9c7mr16970818b3a.5.1749488689086; 
 Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af7af0csm6186677b3a.62.2025.06.09.10.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:48 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 10:04:35 -0700
Message-ID: <20250609170438.20793-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68471432 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: eeH6oDivc6d1RdUMINbrEkRq7NRiio-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX04+te0q+cv8J
 OhOK954JUnctFw6NJ5CYYT+q9aZcUlR1Xi9H5h09cGJNN/3u3324+7nP1AfWzcYuh8HvHqLE+8B
 8n2oB4kIhG13RbR/H0PxIZUjVRZH/Sr2adwjN33A4iPoMhiMAfJNbjoLokApuuzwawaytwqN271
 51wHNMOp0tTULY2bxKgNgmnvsTKr6whsufGrtT+Q4eVGJpG+886DNAAO0Aj1iSjfooHwMqHjvdn
 eL3YKFdBgE/o2rCbmPhTygB9S72YA5RAHpmgT757eAmQRGG8iJWh7wzfGP02A3b4Va61D4tzRR0
 1SlimeCAVX2wniiWz6lVCGCt+ZF/yXGqsfy6CA1PdCEcIemAqeMEcafkxDPwWYKyLF31xHaS6gH
 w93gH123dTlVy2yhARG6LzKU8DAXzBWruWGC7fVEv6UZs3YXcHPMYJsEIG0Yp3Cbdjta5Z7C
X-Proofpoint-GUID: eeH6oDivc6d1RdUMINbrEkRq7NRiio-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090128
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..504174dbe6d6 100644
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
+		DRM_ERROR("%s: could not parse qcom,chipid: %d\n",
+			  node->full_name, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%s: Using legacy qcom,chipid binding!\n", node->full_name);
 
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

