Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0ACAFA08F
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 16:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380A310E228;
	Sat,  5 Jul 2025 14:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCbwx1Od";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034A10E228
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BZavY016184
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Q8N8EuMWRa1
 mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=; b=iCbwx1OdTY540JdijeWz6mmxNtN
 jcHGzufMgNE6sGGCM60+73X2CC5hB4a6n+mVQ6+mYuuvlMBiz2FIIWOUV/trq2ee
 UMff44up788BP/9Fy0qCuDj1vBt9XfVc7m0n9deNVhbfiOA/yIg02c60zEYg+UFT
 1gw/mHwX4iTa19joxGK3rdMAymAyIvH2bunT62OgXRwX5Q7P9EvI+qpC+eXw27Vf
 1gkUdMMhYJm7/xKconn3a1m1U3sFRSv5D9e/D3rcx7cZEu7LCUTOdHVBF0WeeYQK
 d2frJQa7ongKYNGoDsd64B5leBQe7HyseXZ1q8o4dxbEXvxwAO/VLaoPQNw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk1cs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748f3d4c7e7so1241565b3a.3
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727170; x=1752331970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8N8EuMWRa1mmGemJFqKzu5M4ZeUODj+NeiD8B3lAIc=;
 b=V8M9iatb1T2agRzZFbGmPm8N3EYs0q700NUu3gwT9obJ1CHDZUC33Ptvnml4sPXMYf
 32iH/NzCOr1bRDlCfgJuho+lzTYk/AlYT/DOtV1YhP5vQA1/mfrrXXpThoyKYWUp9unT
 4WN1SolDDSb2c2zTEYrE4Mdr/QMQ3e0vfp/rdaSaMmvGXKZpmB595B5T92iMq2ZszSGl
 Tklj6yS2rdVTeWVTwNDcKhzhHPLg4rdNYvf8IvleSpl04BQGBLmneNHJ4EgndmBCCN90
 f1GG+TTUQmm2JpAl1xSq4sl5oaYXft8mCZyPc7rGubaEZMY2jsE/bTxSDPsfwx3ZMMH7
 cIbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb3cj/kame7IQFGbouZePA66q8Pa4jIeIAwUZjKEG71OshB8RDTPtqRvB1rCbrY/uiOzSCRYTtJyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/5ZJKPbj2VH4b8DStBNK6ztxAWoevglCZo5lLeGhqi3lxXylT
 U1qiM/7qqRpmzBG3lJNGH5e9gQZL2LVaC236hNwSvmJe2P91azZb0bndqTQ8FsyvBW5i9uGSXN0
 hLIa9PaPXf4lRGPt46mN286PPoqXE70RuU5/6b1fNpqu3UkPn6BP9rC05NIV94xs51OxHUu4=
X-Gm-Gg: ASbGncsi+N++3AFzvXa4EtTMcDTwNST8QjDSLZI9NMyIvTyxrFobKEbOem5uwJhY3++
 kQc2tM85VYwsnv2xTAIf6RZO8xN1NA4wkzTRf8OADikxFvoJQ7Awbn0VdNli7dfrX7A+gwHOAec
 7zT8Mj53sl9A1GPCHh95K9qhOQkwjjQLZc4IZd6ZzWYAUPBD2cAFxk4BpZkcLZDaZVuJZuXWPxw
 uGk3epqIEz2Wi7SlIMPo4mIcnsf7XhmCyG3P0vMaNIZt5w9Ejsop+2TFwy+2e3OAJzqgBvdP3Tz
 jqq1QMCn5/NRCUsrlRkWPQB1GgqQmxB+TA==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-74ce65d7abamr9077978b3a.20.1751727169708; 
 Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl5WMxSoNRG+3cwNkna22DGFREi0kKhH38n/zY2ySFcmwRRf5Bf2PvyWedYjvXUGUcKiTh2A==
X-Received: by 2002:a05:6a00:218c:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-74ce65d7abamr9077958b3a.20.1751727169338; 
 Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180e47sm4753893b3a.103.2025.07.05.07.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Date: Sat,  5 Jul 2025 07:52:41 -0700
Message-ID: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aqcV2MgVQEp1MNgyVpMSEjPXCFXGX4nF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX/CJDAJKam3PC
 91ghatqCkTS7JsR0a6shq3bpVC0Ei9nBPeXihuF2S4oMuIRogJZJ+qFuNCTqycEo89AWCQNscpV
 2FWIEYQvrsFT9WtpmAEL5Ji4phj325BB954YCXx5CMDUJ4tqpMnvMNeIx8gDXlw1/l8bhQuiAT9
 wr7iEzGkwmnipnhgMQeUwla4YkO4X9YZ+BPUuqzshz9CEzuVMmvzjDDDaKvD3RANA+luZ5H9nsw
 5nMWA0XY9Q/3KaOJ87+xe4T5hUGDav+pAnymZa7IInAuMl1O7ZhNfcmoljL3es0LDrZeFixLwOZ
 VuD2EldH8X2a0Q6d2sk70j1JF9T8548xhJuwPHnC9dStJ5p8uoEFTvVstIdSu77OW2bU1eSvnba
 ScmCzg92pvIiCMipHZz9nMisEHUhkQSxuMQJZYPW5h6M3wp9p3iiIHcZxT2GFD5SlMUCxGdL
X-Proofpoint-GUID: aqcV2MgVQEp1MNgyVpMSEjPXCFXGX4nF
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=68693c42 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=2c09coKmtNN1XW7u8z0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=906 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050097
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

KMS-only drivers should only allocate dumb buffers.  The driver custom
ioctls are only meant for the usermode gpu driver (mesa), and not for
general consumption, so they don't make sense for standalone KMS
drivers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5695de1bbae2..3c856c0ae855 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -864,8 +864,6 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
-- 
2.50.0

