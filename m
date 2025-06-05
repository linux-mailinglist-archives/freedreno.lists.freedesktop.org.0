Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A172ACF6EC
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA4610E9D5;
	Thu,  5 Jun 2025 18:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXA9Wbu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9310E9A8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GVMgI004233
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
 O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=ceXA9WbuldePiP1fwN6+udy+e1k
 zqyUbAgBYusWJWfHYY4kfFm/K0aawt/sYiW1G8BSm2EE0nTADmh60oO7FVz0vQMR
 z/tF0PAbx7foEOk99mZtnt4zHGmpblk0em+WjnIKT6Zc74UFxpG3rXjmBWPpsLZE
 W60X/0laxlF+KYplboT16JvyXU6EAApu3SPYzU3f/43CDr7TSQa/eWApHT3uV6fW
 5EJmuRZ+J6pX9bLeQfeEhhs920qfkyS777SN2amt0KYFv2EUYfo+vpzzESp/BGB9
 hQfgixpIwqPw9LEG+Q7YY4/Hxkf6xl5cdU4uRviMZgtv+uUqIFgr3mh2o2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2cdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-742a091d290so996815b3a.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148402; x=1749753202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
 b=HIxGh0jGT163V5wsI/pxT4t9cMUb3gcq37l4O7kjHSFCke0ntpv4Wx9UzpiZeXP268
 6g+gnPB1HxthaXz4I12R/OQgsw+89CB+I+NHzfr2fyUGwZ+yWaQQzC/hmJY5hE5iCrhJ
 dBw0fH7E3+sJSNsmLcvvCAa8BWfJPzaaKzwEy/gIo1rTNMGrAeykYX9PAhfXClTKgh9z
 YtJ4KFNGG8FsrG06BpKI8MXSeXkSC3b8wLTN9CsimViXpSCkA3JKbb3wS+9FdlVzQAvE
 5nXIrGVUEUVLntXAwsM+FYhKcZm344e36T0rg5FY00BRKcbg1GQ72Tc/bFq9bqHE6wjR
 HPWQ==
X-Gm-Message-State: AOJu0YzqSoaGZu1WYflSzWSPlPAVEWPvhvgG2yqtUCDaXgKgOFnRAoB6
 DXfRvYS3XCveSX112U9W9LvNwl61KMH/C5qrCEPnKha7gvho0dOqt6GEiRQ6VvfNFQHvH1EL8bp
 XOW+jUJOWdMqF/mm4krJs3ASlDrv0ByMWerVPTmN1QO0wJAQBEpZq54EL26oBXX+exwDcxIk=
X-Gm-Gg: ASbGnct9J0V+R4FsykTXXNn65gyFy0RfovHhj73qp7jcTfjp9tfx+GXnoEeZlSrODwa
 dKEbVfrPhD/LCINezt91XQHDYbS5sxIBfCmRiEAkP77n5LkQ15AqgIejuDL38oYiGQdtRRfkI9Q
 5dfyjuEi/Y4ohJI2urVtT/IjQt8WGPoWUS8NDwZeqtg97mEKjNkopwWx1+djGZHcQ2WSKYKl3e/
 V6RW1uROqUo95xovl3DFODEhSZK6y7v1+eAHLEqRONs+UJuA5ZnNonNKFXYarufU0Nma4K3EOhU
 dcExn5kJVZsyHhri3vj2wg==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-74827e80628mr887807b3a.10.1749148402066; 
 Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBuTKC6/naA3f/kWh7qz2oby28B2fruyWvYz+LKZRKvKVwuNe4K9bJXRX956fiwilQlAHacg==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id
 d2e1a72fcca58-74827e80628mr887775b3a.10.1749148401687; 
 Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeaba2esm13094969b3a.49.2025.06.05.11.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 38/40] drm/msm: Bump UAPI version
Date: Thu,  5 Jun 2025 11:29:23 -0700
Message-ID: <20250605183111.163594-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hCrONCx5wJojj8fCZjNOioqK9dI0MI2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX21VhWQDHzu5s
 CdV/eSdJkH+5OpldrQtUJ5regAHvqv1uzX4SmF+pf8YK4zemcrLt5jXWpEZC+EtjL4m5Bc/Ymuh
 rLjI4U/Vka9yCWUOcV/5kr+Ux5uPXzLahDuIHJXHh1A3SQXPa8+50nkF18j4FAj8K//fOLU6ftm
 pFpa08BtiY50QYHB6nMPDPJ7fRpThfaicrFq+6o4Vii6IuZ/ahnYgL2ghfJbKOpebbQT151YSqv
 Ww90QPpjQg1xluPFTv6j6u5aUX4qas89STGTPGxIcWG7ZP/3V45avBkoT8GeJQcnqPgZ9UYPePn
 /e5kpTY+DKa518YEJhzMFPQYDtvIStzaFg0V8uFJ9mVMHiEiOaEXiPokamEBCjqwJ0Brff+SG75
 OC69H/SrO9zptq6ygPSNvQbWtjMfJUqE3/gKfaCiBL1jI+otEHEEbW1/z88tqqWnm0dvLcEN
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e30b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: hCrONCx5wJojj8fCZjNOioqK9dI0MI2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166
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
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
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
2.49.0

