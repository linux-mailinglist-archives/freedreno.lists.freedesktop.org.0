Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107EAE8B92
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 19:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436F310E7A6;
	Wed, 25 Jun 2025 17:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwloIaqY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5410E7B0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBDwSa021620
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=L3IkuLMHxBT
 vbI+yz+IctwdTPNqPbXWCWa1wtpGui48=; b=VwloIaqYjPnsCDbew6FnKFsRP2k
 zWH1+upcU0ueRhEgPIQ/2T9l4y8v06qiu3ncrrPihAaCWKO+GkmprCMQ0ySuD/f1
 SIVl8B/5uTq/i1MPyjdcx4LZeQOU/00hw4UUhLh127/+tuyrbjUuQdFyQFHJNK13
 KpGeKgKMfRMGxlPzbRtvBptBfq2Z0e4jGrLDqTgX4lQPga0mxfbbPm+k4e1ERYoB
 u+1SZqHRm465Xarn39lxM/TdlVdvcY24u/GKjMMdGZBbZwB6a6DSj4o831m5xoSN
 EGya8NUKx4JB69Bzorsde4Z4nHAITx0d2PVhavSqVXttGyNCBf3q2IVX5tw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b010-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748a4f5e735so137205b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750873041; x=1751477841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3IkuLMHxBTvbI+yz+IctwdTPNqPbXWCWa1wtpGui48=;
 b=W4eX9rD4jumv1LU/sujLBtQLoUtf2R5vklVUL+OKHOBcrDyKkZviRYboWaNG7Rm7IQ
 +rWJePIbe/2YZkUPQ7dnyEtCDLuWcmkZo8JwBw/2XhQnWYrJhbCVzFSO36aLqoKEvFFl
 s+nkY1MuJSQfQ9OuucuU4u/olTyWgd0pXpyga7HkgXDqjv9JgBJARNK+B6vsP2ETz2kj
 1EjHob4C+CUJ5iEudC/Rq3Chiw6hTcEYLtuVA3JidfounW3KBMMygZS2F5iPjZH9omMw
 zBH+KJDenmXtl89TH05yCp55v5FEVT3qnF7TXg3er7WIoB+A7A5jdB6ZSjq28vH0y7By
 L0OQ==
X-Gm-Message-State: AOJu0Ywcc7A0qi9nxnPfrdKnW6AyRhDoEcQywmijkVjNp9pI4I2cN+eP
 BTMWzMkVfpbjelZIQl0eeyG/NKqSrexmjYKgk9kfbpZ1roLsZh0FbYRqWUshhngHaZpy049RFVD
 vyr6o/fQoD+y96ndn7vh34MLi4o2oI3eCGYihNWH0nx1XWhOmazxBCcbJ+3aVIfVHgeB5aF8=
X-Gm-Gg: ASbGncshk3DVVwxoybNqybPfs8Nj7H/hxRqQPCNRIn3AhLHxJAdj0AFs81NV5NU0HYW
 h3YvrvzVEncsfhZz72LxwmFLze774P/9XfIOq8PiD7d2aAMNINg0xpxMvjNN290Il9ovx6RCJjC
 qgk64eQ2K/60sLaRn+KDaJaDGBllDAYkaTnFiTvipEDodVlUscV69dZT2uBwOIjW76lCp5fT6Fo
 w5X4kAvkaFntN6eqIVbezfwCxqHVxF13FOqWuPvQsKD6EpXuuWUh6N/mLiB0aRwW5MK1ygVTFmM
 ULtcDUVqK8Tmu0PM4iJngnRF9u//KVPV
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id
 d2e1a72fcca58-74ad446b920mr6496022b3a.6.1750873040861; 
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaPLQjjw1Mco1AYfNaO1hktOiz7kntJ0uT+EkN12nTw8n3p877U5Ag/TwdHyi0A1rBcURknA==
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id
 d2e1a72fcca58-74ad446b920mr6495985b3a.6.1750873040378; 
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e09e1csm4775934b3a.5.2025.06.25.10.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/fourcc: Add missing half-float formats
Date: Wed, 25 Jun 2025 10:37:10 -0700
Message-ID: <20250625173712.116446-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX9eE7utm90hFl
 aiFfdpa9W0i7ESgVBvzznHQoGZokuQ2Vrd9tIqsCrajBVxWiS23JxA2jVL3/GMA3ZyqXpgb+nHi
 g62noiCw7d04RPD9+XdE0c7ovTsKPFzHn9APdwTvPR/9zCFResdeR9aFjBFXRFqPaXDV763hqqg
 cbrOb0gJ15kgyY3rFAY7ndMgz9k1Kjgrv2+XVefcbGg2WtaPNAku/ybgiavaaRF/aZ45pWwPN7I
 KRmD18J8Hi7Q5G7mvSmVdqrQRyTNQtUqa1ov0ZSeKjKu2sYDwTQDQQSdqi9LX3PDTqJmVGSdYoB
 aUsEFrJFSfSDTALzS5o1g8DPIsHFtflRhgHQEkQppN+ttrQLhTMxIY4BwscHIJdT1l3AlrAE5yj
 FXgbvLZuYAAIqUsMJRLYmkKBxSJMC+uKCnK8Evebs+jnVwUfx4URddz1hs4WlxIPgn++irtZ
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c33d1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: K5Da8X6jVbT8v7upnK1ub82K2Pi8Yft7
X-Proofpoint-ORIG-GUID: K5Da8X6jVbT8v7upnK1ub82K2Pi8Yft7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131
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

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

