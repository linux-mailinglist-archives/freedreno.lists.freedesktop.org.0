Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0245AF9DD1
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7CE10E369;
	Sat,  5 Jul 2025 02:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgOECNSY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD07310E369
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652BwiG028340
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=; b=WgOECNSYRBpkJFSq
 PXfO0eYc/wLmnq5P9Md7nr4Rgratd0h8EPQu+jyEv4aoaPa4AGnrYKL9xcEf6ZyV
 wRjiYI98SbgrHr/AF9/8Z3AVSt5ldGHtx8TbvVGinWfLNxMAT55BeM/4BpqnecKm
 SDYIp7cVdedEocLvzXwKdUcJs7pb+ZO5VDMjFtxP91xljVK+lDIEOdJ5KJAEW4Mc
 5MZp45v2RofqA00ksmDigmGCv4m5VeOsBKw6L7+V5wWChlJUC83+XD6DAuRECDkK
 4QjOjaKhA1TFZdIshu4UgNz5vdmp5tz0lWANYk/6K/xsaxIojxcumNLZZKkSt3JY
 IFtMrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag149-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d40f335529so382698685a.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683669; x=1752288469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPNRX6kvlGpl11U/TVdLyTY4+QGTQbEIYlMOf3sbM5g=;
 b=ICKAmxX1FC19wJQCMnrLhxJMam4a4NQi2zXmJq8Cp8pLendC7daKEi+iyP+Hm0Ab7u
 FeX7LFjnkvdAbIDgJ47WF2uy2JHHtcMnC8NxBUhmUWl1Cn3XUVZzN7Ss7o/2Z6e1oqsJ
 uC+Vl9soPSRLP0RTVJWWxZ5Huk/MkLIsNA+MsCtljQsb+B5EW/k/duY18Kg4sdzGVRCX
 SDc7/sVDZnpma3489iHup0V5FzhvWhi/Oa9wt7rpa8vl6Pl5QsTNCXn3jgGBmmS8vVdC
 t4uHuuwLU2v3crEJ+2X8peEJvpOQxSYg4YlSXRTSS71o48eRnqkGRBIO0A8oLiQu784i
 eagw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdL5a+xkCAUYNYGQS1stQUy42dshpyCSPtBYYK15R9C85XYX9ixsM4Gu3tzCq4xmok6+yU+IPYkW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym/vzZgiT3i2FpFXkh5U4ACCxESrcI5fp4QUoF4iSAgHqbuqtU
 06z3aOHqoCQFwwt/43/QxJ5ylXOVwrwChcVttgO8l0V01HYDt2IjjCnxPbUmDWqhTlqku2W6U8O
 cnOmiwrBqXfhOzhHK/c/xGhhPRBU5yx9hrYNN2YtQS2KhXVx7ghvLmk2zWfDD3qH6DtgcXls=
X-Gm-Gg: ASbGncvLQjOTGHpS9+6pcT03wHT8zwXZ24ejhqjfLLCAMISSgYTlzlNQicE4D6vsm+6
 1sp+6dx6OjefHnEVUkpClkNbxwGMcEzr0mAP++5GY1eVu8kgtKGxpqa8nUfCThbXU9yceQAJUfI
 MfY6rowrpF3oP5BNgQS/cILn7X5KTtl+EHD8AHgW9paYiMZKUa/ucNPwOfI72gYTalKET+HmhPk
 eDfE4jDYy33i5XXoja8Cq5oQADX8WDgrfhZHNJ7A+Tj4//tI/3V04DPJyD2/VMde27Inr9kaiC1
 bqZadstODzl9rb2KNvQjLQqqLtFPkPIU5XuBLSHnpOjh0dlOgL1WOGT+X7q18Hb15PenIKzei5C
 KP1Mn6Y2q1t+v3QCJs7oyaluejm9aXWAI7rA=
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id
 af79cd13be357-7d5dc6e4290mr791402385a.28.1751683669021; 
 Fri, 04 Jul 2025 19:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGzWE8i0pf3MCjcA4rpy8Ez0BO+QTKJR3Oss+otwH7sOxSUybDGPQWW0T6gEwmm6vgWjfSQ==
X-Received: by 2002:a05:620a:178f:b0:7ce:eb71:f500 with SMTP id
 af79cd13be357-7d5dc6e4290mr791400185a.28.1751683668595; 
 Fri, 04 Jul 2025 19:47:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:31 +0300
Subject: [PATCH 10/12] drm/msm/dpu: drop redundant num_planes assignment in
 _dpu_format_populate_plane_sizes*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-10-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hhBaxxZmnT13WRs7rFTvlNBQVmnytMkWjXau7MkDvsE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI93Vo2NjfFVLXURfm2DWRrzoITsNvbcjjtR
 WLL1k60AW2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1TuuB/9+9r8SQ53CMiMyOptheGx1W8C1fndkh8MksuIN/2D562HclCnxV61eA87X3N3cMyd7Ll4
 dkLWdX8kUHZUFYbD/g4ElGKqKlM/koSanNwns8MyCIPsyJLpz+MTmULcxS2RxE1RETCClc0SEOw
 xhtSRtXImd1nk6YYFbNSuiXWjhszBQAfYBJwSm+9c4JoCmLizFqjtakVaea91FEgXjAU1w24D3Z
 XgHd/RRZc8MMzqvIj0YbceWwAj9i+hPySayXXD3+wtuEqco7kkRNj1WWOPqkHroKPCMnamj7yFF
 qupDYNKFsuJ+6mE3cI8ZqIBKQORQjez0JhDJcGDM6hVos8/i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX0ZK0LqiuI1IC
 jJ/VQBWgVrRCEsqVBBJ36QEle7LoOSJQtqh8TtMiWMG4ccV68BUu4kiWz+ZtDG45ByHJPm46ik2
 8C3/CT7oGfMiyutZS6pfMYjDe4LiDP4GQpagCKBN4JtHYtOQEVW0NwxLH/MTaIsuHVuRsEAJiDw
 4FMm9A/STliUpP3XIiV1IJuabMpwT8wwitJmmVlurER5hhgMBhrryIXaiEyq/MZ1KPdhJdQ1GC9
 BNZlsUUVm/sEUO5pIUEWKJrgA+ELkBmMbc5mgwvc/J1UkjXBk9WRI1gPRD+GSRqrWG0CTo+1lF8
 3ELavCzd3bNmb6fK0R1cXZpK6nEHtpUEOyO/CV9zAxPAUop06uJ+A+M9v3agdyLP+DOscpBypEM
 JSC4G5xdrjFdjTbInVuKMVEWeAKgXhXbzU1CMMx9t/PDSrEZFHWkQZbXWkzfijeCvNyaFZHy
X-Proofpoint-ORIG-GUID: wFYjUFZ0WMlgd0rUBuHgzEeHxypPtP0-
X-Proofpoint-GUID: wFYjUFZ0WMlgd0rUBuHgzEeHxypPtP0-
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=977 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 195a6b7c4075eef40e7a5d0fee208168421cee35..e1fb7fd3b0b97a38880bc80aec26003d65a3a310 100644
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
2.39.5

