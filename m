Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB242C2962C
	for <lists+freedreno@lfdr.de>; Sun, 02 Nov 2025 21:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2D10E084;
	Sun,  2 Nov 2025 20:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWBWx/yB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBQmeO3B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845B810E035
 for <freedreno@lists.freedesktop.org>; Sun,  2 Nov 2025 20:18:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2GgO26754153
 for <freedreno@lists.freedesktop.org>; Sun, 2 Nov 2025 20:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=OdVVm5Vn5j16GpFoAhqQIq
 kr1rOrtokzqAEudEAWiB4=; b=eWBWx/yBwG72a6CpbkESp/9Gkwnt77AY/pYIwS
 yYqyC+jqv8tPPpasAzcKX2ocmcQeO+wWq1d7898YSkuvqCkSwI7R1rPjxyAQ6Z8F
 0YtfdiuJwp5evM8vkC+u32rVIcTUswoeCkp1lkiLl21HDkX9jCEv9NPPmyVBxNN8
 wwsa2otK4V6BRpNwmCeO6lVcTpnauY+RTyssg6Z/1ynVA0bHBRiDhR4btXmEsq9z
 3kzbS7Ljtfnm4hnLZvJAO+IMH3n7vPTOpJJG+/pjKsS5zqIghfXd0MLrfpDj6UGL
 zCE9X6b4/yqu6GD8M2//ibphGpg2xa6ARf8a8n7ubcu6HxJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn2t1h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 02 Nov 2025 20:18:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecfa212e61so167439351cf.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Nov 2025 12:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762114694; x=1762719494;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OdVVm5Vn5j16GpFoAhqQIqkr1rOrtokzqAEudEAWiB4=;
 b=ZBQmeO3BKyRYQzZaPKtBBqhflhLU+8I9apdu9lBQ3e6VGbwN5HERWx7rqMHmsw8/Km
 79b9UBN28c0b7WE6ECN9yEhu6nCnfmm2wHABkrFbRf+SuLr/EQDucQoDHPT9az0UfSml
 gmi1998kOnO/rJwOnBwdrZ8LGB0sNEEE1Ex/jQNaDSAQxYfDzT+dW/Is/Sn8xQRCnTLp
 LX/zm4du6L+KH26rJHAW05hkWbEdB+4fylsyWpVi3ImkW2QfJD5V2xqZieND9QcjmQ2O
 9xjonk8HqXIYC8yoqCH2h+Hq2g60UA4V1I1XRd4Q8cdCbQh8PXgU+05qloL8qHutmOTF
 KBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762114694; x=1762719494;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdVVm5Vn5j16GpFoAhqQIqkr1rOrtokzqAEudEAWiB4=;
 b=CLif6XxFZnSeht+iiJZ5NR5/BTKfJ4EntoT6A1yeIZBx67PJLfwDItBJ/RlNlG8O51
 iSai0NwCkRp83dRuRYa1a3m+BxgI164yX2DzeeDON3TDUhwmJPfa/siFvM++R1mhMfwW
 3cczNEZqN8Rq6joRGkvPvQO056Nj1my4AkrdzTooAWxznQDR4OE14SPWTnZ/+X8BXKeq
 Pf3KRLCKDwhq9MIt0DWRQNyWoDj0MAPtirZuhlLoz6mYjFm2Gld3Yb+VPthY1FenAhyW
 iz+vsd/tmbxKdeobwwW4qkbEbAilZI8Uea5oRrqB17WFvuK1AQ3veGxhdguwZYquWK7X
 gOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3jLzbsvQAFQsVihMwkK0lB0Kcu7hu+fDir7C6fvvfbZjhqX7LzxIcvchi1UTjavTSUZdGUo7Xxiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIH9YHxu4swyf+mTlaKl00VVbiHY+GaAVVoXYoeIQ9+B3p2dmU
 Dkj2LbjRHRMnT6tSsYpJHy4CIUD/uLk+OAVBcA3FvjhiIcG+o+tY7fmloudaOqyQIuKiIMefBbn
 i5HGn1b7vjXdQsfzibrp17eD3HPeqlVN5TvhMjPefC0d/MshXuwiHcxAxuX5z79BAIEB5jwM=
X-Gm-Gg: ASbGncvHohPRiP8k1m1j6Qexbg3QfoJShGGopAiYLxs6OWsR+HG8Fc2Tn4sh2ZwduNH
 O724Y1moVUhDn6R1HWpURKd+Enga3NroB5ObGBBuBK1nvzSlQ0LYx1xRrgqDEwrShljYtJMBL5z
 jyeinlYe0uPIDoCp+4uIQvNrMH9XuitSRDyeD6Gh/UtpnLXMKwe7ZzPq9in6eQwSrzuaxNMhX/b
 q587DP2JYaW3JG402kRwdA4FR0w1JaOEIJs6+ozM0zY68/+pvmmr716wE+wAERyasrddjzW6T4l
 2EC/AfOBJhrJS3eReh2IlZm7lCbiDxMfDL1jTyd47X5h9bHddmtlGSS3hjbTUW8uyUdcAJLuN2O
 k+D3Qwxi0HpBYJD1C9FS87JUVoICIg5m6PD4GZUEH1cnyAR8EGJ91XobGW034EmEdgFvVbW4RT9
 yqgNJQLwEzRQaB
