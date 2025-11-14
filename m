Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743FC5B31A
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EC210E9A3;
	Fri, 14 Nov 2025 03:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxuxtLGs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Il7pvW/r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3947210E9A3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMafNH1477479
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=; b=UxuxtLGs26D0loYP
 xFC51oq4YvZKUe3E0FG9gEhczDfmadfPIIIMEHnolwcZTEIgkyYEoCFVEGZzTl8W
 TnahatBjLMVoUjjacJ7Ne1Q16riTlfuoJS0W7yD2MAi+I7k6/mQMkRM1fCQmxXTG
 tR888lqR4fp8rw5ByuITFTm78ujlZG87b7G7QJBnAp92FFqN5UsqzO+eZPVJNc7e
 Y/HWVSW1FjNWIjbG8q7NltKOJwbnLKLngsBTxQumXmkAa1bVeVg0el/7+TM4AoG2
 f1sq6PrUi0QOjrPqnVHkvKBxbzvGj8wcCdlb+Z2ppWgBl9ED78kfitNLdVZcXOhg
 yAW7iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9drps0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:44:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ecf9548410so42219701cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091843; x=1763696643;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
 b=Il7pvW/r8c1LsEDuXHnUagA+73rcfXq2wHn48F24GQWdiA20CQgZzBYWACgi6LT4aG
 4UYDO9okbKDml7b1/PdL3Gkqsy7mh7oaz70Ihg/Vg5QbsKd4bdCVopRAnabpURd6gdye
 k4wOYeXcu3u+I5rYqor23scBcMU/7hW3gDV5zrxLc7kGbB4H6U0ragHJE8s6pIM9gSvP
 ONCkhmr7iUTEqsruFj7Hw+t84AcQG/ACRQS6sw0UfkE2nfwu+bg84gNLbKse7c3MPoyr
 vJbc5giYTt8T7+4S3/Qy+f/g59zM1Zvv6Cz6hjONGWwJmQmsNxC92Kj7PIF12sVQdhvi
 LGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091843; x=1763696643;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
 b=lnaaPOOf/AyEWPfTQfNhyvXwx3WkTwoZoYnWJ1EUYtQELa02N06DTCukOVfjwwogAD
 M76HnTLfYeElyZ69sgZ9Hxv9JOGYuXrK5FPXcwDTUmQsJpXra35YyW0DTcfC3ylXbboh
 vhRcHXe9u2gwpiSieDRaAtn1M1fZdDWcjXAY9qxJOpWE9xdXAWgqNvPCAyBLONkMjfwa
 +Y3zl/dn/0QCBFCZfDIgjfMO9gS+WsFytVz5Ppudc6fTngB+tCGVlGd7ox0rHsEKM9rV
 Fo8AMJ3w6RN5dLJDEkGdoSOsEGW4fzM7Pq1+BpcGrvvQUDr2S8RZxAI9WQ+ODqj6e0dC
 HHmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpRAYGlz4UGaI+oTj/5S6qAotLoCo4tgY0+0nJ9kfgyL/KuznavjQbbCMCXHSkxDYBMfA7jiO/6VM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYwhm4O6dc4swWgQaTvGvUWPxO1F6SFknSPiwvdLGrG6ufCgPb
 RRjzsTjqVAkLcUnECEJU3JGpVVSBuur0uGj5lEbbocj+BelRLMf+4ecaq3gR9tB9GtAs+Vb/eib
 mTAfeFhNV3cIG/K5wrQiHme8UQigHkZOdTvF2XrV285REDbpn6aPDQVg5zHYXSwzDsFXdyUc=
