Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810EAECD5B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5F10E35F;
	Sun, 29 Jun 2025 14:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrLv/1jz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181610E358
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T3qUN5024556
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=k07yEnAyEzE
 a9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=; b=BrLv/1jz9HuoGFdTMkip3HYRli4
 mZUyfD8ATY8tG0dbrEqCF+eY7hbeRdvP5hBt+g0GP+PkyDeJL5+LuxFHp7KBU9kh
 xCu4c5ivPZtVQuGgC736sAROPGlmBn9/gMAqJx/5Aiqm8kgd/1v1kExS+jQh+6lc
 JRxd35QrvyQPrCj1nEeMyXIhX3zT/vUZjUaGlMOoo2YXmXSi5jGBQuEY2aIAK74J
 +yMjdY38vniDkBYiBow/vCT8ll/bSMOn7aif0pRjENgvU+ZqfsL/nuzS+MwmReXM
 Evn4MUrEY4AYWf7XaOQgS7HLaTqKXlGtQ7Ir5cBt83nUXr7R7ozV32P4F3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2f0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2fa1a84566so917630a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206098; x=1751810898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k07yEnAyEzEa9/0q+Hpj8bv2+DIU1Tpq9KBSOGFREQM=;
 b=NrnL5h5hEpszBq8bdKfKKOkYokzS3yBP4mSUCPqvSl6rrbvDrbTtTlrdQw+6TR9R9B
 2HB52Pj/PYwkRacB3EKXYR5Uo14oOoWgYQ45Tx4EJjBg+gsu09bOJyQVxBGfuTXBBPlJ
 y49LVXhlYNS5phOkGaUid3sVQTXpzvsmVe6JTxjXX8J7FtA5qY0syahsHh46knlYJE38
 ndVBymu3vfx/6HA5/VwCpEeMVzHB5atl4L8euH2n7s14QIul85rX3OMRVNizMga9LGSm
 ZGgvXNnW+4wkz0R/vcUyRjatVmRm+8RpZhKHksx+pOmr+koPhXrfpXsH+T4jOzLA4o/u
 E8VQ==
X-Gm-Message-State: AOJu0YzEz/vFNbUpkrF2c6rf/tDtjVpkWGhQOCTHVsRSCTUmeWCPO5+W
 pA05gI/4DaqPPVPm1ciR87r8WK9bSJxPDn/QGiJinzoMQRGu/0xegyfxG47c+7rCUovsOwwOY2g
 /NW6xzB/fMaHIOD4MYnLeO82rmyVV90wxTRsZrur+1Ta+YYzxgESc7qmnDaDqgV1ky9kw2Mo=
X-Gm-Gg: ASbGncsb6eMVSX+Y4vf4+b2CtTJb5/PWqDvxzB4g+yQ+EwR/XLXVbwujUBL2ykP48Ep
 BnaYztOJzzJkrF0B5GbRgIjUM3iBJYeABwT0pp5OPP2EF3RfTIiCwi8c54VU7ds/dmEOm8UjPJm
 W6WoLhneD/LtXkFlr28dP23QQSO702fimDTMLTPZw+d2cuW1o7palS545YA5oaEmtH64vw2+Av8
 qXAuAAPY+xKt7I0i9DcuIiJiRgu2Ewc8aPD2nOk0dYPDiFc0f7h6q7xgcOcwqLbKj8/xA3UwmUV
 9UKJv/xgCd/q1DeIiqUowRwRFz7y+Pcx
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-220a12a6673mr15927723637.2.1751206098451; 
 Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUhzRnC2Gzmes1F+eCUOlvqyKWiSWRnUQbOPPUCyCwcoSzMtVgC+1PBHnNQkUf+FfAkfUkNw==
X-Received: by 2002:a05:6a21:393:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-220a12a6673mr15927685637.2.1751206098054; 
 Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5571b7asm6905338b3a.85.2025.06.29.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 40/42] drm/msm: Bump UAPI version
Date: Sun, 29 Jun 2025 07:03:43 -0700
Message-ID: <20250629140537.30850-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eY-MGz-yDQxlzk1Q6yJRVnC4M0lI6b3T
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: eY-MGz-yDQxlzk1Q6yJRVnC4M0lI6b3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3rF3CH30sUFt
 RkNUOMhlYUHoKkv7xqxMlx9XBxfPZtTAto7jCikoaCcJdM1QLwc0HbdD0lDM+q4GaflqJ9cb58k
 kJcc6CLsNxqHe1lSRtVMBnwD9zh7wru9Bn3fnNZfcstr688xpVDNpqdCUuJQophIdTRJM/o8Yve
 Xn+RBrauwfvdOkJz4iVg9qNiLiXI/KqCHUIuhqLm4WL+NkYvYl3l7lFPrtrRjRkMTS8slmFoZw9
 nvBk2LVXnvntAWq5nqaRT2Vu/krK97DmL+VadF9ujW9XFDqfcl2/hsQCqFCaOxGeQSCbYO8AhQl
 8vMLqUNrbwwH+Eh+f6ICF2ivxBucfL/VNJ5VZAYiDYqirOIz45Hd4u/jSDL6kKIlK82RWsflGnP
 uzliF2vmLr4lfPUrGMJgJEeOPFYeGNN18vcO7vjiLhlL25hVevRNYU7XLDIDXidQOgrLFAEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

