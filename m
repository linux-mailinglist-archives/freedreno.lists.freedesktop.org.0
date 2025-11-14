Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B26C5B319
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8471010E9A5;
	Fri, 14 Nov 2025 03:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXXbb0a1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6Hoi+EA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7409410E9A4
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb4Bv1488258
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=; b=eXXbb0a1B8BWaG8W
 gHomVmNysDx/s/fqTXMXUE6i80MtIYuX7RHZpXcVLPc2ltv/xxm2MGPyjD2pQG52
 iGvu7/lqwxFSNP5Z1SYzLXCHn9qyMC0wKPu+ljtue8FU1ba7iagPTtBmqFIX3Uk1
 wOz7IdNwDqivh+n7I0pz9EdIJB+weRWgR25YdC8NoTm6RYq1z4UxOpAsR8F6nx9p
 Yckr7JE8u2L56o4rD1tIqTNQ/c9H7Sr15UMxvCwkBP4hwpPGRWhqCZwEYJEStLuu
 vEWx3QobTOIvGDel1qWUJMfJNX8ui5R8NQnWaB+5i0U/jmuQvKhQJ80PQUqYM52c
 iJhqYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrpgc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed69f9ce96so71883101cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091840; x=1763696640;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
 b=U6Hoi+EA2Kp25wlq7x7sFaZEuooEnLxPyllqR6J9XWss643XD+YeSEoO+3TAIOHhvM
 gf9WgPWz1HwngnqEaXsPQTMTFc5IJH2dxDh8hfVWhgbWTXjTOrFG/PMRDTr9SB3GiXQ5
 bFJlbFjsDyfRWrAZXvOPakK4iZ2MAK+NQAl6X+kqYFJEf6Yl0AmMWFWPTs6Z781eyLHs
 6kOpo9UDv8/r8x14DqqHT1oT7vq3196Y6nLLtzaSuCcebRlPGXHO9Eq5sHNKVKwhwXoa
 wvsgKOMg+4LtKdIwneSwc4KD28bYmGpZwp1LZUKM2w3WGfq34jz7ntBrTU04kcmOgBcJ
 yKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091840; x=1763696640;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UL6FC9bIfdJnNxJU/an98ngZcCH19v69FY5RCyV+0QY=;
 b=BOEN8YYU5NLMN3P01DcFuSdPhiY0mkILxZZdYIcrciVm7p0knXKTseKWqcZ3NvpKXb
 NGrR5oJkjS/SD5d1OLG97YOptjTEfl743wvOLcfMa9LQCF/mGHYwavMknq8+cVvrhlPT
 P4CGqwLYjVL6Ni6mZRGO2WqgAKaHIirLqrTqSHmALp5h0rcs0WB17/oAfpQ/CzHUDccI
 kSaas2xYo5FrCBKrelSFbjphdz2fdbnJPGgkYjAZaQ2vdca45Qt6ds6kPev0R2skIAdM
 rrOjGWNoC11vanJRTXUieW5uVonLCTezp8sfBQAiSWjieRBujVXNvqS9UxXay934N69b
 4AeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt4O9n4Acn145E5c78YgYLuCUvD/AQWDNQbJRDeiHuGRFbsEkHonRI6nJCA7UYEJF82nmzsrmgzvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbjQJVSyriMFFi2hDo4H0hM43e52NDRwAiAbEYdQhq/y4O8rn/
 ktztYpAv6WGRFi07gkX4U4Quq6db4QpPqncAiFwZUGM5kNUJU7iv/EVR/m4FOiL37F4ICfhtnaW
 Du2tLs4ziN95ZGmqHoCgdqwZLOg2QyZivbiz0IaV2Z+NLaWdg4ZCSq6e5zJoMWh1VtdCObzbRel
 rf/8Q=
X-Gm-Gg: ASbGncu+F99Zudh6iKgmHR2UUfajgH59sIQV4hvDcYFm7jjxTjyfWKblxCF74iIXm+2
 zl7RmkmBmqU/ikDOrcHNJPufXxputsZSLDNFfnx4EkPS/N/A51l64krnGdzlvK/g80rb3Xisnp0
 OygmmKmtTEYXHM9Mv8cXPOQJyQGBpJx1gaYXQbjP5xOhFxns1wZVPgMVDOjMh2HndxuB92tE1Ym
 fOZEyV6Xd5iwGDKbpwjtly+xKGkkv0qgfiMYlZhRVeN71s9lrjbO2Gtkx13GVP2pUKYUUww7zNI
 HKOOTPZl8hwejZujp4qvebP1pG0jL1TF3qJEBqPi4AqKO1lDQsMlaAIxEBKFVq1Zsj6OiBrzdbk
 p3zgUXMVkrsA1g+PORr/mR7uyqN0fAN9lMa4KdAXPq65/+wIQS1LI2y6cEUdSihzKF5unuGi6ue
 geM7kAt1QEGSdh
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id
 d75a77b69052e-4edf20f2099mr28389071cf.46.1763091839093; 
 Thu, 13 Nov 2025 19:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe2f8Lbu/FOfX0YvReppPSRPSbE6n0Feh23vOIUQ3hbCBCeNR7YOxB4VSUBHICdkaTUVgLBg==