X-Gm-Gg: ASbGncsNZDuY+LdOKES6yrFfuL1QwxKy2NfZ8e7C9S9vrJR1CNrNEY/lz8ETNNt9kzV
 9y0gWp5+RGeA206GzyKwLliWwUu6E1aBncuL58WhxAy96X4mGM9fP8QeOBxDYuY0Ui6WmWd400U
 trWby4g/chaO47EMCtpGjuf+uCiuS5L6mp9DBs61VeSlGOztLmrT9cY1D00JydvvP3HoTqPo/lp
 14BKo5YQRgKSb68nx7PQYmCnEzOfGVpbl65Uf/Qtld3sn0iVjKMbLhguIFluxgFAapaWAL4hmaW
 nFdyXhG0ijJW1wBibjSjAPhA/fnHdiOIp3H4ssuPO3cm4xldeQ/Fbz5/kt5n9DvG5+p7mRiRX0S
 hWrKlZ/G/PuFFMiFvLQiP7EiIasYMQWSivB6EiXBA5O9be7ksAfIgKGwTMXB8+RhSKFpThahfRJ
 5gkoVz25prIXXa
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id
 d75a77b69052e-4edf20a2ebbmr30359161cf.33.1763091842642; 
 Thu, 13 Nov 2025 19:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwydlmQi1HPZeW9fs89fnDZmZJmv/lIH/DUJMDvbdfrN/VzzbRgQ82VgzBNNBnbV3LjthPnA==
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id
 d75a77b69052e-4edf20a2ebbmr30358901cf.33.1763091842180; 
 Thu, 13 Nov 2025 19:44:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:37 +0200
Subject: [PATCH v3 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-10-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUZnMGZ8RYJTt+WDP6vzq+7HIixspEzZIdAITsMQctE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmLUBiiK4k/HpfCjqq+rN3BmuJFOagv8Vzb
 AnJXQgpTkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1YGrB/9Q0ll2wZj4R2ZP8LlcQLJoMrBOppkRGZ/8oJu7nB33LXE+Otq08nz/vR6tMvGbFs+reAH
 QYxZs6eTuovNzE4eYvnHZvWfUyfc0u/6FICnaTjizUqV7zQacSnxAGJodqyrj2gcs+3UQw85v0f
 YBGKp1YbQj8q+foGmsrmc0PaEiixLnkt7R/PjTwqpxHyQwWpRrf1ZvNN5FXoXpk6K6DJ5CGV5rL
 Wuji7zWsPlE1QSPPXyBa5Kocp5YgfIz1MZVrzAV8Jus9RgxIy2N5ljXo07BCP7kxntWnI4xD9/R
 M3QXTqd9/8SQlZqi8Yr4FVKVs09/trdRZaXipr9GBs9dC5KD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=6916a583 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LXKKReCMINRxZZtm_9URHsJkPkxSBXaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX2b2dJE32MDB8
 dRrXLsrE1H1tsupOFCUVTvSXJ9bnm2XolJsi2tDAtwEDkz69jVCHPRSfa9a9yMFD/1xW5knWU7p
 ZEV6AYnyYLF3njOpy/OWfTmcraiSYeQ/fdMZ8GV6eKvKAHy+ADjPpBh7VRmWstHadMogdDpkAhg
 ijfqaJRPhFNTV4Yv4m7d7hdulSoB35kV/EYexsSHeBPV4xdFHQE+b6cq16sRpdo3lN6T+VO9Rkg
 MYTUI77iCM2qOZ0ml8JOjw4PAkyHUvYEcgjnCRL+JJ6xeWK/7gsniWvjxHBlqNS5sF0Mu3rPaMB
 Ji40EKy5IHle9kn5pJJOoauZpVkB29FRKfdyzNSPDY6C3OghaQxzq8Zg49mOYFcY8zS8SgyxD7m
 9ZgOjRyQacoJWmkrctetqXfVgw/WSg==
X-Proofpoint-GUID: LXKKReCMINRxZZtm_9URHsJkPkxSBXaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
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

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b950bc827a36c231bcd4a9374e58cde6b41230bf..191d1f2a0cef7ed69342eceb35df0c3e99a0c373 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.47.3