X-Received: by 2002:ac8:5a93:0:b0:4e8:a1f9:cdd4 with SMTP id
 d75a77b69052e-4ed217b672fmr170989371cf.1.1762114693660; 
 Sun, 02 Nov 2025 12:18:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNY0tTsWpJIEVOwgyhh2aDBh15yHlc+p7d7sVA9dguQynWO7J16BHzPL9ZYWnQ2g3x4FEhEg==
X-Received: by 2002:ac8:5a93:0:b0:4e8:a1f9:cdd4 with SMTP id
 d75a77b69052e-4ed217b672fmr170988921cf.1.1762114692957; 
 Sun, 02 Nov 2025 12:18:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a1bfb45easm17907781fa.16.2025.11.02.12.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 12:18:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 22:17:48 +0200
Subject: [PATCH] drm/msm: fix allocation of dumb buffers for non-RGB
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-drm-msm-fix-nv12-v1-1-096dbcb4a51f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGu8B2kC/x2MSQqAMAwAv1JyNtBEBPEr4sElag6t0kARpH+3e
 ByGmRdMkorB4F5IktX0ihWocbCeczwEdasM7Lkj8oxbChgs4K4PxkyMRLuXfm1pYYGa3Umq+5f
 jVMoHgmpqXGIAAAA=
X-Change-ID: 20251102-drm-msm-fix-nv12-11f0e8c31b2e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=erLQdH2hFyuTRZMYIjIe/j6tIxDdwbeINvkt2RfUKbo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpB7yD/G8dYX1IJ/v5RG27i7L8oP+YwceUGEdgy
 xxQklGIHouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQe8gwAKCRCLPIo+Aiko
 1YAlB/9GFWDG6Qs9XLi9san0VImTyWb/8ucy6+dKwfetnjjNWWqTV6h9suB0PIILnfPIg/PvwWR
 HSNwXfM3XHKNL+ap2sUdQ1/2zyqeYN/xgSXQzDherzVvdQ6JYyb87GrkigsAvK1KNURR5B+KhP3
 RDuf0rkmPcK0qVB70Juu3bUznxyVR7vWMsin/XP9HOWYyi11I+VJx5fE0Pa8RYmkYcVC5lsL6p6
 HFB2Z7SbxxwfCFUX4ylfzgD68J+OAhPZEKiVASwIxQKosrFAR2A9vGNM+mhaWzKT9v51A0UeC6W
 gEna0BLv7NPDxHlGTYOkuBLUZ3wU2u1uNDlODZbduVbi8s5l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=6907bc86 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KVldPKIrq6pl5aLy4YAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Y30DYeI4soSnmMRfnsuqTD8IMiYXtXtL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE4NyBTYWx0ZWRfX3JXMYi+5X6Ns
 BAdi5UKjHvedsH0LZs7N3JYqNBOO7OWUd0Bww36YfdOfwrRguk/lJWyIeI9YKTuqFOQGASFnxRi
 H2ZtOdL6O6M1brbgJhZTgybPvshQyK3b5PmGtySozSgTAWCf+igisqsDKK2WmGjhtumZ+9YKpm5
 mzfXQofSotp8U3O+moS4NbXSVo/lJqycRAjdjaKuEIXuejniAqfN2O+PXpyrJ4u6o6wghuBh+Mh
 c1DLJ3C2wdj/BHyqiY1vm4LIYOr6n4hJ2fHTbvjU4slJ3/pB4vjKgXlaljVp++Og8M6FNbXwHtE
 yXG+dsFqrl2D94nidzWj3TJPwNYNU+urHIwYgeAuvxd5JpYHCK+nXHSsaFkgze8okFISzDcMImr
 qaGjsFUlFcGbtIx939RwY353OZWelg==
X-Proofpoint-ORIG-GUID: Y30DYeI4soSnmMRfnsuqTD8IMiYXtXtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020187
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

Several users (including IGT kms_getfb tests) allocate DUMB buffers for
YUV data. Commit 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with
drm_mode_size_dumb()") broke that usecase, since in those cases
drm_driver_color_mode_format() returns DRM_FORMAT_INVALID.

Handle the YUV usecase, aligning to 32-bit pixels.

Fixes: 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()")
Closes: https://lore.kernel.org/all/vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 435c0067c2641786ca7b4a42cca0ae7e7dda3451..b9cfdb2ff33b63b92cff2568db491d0692bbe459 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -701,7 +701,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
 	u32 fourcc;
-	const struct drm_format_info *info;
 	u64 pitch_align;
 	int ret;
 
@@ -711,12 +710,16 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	 * Use the result as pitch alignment.
 	 */
 	fourcc = drm_driver_color_mode_format(dev, args->bpp);
-	if (fourcc == DRM_FORMAT_INVALID)
-		return -EINVAL;
-	info = drm_format_info(fourcc);
-	if (!info)
-		return -EINVAL;
-	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info;
+
+		info = drm_format_info(fourcc);
+		if (!info)
+			return -EINVAL;
+		pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	} else {
+		pitch_align = round_up(args->width, SZ_32) * DIV_ROUND_UP(args->bpp, SZ_8);
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);

---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20251102-drm-msm-fix-nv12-11f0e8c31b2e

Best regards,
-- 
With best wishes
Dmitry

