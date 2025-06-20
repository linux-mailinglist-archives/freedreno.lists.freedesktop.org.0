Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F47AE1DAB
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 16:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710FC10EB84;
	Fri, 20 Jun 2025 14:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7ohHmMa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB0D10EB79
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEcPeR020136
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=HRDy2PkiT+b
 Jp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=; b=b7ohHmMaBH6/bo1E7YjTnSPn0Fj
 zfq2f76Z0Z9cQwczCpob8P6YxOjr/sHaH3u7t2kCC+kA4yGG95VBl3zzj1D3zcmu
 JE4xhuHntjJtYVVSgNCZF4UEjKGrHnKZHPwAFy0CG2j8f1aNkZMm3YegvMXFfmJi
 75utTkipnb0Qy4sNwIJUJQDCiU1SR7lQDTo004Sy1VUHYANcH4Twd/BGkxolm/cr
 TVbsTcsV/HuX+yTFZ30zMkjtnwzGskFt7Xqz5fFgXsh2+RtIrlSKtXE4B7u7rR4Z
 Q/9vUZjfNpgJZDW3f0rixW4t/GoJEm4IE5CPXUslC1Qmh/VhONdlmRMhD0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp627s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7391d68617cso1650504b3a.0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430603; x=1751035403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRDy2PkiT+bJp3nZw0dqpJsJDfHdIbBg3CgFYYVmwzQ=;
 b=KpLnVDGZYfsVbtt2P20494/VawDZIs6PHkrnc1zy2MSjuSve+u/Va8ASWKi1jWAXDJ
 YUokFUFUvgJVG1Z6I9tYJhkgybYRAAzDyJot7ZoKhmF6LzlE/pfLa91gVYha/nNBZSi7
 eyJ02iYcHRtLWc2Kj40hf8/J3wSZYu02FzAD4S9gb51BxcRru6uzGQcsXiY5fqnn07WH
 Eq7Aa6hGGy3SX/v5tlrK0sU0X6oZj9NUkHcPy5kXOzhVdJVKM1sy1sgWtpx6sSd2bW0M
 kjA2agBZgiACGDT53i6uhvmiiR6sIFyF1WexLWavdx5PRTNw13Efkb24iUPaxbevXueX
 V4OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL+C9P//MeBu+6ANnsnVuJKrufCxrMMGBsMXZQH5cOSuXZWTeGMFC8fZQV5N0VdA21ABEqrsVPj9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFS2GfsSK4WxzQyLkKLtwJctOPZh0ZW3J42FsX7esT97b2jASn
 nlaJjwTPW8iJcVh99s+x6FCshYNRT4SU1AqWGm4A48rbrFQSrKDrEpqR2A+oWZgdx9RjffWZqI9
 bqz9YLNdAlMFrbJO/fx33+VkyWLBOsOdxhOTZzkKBCMXmvbeK6hHmj5GeiGiwGUr+r3FSirw=
X-Gm-Gg: ASbGncuJDmKJBWXhdZR2Sl4qQM1XOVLc1GhPsuwmFEeZML3qmqIIAmUdMSA52DHRmlv
 AmWelJLXs0HqI9S0qI/Zkt9BOKkjqCsgshiHsrmnKs9ARGPQBLtItEP4aFrKJnigFqIimeBliMY
 3sSiNb2D6lth/f6aWIfnYsxR6uh//QMf9FAWA39xBZEd7O488rPC0+x++aC3vIaAjKBzS3/2Fqu
 W3u8xGpd3cCzm4ebSp0kyEpLYKFTFS/Q54Q5bqydMklt0MyCY0afUbBuC6QBCEeg6+RqsUkhEMf
 ckUs35JfIMQ+zO8dDRLliTiOQjWG3b0k
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id
 adf61e73a8af0-2202915778dmr4964070637.4.1750430602936; 
 Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngm+bBwxJRzLg91zDCmzRMd4IZHrpLNM6IeTMuAbWKdDIwmWciPiCOoEVycUeYJx8shFpnA==
X-Received: by 2002:a05:6a20:d48c:b0:220:247:29e5 with SMTP id
 adf61e73a8af0-2202915778dmr4964024637.4.1750430602499; 
 Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f12427d9sm1598224a12.48.2025.06.20.07.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/fourcc: Add missing half-float formats
Date: Fri, 20 Jun 2025 07:43:08 -0700
Message-ID: <20250620144310.82590-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pv_nKUcQ_h_vXxlpTtZGqn0pnFGapnch
X-Proofpoint-ORIG-GUID: Pv_nKUcQ_h_vXxlpTtZGqn0pnFGapnch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX+GcAmRVG7UN5
 y68byQy/BvT/5uG2KkuXp5mB7iK2igTw5F/AinSr9mR8GldNmSCqOh0n9paNBkSYicGMPNtRygN
 BMuxpwEvZYKizkOyhGEj6iYeYxJ5a12m0r4yZgpjzeOLxGLfstyql3xcGSWkmUGR4r/i0zLwGE2
 w4/9ZOCvjavxbrmQQKCTHr4Zk/OqS68q+v51SvhXhThzLrmQOkSsWB/b3kUd++MjqvP57wD/peH
 EUmd/paSDaSlqq45mq+EiLHlphglknAUXf315Fg0M1dCflvMSuiDAWKlGNogPy3nT3VDZRC1ctu
 3MWI849tDD1DoUx/pmNbsB4jsI/d092xtqEga+Gxjf8RTUB3ndcEtAJQipSdq+Nh7Gt5uG+ZjqM
 ZOrBDrTTyDlVTVy+MALx3y9ohC9MIovcaEYYk9nl/+vg9p01bEijbYCE3W/e+AmkXs2DQEcI
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6855738b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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

