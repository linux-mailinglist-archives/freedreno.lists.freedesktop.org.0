Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBACAFA08B
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 16:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FA610E226;
	Sat,  5 Jul 2025 14:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Cck8wt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52BC10E220
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 14:52:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BdpKE022369
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO
 9kNt3NIs=; b=N0Cck8wtDc7EnrDCJbHToUUiXO9o792UiS7byJnGVwqTEWCP9+3
 Ma0xf2YeIegYB6D8EUc8+QQhKVtIK54YRoRAxmxLYCmtgDy3HAYokW/HtVqQi9Gj
 iayIZQFEwXzdGsMv5Swh/gKeBcNjnyX3pf9yFPRmoJflMMW6Re+noQ84cEwDURJh
 +36WB4YX2wglhashcF3KLJN4VMgeqOoExc7kd4KmglP6yx3WAB3H6W3nb0AbaTNF
 5kErsDqtUg9g2OpmQjRYnYzHUQw2b6eObBI2IX72ENoVO319ApXK4GdpH3JVzX2T
 hDfqZc8CsatkYVXzCOVJe/ou05yQLE6uzFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv971710-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 14:52:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235dd77d11fso16472545ad.0
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751727167; x=1752331967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBvtPJOWtI2W6w9O/gUQNtw0jQ+JAvaw7wO9kNt3NIs=;
 b=in/vmsF4fEQsRZnUvFtQaDKfd0c9tt5yFqe3x/P4I97xduTma4uSpiZmk2OQukqxv0
 1MgpiGaOOFXF8ZikGqTCbjGLZ/Eavj/jmay8kM+smMPIszz2hYNxM7U56XTs/bBrB12h
 /uuNw+GGmwJH1p+zbovDvw+Ow9LgLboJ3XJwuj/QQcJbf5vfoKlzoOv9DblyjRi8sC44
 JIZOOw1Jpe8PyZaAhgNd0mPzSuOawS2ZHbaOIIk90hZQygMGr9UqTzlSueZqd3D3lV8v
 Ee2zJ0QtTcQDIVZbfvCFJUNyQFxkjwxOBu9GXCtbplmf/rSRUbxIStHx+15t7BMgYJx3
 e5qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZyXqmSdCYUtWLlFtRN04UIvYqMur/pUdqNXJz67ycjdWsTwSviUZGM+Z8nDwJaMgXFBtH/aMqv+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHWhMKUBOoMHedQearQwQpe4v6UwHAyOtSEoj300pJeQr7QJLn
 nnbJkDTX24BjWFMOBeNbZTG1iqkdaqCFXa/GNrcABwd60vJxlwcWgZQ2I/oNaMULqVgR87Jf02c
 ByDPqcigZb5mAnOzmX6fB25JpV2juK2u4D0j+yp/+B60W7pORbLkh8MfhCcqytb1uInRwUQ4=
X-Gm-Gg: ASbGnct0p0gra/7ncNtU1q4OGBojtqC6LHbHT9JB9QfBlzD7C4jJ1Af/esUhb2nNVUq
 7+413uGm0e4vf5XZmvEPVFr6ajCajUAePvxT83OdSljoUxS0b53WC9nVEuboyzbADPuTmrt5+v3
 eqJVvQdURfXvVi/n78ATfN5KoL9I4GTngodASOnphwsIhzMLF1vXAMzKI7M2ycrHL3CY8gpHQDX
 RZlux4sjh8rcu+dtEiJyCgawSr65RvMloOXccYzz+12Jreu9uIheXU3cNzp7WcHqINaqW/49B9I
 Jfr5PFXTlnA4+DFKwUaFx/0FBKedBUxoHA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id
 d9443c01a7336-23c85d8feeamr79343415ad.9.1751727167236; 
 Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGToGgDP5cFnl805R/32fydbC1Sf0Tg5kRY7KHuPW6KsQIBThC2Hu6p+geYPeaz7rf08KyEeA==
X-Received: by 2002:a17:903:2f03:b0:235:1171:6d1d with SMTP id
 d9443c01a7336-23c85d8feeamr79343145ad.9.1751727166863; 
 Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a527sm43190135ad.26.2025.07.05.07.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 07:52:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Split gpu/kms cleanups
Date: Sat,  5 Jul 2025 07:52:39 -0700
Message-ID: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=68693c40 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xicTdwmnyVa0YEs4s9gA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX8oPsPF3YoLi4
 yMr9h0Gpysu0S7j6blB8igJcOf0IC/ZjE+QG13D1HD4gSZO+PuEOVFVTm0dIDkOBpbkuOyEdH6n
 BbFK/m5k9WOT4if+K6sFJX5ed/H7ocs8RjaisiF/QD87zuE3M6/ktrkocexgu0vcMIaMmBuRNgU
 ISLkO2+UTMZKwQmq3y8MHlUNXgXO7qFgkpO4s2KHwXZ4C49qEsM504HX63As+sJfEyOPH36xofr
 qrWGDYnrMwgM2vSK9Ex0kKmbR584i3Kcol2JUyb0rq49L5yLikfvdQ7oxyF9u3tfAiqX8W9/DPG
 wZZfK5OxSD8Z/wYMVqA5ApkjfwqZM6ZfvSR2gmaqOd2BlpJIwnO7hrqaERlOLhCjv0lvfZmfb1E
 Ii8Tg2l2N0guxWpdvdlO4lKgEfvUuEfeyn5U23dweyQ9t6xNNb4oTzwmrjEI31Kzh4s/I/Mf
X-Proofpoint-GUID: 5FmYYfom7fZCdLChGKoLg76kpQkmMuTG
X-Proofpoint-ORIG-GUID: 5FmYYfom7fZCdLChGKoLg76kpQkmMuTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=864 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050097
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

Applies on top of https://lore.kernel.org/all/20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com/

Rob Clark (2):
  drm/msm: Clean up split driver features
  drm/msm: Take the ioctls away from the KMS-only driver

 drivers/gpu/drm/msm/msm_drv.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

-- 
2.50.0

