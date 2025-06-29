Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F81AECD23
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEE010E2A3;
	Sun, 29 Jun 2025 14:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLTgvGv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426E410E221
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T8UK62011319
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
 ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=EJLTgvGv7cM4pboAKIJUs/p0bC4
 u2ueRvFtICLimKNsS1h/VIeJUofb1d6od40yXmuGaEkw9HhzltPfGUbz6+qrncCv
 MiszvmyK/rZ5XIGyEU0XXxqNRXbUvyd+s9SjSV8MC7QQUipnzfLrBHm0rNZ6tfOO
 xT5z9oH2sFLbvpauyBPLWnvOSigzOT9YwA385m1jRebwmExy7S0NT/giJ0ZdF5JE
 DWctCccqYpzUNB2LK5fXsClVcbFNzuWlSiKqEQDqSpINBxTDB1k5pkFR4UiFytIL
 PXP9rCvvabH8QKuyaqoyei5woBqhITCbonti3xvNHvbJF2fny29dW2RwqvQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht666-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31f4a9f67cso1944922a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206054; x=1751810854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
 b=gKaZu6EXBNoo7itnTx5LZ0prcN1By5gCiD5ONBJeXZJZWltX0ySn74DBlREjJM+zl4
 HxrHnCsKq7cy6EgLYG8sl+WpGmg0KrIySh65pqHGm/G4/f2ie+mXd6On8Ea5ZW+9XC7V
 N+qFAhB730iYd/i/YDxr3BAZ7UofycoIev3Gq2V59tjMT717PxhyOASfwQdiueGOSKjQ
 VZrsxSScMBD6OCY3/CTXb0h+Gpxj+rjfHbgAcvuOZLXRVwOffe2GDm5FeZPI71RGBMJ0
 HuWvzumNlRP25Z6Az6pfDhOyFl4WwT0tGHAKIGYW6FH4DzxtP95g7XvgUdQtPftximkG
 Hm1Q==
X-Gm-Message-State: AOJu0YztWlEYGfRxGCVhW/UDKxoVlohMy8Y987013AUeHbkwGelcsRCF
 RZWYMsrETxxCrupZpDzlhgBQPfSAc1F/+obFT7NwDdL9+vREDoW8oV4ABqtSUqFWI5EzbXq82du
 fRhciBsFWKB6KTCrMvD7jWWB8drfkE8AYxuvxxzjHBNxSPwwHpnmrle+Y3RAoHd1p07eegoY=
X-Gm-Gg: ASbGncs7QO71dPSPQdXAq5SbqHaalg3O+cK0gt7XNkdLomrlKkKzqFHqsNMbRwpnX8r
 5vmCqHEkx8nEiVXkfndRIVkpt26LJH2cOGb2nd91sdzWB5Fd8KKXzXUCCzWVx0gF1tBr6vT+z6L
 81m8yeykMua6u10BQfrHRqrIE4DyPAXHgvn2zZ9HBnMB6E760nCpdLgqs4NIdCj4OQb09e3WG5V
 wuJm0hHlg/MaDySYZN8Ux6WJv6CLwQaWmLRkbw1OBnLiWjMIazbOb8cKc7ls+gF6R71Hgd0MVow
 gp0uedOTlbzA92D9eFyYHAdWSqX4LO8E
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id
 adf61e73a8af0-220a17f7369mr13582077637.42.1751206053811; 
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU+uDb51M4Be0+7RJfEMhzdKWdXH2VX5GhX5PZfc1zJAcJo7bdy/zfcmW3N5NdF26UuMWOGw==
X-Received: by 2002:a05:6a20:a11c:b0:218:59b:b2f4 with SMTP id
 adf61e73a8af0-220a17f7369mr13582043637.42.1751206053451; 
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54098b9sm6581953b3a.33.2025.06.29.07.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 07:03:15 -0700
Message-ID: <20250629140537.30850-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXwDd+ULEpT3Y5
 YVeuaX3t52XoFhDiSBOVQwcJPaHkJ1Axw0D+8T7X1cLw/itAIA7zYE8SPjcQHAqKtxhGdjMaJpF
 jsLB56ofpc/6lWy1DzQaF/0oKlOYzqEZbsh486dP9P+iOlh5/FRozjTRX+q3deM1kSE/BTS8y57
 uQP31QqeQFXEHGsblBo1V9zv7GaGAefvf45XmzeirpR0eeoIHltgQLgSLokTUTMgZ3w4tcR7hpq
 TeReN/4dHl/vMD2W42+C0tpqH+cvDnNVAKal6BYfERkaBODaSZgqzJjDGhdDsAcIbYJf2TMRjhU
 omZlu3PORJHhk06e/r0jGChTGet6O/qtcxvRu1QOKF2CiGdCGiCGCIOIt/GHDNDq0iATrF+DA66
 I6EQgZt42dV91HknzI3/ql7oRfMvZa4S3EHFiqnEIbVmdByp/LLMAc5h8y25OggtVaX2aS3a
X-Proofpoint-ORIG-GUID: eLIDauSGySXVOxue_siWNB3rcMw-AKkq
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=686148a6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: eLIDauSGySXVOxue_siWNB3rcMw-AKkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0

