Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC0AE1F21
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 17:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8755D10E10B;
	Fri, 20 Jun 2025 15:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmfpQmFN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F9B10EB82
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDRPo7018505
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/
 LNWEz4XQ=; b=WmfpQmFN4q12wIJUuT6mbPBjwKMW172yqiR+uusC1TBzshUsQiP
 tOhQfyXT/o9IzYfGIsSDy9MHRllJ32bTrlmCZ6Q5CL+JXvUZA41alidmDVnUdnLN
 gEFSr+gKF96gtRc0Ji07UaQZ//B1rdyctPSrbOcoXrwDBZp/6jUc8fqOtK+ZtnCs
 pTFcQgyB/zkyfu8QeQ0zxe6JfKmM9UPwHtRzrjWj8I8kwH9wZqdei7LvtfZj0Ktp
 bQfFjVcpvKmzelfpE2yKzv9TPYD/oKgRkjWVFahX1hE3V+F64kVZbEPUBZv5AM+S
 kCxm79gpn/S/gtmurCu2wItr1j1Vzu8fAag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pchs7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso1631850b3a.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750434346; x=1751039146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/LNWEz4XQ=;
 b=icrdsL8NpkYE2oiLiVLE+5dZXoOx7DTU6Xf7C/LMT5FrOt5Z5T1fCVwnnyw3ACCLQC
 WP85ncbMkDtEiVyH9tFvgIt4h1Ww4eEZ+6T6MuLeJ8oF61/xLE18tid7G731TqqlTNVS
 3/fhbIjSwkO2k4OdsQ9rblBsOs4ehJvLW41icnA9kStgcB9kutV2LGDGvcfi1rZMvrjQ
 ldGmkYCDjl33Q8SAlX1sWWTcOCBsfdwchvnCj0UD+ajbsSuaDgyWennt7U0ihp1tNmiE
 XOT1ppJz4TvOwsmYm7J63bZSAQsAtazVDwkLzYDo/345IDnzeV9TlMBWbUYLNSR8rlxq
 fdjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfPV/JnuR50VfddPyBunN9PpZh03722V7YnMyidIPEiyHvM4BBiqceUm1ixfmOwunOOmiXqVMq7bM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywdzH3IZ8gbJdBFnd28Pn4daerPtG9ZY+xQXrHJMeheUu8F9Ld
 KcNFIJm8M9j3Rw/WNf9HN7Fbs2EThNkG/4/tFFCvJVo2HcwLlQu5Pbn6ZzWxCRtiur3D/7ew2bp
 UcYh1EQXUXCwzKbcgKiP1WSNZmSEvHUvTiJGRc31mqA1UjAdugn/wvmmIG66J5eb9pGnTa7Y=
X-Gm-Gg: ASbGncvl/n99zJKdJEUKWWVKOGHe6X2tTD3/Qfw9Cz9RkAtsx8vClcm3rTtr/Stjq1K
 GOLcZzKwMfSNd5yzHhQR/97mQa5vBphx4obvIY0ciFt+80nDWndHC6XPj8K5hSb2Uqo8IX7hdDk
 QhogRXFtPXoUQqbZArI6keYNm9XkPVevtR845XAaBHPLsO6HLErNbe9QBJy4tV9Kj3yTW8U5zEo
 Xf3o2p3WF/Q3ti8LAWpvBWO7fruc55qVNGDIQ01XPgAKUHx225IJL322T2oZ1uTZyUrB2qMzfr7
 gSEPNl+IDO8cFzV5VZiVHs9/92cWRmS9
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id
 d2e1a72fcca58-7490d64699fmr5349386b3a.8.1750434346099; 
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF8N8GgFu4/lrQ5XPorlr3lnveUTsCwOD2UXh/OMW5et3HBHydbLvMS9YAB8c/mkJVUmR3g==
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id
 d2e1a72fcca58-7490d64699fmr5349336b3a.8.1750434345576; 
 Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a498853sm2387442b3a.53.2025.06.20.08.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/2] drm/gpuvm: Locking helpers
Date: Fri, 20 Jun 2025 08:45:34 -0700
Message-ID: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NYWa3Leq37tRy5XMtnuGLLNbz91I0Ppu
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=6855822b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NYWa3Leq37tRy5XMtnuGLLNbz91I0Ppu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX82mU6t3YXPkX
 o8yiosY9Pyzogt14hguCG/lcg77aKhDoFcBfFwNw33/D9KtKYbwDqGWZDPGIuIlG9CEfkHgyWHn
 vPvwnUhiRDwG074bVOOyDdZlcOnlnEJGPBkSOmxzmzVGx7mqbfgiSIU5mKPgtHx5aRq+s7eOpvH
 XIOpovC1Ku0YAgAoMft2XJtkOsIdqa+7kwsd777CjvIdZdpWognmSQ/NjJ2Egeof/g1f3LeRY+V
 9KEfo98xLopnyY3XRGbVBE+WYeIQbFG0vlTPFYU9WVDVlxo24sThjsSrc+rJWgttMA8TyXZRSjC
 sBZqonVM+Wazj+eREWQqXeY9uiTOU373+4Ln2hidWzm7KCb5wG0oAZF1iUL/n2rwRE1KMZn2D5t
 tCbo27+shIDU3B1PDhkj1oZQ4uw38CXh7cCk0dqW2cmHi9phoG3KLzriRw21+BW2chqhxGkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=853 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200112
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

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 132 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 137 insertions(+), 3 deletions(-)

-- 
2.49.0

