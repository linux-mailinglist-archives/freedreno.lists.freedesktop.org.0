Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6621AED0A6
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7175410E37D;
	Sun, 29 Jun 2025 20:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNA26lun";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86110E37F
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEjL7p018005
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
 a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=bNA26lunYr+ved4vKFT73ZKdg2I
 1epYMrVwBa5j/JKPC2aiwLSRVeTHlFzUqGPzH9kJRn6I6XHUb9gFL5gykmv2XTPY
 T378+Q/PSN/M5lQd2E9+cG6t3QPOCwuD/WItaZ0EoKAXcWZdm1fDswM1p1aEu5te
 Y0hZYHkh6pP7maHNBCGxtP/76DvHQTvrBoZB80TmrBQ2A4bCK6e38lzpatLP62Tw
 CJIgGvNHn3FmQ22nhz9RboXrNsMYUrA5gEhaxmiZA+ZrHhAvIy9yuvIzIGI4qsGu
 GthzmjiWBVeW2XHXyH2ODcKcHzBBybaTX6U/oQ3WyIxxjBGSvcdlskP0TpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23692793178so30038955ad.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228236; x=1751833036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
 b=EhvhJ0LLZ3P2IOSdjeuBMSU82fSuzA/0tJwPuAvvG1FXPLHkVUR6mJG8Uw6ikwXo/X
 9vB7bXcrvkjwJHh+WgP6ebaRvwVpCnm3TxkLbJYcRsj+1ynhKo/nYBdwB6N9BuoSS4Tl
 9HTXiBSuR9fNPIvcYDHHsN0aT7obJ8TRgn+zmopbDOP71EA9gE43+GoMndzhODRUCjsB
 2qHHnG57ALhDN8jDN9lagTk4h+KM0vageNiwmQXAfiIqXgnX4+FHozXHCDXxzkaeUzEM
 FIeQVM9uDdAu50HMzvECwNWMiDj779xVeSQuaXTps0ZchiXZs672a0j8Sohgr2T825z7
 FoLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFzJzvYUKEDxXnEbcZtXJnsz9KJ1BtfuBD3622spmZ0dqU8z/FM1ErbPOrji23c6Zr/ecTckSRYII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAFo/VRpVAZlQbqop4Ho0IpzBz/fHwupISe7S5rDh4Cl06d1/O
 qxd5okZpcoMtwGXw2ljbcfsJ8e8bAlPuInp4yh9mAvoj44YClsMa2ofZ7rVQORmmvW0HHiRbfBS
 Us1ISp3T+75lFCGQjT7iNgHNxN+lAmw1FLTSUYN4R4GL7y4tAUUEOICkX+CtoMtk+kVglA0g=
X-Gm-Gg: ASbGncsKYNr0XipYXRjjFI8+4MWAWTCibYUf33cxM0AiyTjICsH/jQNiLFSWEzkgNjw
 17GK+gTzjfQVpUyKcbX16VVu1LAlm9emTkfyzMpkQGCLznIV+j8K/8NpfBJd9ZH1SuxmKHOFovc
 MF8A1K7p/FH+MqMXuAGECHX1e+j4DJHD5gpwFhp/H0WmJfhJSIvYplnZ9LspHWYPQJ7t4zcT/4W
 fTwssqh1mlLP7ZB2+9o4ZSL/LNbMKSXaNSebVE8wh2G7WIxlwjZK3lMJonWa/yYUdXZPbffCZQM
 oQ1u2+q+bkwv2pka8tk30xB5tEg4rBaQuw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id
 d9443c01a7336-23ac487c9b4mr181492835ad.35.1751228236513; 
 Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbqKK4XP+eBPgJHXyazG13c3Qw9Vds2B4hlk1UpKPfkqCJy6P8j6VSj/+TGEYyxHjNQNNVqw==
X-Received: by 2002:a17:903:3d0d:b0:235:ea0d:ae21 with SMTP id
 d9443c01a7336-23ac487c9b4mr181492615ad.35.1751228236130; 
 Sun, 29 Jun 2025 13:17:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3013d7csm6301398a12.11.2025.06.29.13.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 13:13:23 -0700
Message-ID: <20250629201530.25775-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XtmDOzYCJ0iYlRM2_mtPfdCeUBYZX44g
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f4d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XtmDOzYCJ0iYlRM2_mtPfdCeUBYZX44g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXwLrk9bAT9dyJ
 TDlNdXmzCUoDpSjf+8gNzWHePa7ITfWMIrsv24yBKZZcYRPw3db1epsCvDL8UyVRehUnnYlDg5K
 odL7G9CQRRhvuziyDbQ/p/lgy3ieu2B+SfXLg7n+zjMAbCV+/0tq58IzydRLa2KzOEViO3Nn52C
 kmaaPd1HBsmOfaT5TZXFs/F1XURX7G45v4XxOgfMeEkfvP8EeO2h5ckOL87q6Kqamwur3gVgNgt
 uK/8gzm+JYTX66qwseYfkPRW+Xiqbr6Er756YRYt0au0Z4TQSVc/+M4LN+2OUZ8xE+mAfdI0hxX
 ZzJ14EOrQ9jdruIqACuihWptREh2akNCLuqw2LAGlyR7Ep4Z7+7p2gt/PJ+p7qIweTHKwUP3fQN
 BiDCw0l9YjRJeGWyl6NoP3hH7ZOTRCRhLijqse+sNRwFD11+4ByaCT9lgyVzQq6KD0hXePuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7881afa3a75a..9b1f1c1a41d4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.50.0

