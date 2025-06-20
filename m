Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C97AE1DAE
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 16:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B2710EB7E;
	Fri, 20 Jun 2025 14:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCA1p54R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585B610EB79
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K68lKs026662
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=J+2lD+C9IWf
 fZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=; b=NCA1p54Rd2ZCYrDO02fRdPJ2iGl
 IfVb7zMuZX7p50zl4CiuIno6CGD6xuRSScz6Bw5s+JQGFyS25QIZXVlIK6FMi41h
 lM0uxwQr9j1q8L0COi7Cp8WURrqQ2yuJZXXcoDn3Lo9rKVy6dMe3MbPqe9ROnA77
 hvpzs4nasF0Dne29rH9WCKDlfeDhKOku8Gy4OO8/rpzLLD4uFbd48UgLMI/w5GBK
 QLe4LvLkEMZqyw5kEun/FPE+RQyIoTmXt7N6GZ3OgnATlVqVzQw2FuL2Qt9CQS9W
 aTfNo+O6srT2ffCF+qUPKiLgbnNLZVxCU3RHeuCXc6uTogewTYIRQXWsLzg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mug0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748764d84feso2627514b3a.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430605; x=1751035405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+2lD+C9IWffZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=;
 b=g7PtIW+8vxrJS4lAyGr+nPIXDKw/74hgImOTez0xkrI1c+6olkExXZci0YQcLV+/8l
 HWZakBbRh6xtmcK5+tq1YmS5AvgLaDfKhKox+FRl1nGNHvWAR1O5nU4qqk2PfgO0fpJb
 /x2rS0561vsTb0+gqSwdH9750nOUJ6NR4KDZnNmDwRkjTSww+36KC/W0oCY9hGIFr5dl
 WkxRtkFmyKRibnEQkcJd/0Z+JZAyBJGV7ITOM2Frc+K+ivgFyNJ3L8KziA2ThgvZJx7M
 EGUuvuQR7QmzcNH1qDdAIxHNVpxjIG9XfRgLJnUOOBwKGguLyMMsNY3NQVZphdyLYpKc
 u6Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1dB7XODUhBx3NH5ztZuJEM4KD5mrH4+vxV6DR5mYx0UvRD8NLJOIYZ9W1uSiNVeIX9pJnxsXJaxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+xF0OHWlA9qX8Kpm5HPj6tFUsvtEEtQ8kzfdbf3PL+yDgk2TR
 uDGTWlps06ulsR8DcN9o3L2Ipzn7GQ3a8kPGp77BZyqVBbQobUkNktO8rUJnB86zYTr3Vd0BmGE
 0jnTllqeiu+qH5gvKiV3iwpmslRLwnaaDdLwwAWmZKJch8EYZhwlD7TpRMWUf16Bietyv7Kw=
X-Gm-Gg: ASbGncv3ICXz0ROwVkMLiK5fFz8DJ5t/9GhcvePj2lYtyV0x9xOH6KL065T5Bbq5KPr
 nRiMrKkds+P47s82tWReV6o/wGNTPYixjNBF8czB1nGW+C2OZiVM3JlC4jr5VO61kecIMahKOUD
 fxMwjZ+MgT09a+ZCYLun8wqkVLapiCnpNEfHVt7HSyCy75U90S8Vh1XYj7pRaMmRHaPGMDUvDgT
 cFM/y2xLbDvDGUM5MKSUTvdX4MJdq0SFDHQ4SYt/qU5B1Oyn7jbAId9Sxrq0LGb6m8LQm6c/2t/
 fo7qcmgnsGFWbd+2+14IfQqgb6ZdNAuH
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id
 adf61e73a8af0-22026ecb493mr6302524637.31.1750430604718; 
 Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4frWgXICqPFw0JBjaV+WPfDhCyw+89W/qX0OyG987B9ALxAgWvGk3pHM+gFofmw1YVoc3Q==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id
 adf61e73a8af0-22026ecb493mr6302481637.31.1750430604342; 
 Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118eebdsm1609718a12.6.2025.06.20.07.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/fourcc: Add 32b float formats
Date: Fri, 20 Jun 2025 07:43:09 -0700
Message-ID: <20250620144310.82590-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX1dYZVmPmuYtX
 f2PtkyLDYyFE6L/YFkTOGWHXUkvMkDWaPdQIQbmuUBrbaLR6mOLXp7hDvFuURgE9nki4BTHmDu2
 XQqvpVwrc6R8PwJFt/yrLbcPu3NqGyuuyqaRET2AnLO2T7xkjlPH2XZ07n559Y4uZWnBouGcZV8
 ITaL5p2HpLnuXzX9HWa1WBOeeC/FIj+Bb1F+cAXkecemlUMpYpYB8y2+ZlaWdrSoBHGbNQ/LCkI
 dYpA0cybanMwuQXKxvl6r+zLmzSo+ccSFAQq89u6rRtVmRxJYc13zpG/HlV0TfDYtLwlWVcI9d3
 w09Gsdwy+cP56ctDpmJbAa/06ULBvChqvuzcjXSyF/fFsCfsjR2VEcwWONQfL2glQDaw6sllBwU
 P8IeW9Hu7HQvmAQ/nEMeSuq6IH3idQwTtHlTcFU3MqbOSnea0KayTnurLPH+OI0t88krdPPi
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6855738d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=n6CFGpYek-_V9AMlogEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gK66WWm2zVadlheNduTODFZvjuFKt8aT
X-Proofpoint-ORIG-GUID: gK66WWm2zVadlheNduTODFZvjuFKt8aT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=965 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104
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

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..abf47dfcedc3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [15:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] R:G 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] R:G:B 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] R:G:B:A 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