X-Received: by 2002:a05:622a:1207:b0:4ed:6ab0:bd26 with SMTP id
 d75a77b69052e-4edf20f2099mr28388911cf.46.1763091838685; 
 Thu, 13 Nov 2025 19:43:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:36 +0200
Subject: [PATCH v3 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-9-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WoQwPaYT17nL1Br+zX86+Qp7PWFhUGo91Cg+FYjNB8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVm2tsEv2hoR8XMz8JMeahilwCJlIU6yMZ5o
 dvD64b7SnyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QNtCAChN5raUEgXaH9Dt67R9m/vCMZ/98khRA2EVXfuP1MyoDd/+K4hqhkCU3jjNq4QU2RXoN2
 l280nV60PoHcT6GZ6cdk04F0zo6t8g4/uLQJcr5fZ7cg6aR9HGldq2BTfu62DWrRHf0HZ0PZVni
 6glUfFUbqzREppdeUVE8VaBdIu6eOZKQuf86v0AF3INhhD0eUb7BRScn2ddKSWmdtzrXq1wZK6u
 jl+xJA/+sSJwQKsY1HY6pwCz5ImfJizGMAXpOduJQetFmZwaNFItlWtvX+oFaSsP08LJt6Ea0Yb
 iYHZnyQRgilGaye25pyivkYcmOfpuQ3VEIdpXQJwWMhu8zFr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yjoAs3CCYxTQgyOaJCNpyuzGDZflkLV2
X-Proofpoint-ORIG-GUID: yjoAs3CCYxTQgyOaJCNpyuzGDZflkLV2
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916a580 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d-fElJfPDvRUhmvKT08A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfXx6SH+Zz+Epru
 aJlElhxmKg2bVEematNa/dMh+JCifFomyJjHWV8AjeR2S9rkFobMqw3JZG5zlRbPXs+M4wFE78D
 iLQGhxVXqbAx+DAEKNHAvVnnbmoIWiDGi7L4aVVqCczJ6jtutEIfCPs0u7k02rfZhVGuCcsyC3b
 3KXHKwbx1j2QZWPdpGb5Mq0No1EFHZuWy7hAcpdNdp1dUJR8C787Bc/eZBzWkTTMOBzinhj/FwM
 xfqGe0J0dy8keQD+8kdfxUD8U3homzB05nx7/n5DBvss4twPIcKV9dzQEte3oATt/FnvNjI7ZNz
 Q2hXNB23SnPnVZxuWkjuxHHyeJB3L7CLsDeAh7+3tMwP1T0CHra8rjRA5PUEseJ95Cbt7/O7Fra
 ONZwuCQI4LSC7L5JWOgLZa8hLcXG6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
_linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
duplication and simplifying code flow fror the UBWC function.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b0d585c5315ca0d459c7ab7f936f1ae350a4a520..b950bc827a36c231bcd4a9374e58cde6b41230bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	int i;
 	int color;
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
 		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
@@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
 
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
@@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
-			goto done;
+			return 0;
+
 		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
@@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 	}
 
-done:
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 {
 	int i;
 
-	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->width = fb->width;
-	layout->height = fb->height;
-	layout->num_planes = fmt->num_planes;
-
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
@@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 		}
 	}
 
-	for (i = 0; i < DPU_MAX_PLANES; i++)
-		layout->total_size += layout->plane_size[i];
-
 	return 0;
 }
 
@@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
 		struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
+	int ret, i;
 
 	if (!layout || !fb) {
 		DRM_ERROR("invalid pointer\n");
@@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
 
 	fmt = msm_framebuffer_format(fb);
 
+	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
+	layout->width = fb->width;
+	layout->height = fb->height;
+	layout->num_planes = fmt->num_planes;
+
 	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
-		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
+	else
+		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 
-	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < DPU_MAX_PLANES; i++)
+		layout->total_size += layout->plane_size[i];
+
+	return 0;
 }
 
 static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,

-- 
2.47.3

