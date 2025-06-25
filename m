Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1172AE8D30
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598710E7C7;
	Wed, 25 Jun 2025 18:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtyuO8Jk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF4710E7C7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfCda001125
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=YtyuO8Jk4sMJ2Ri/m2vw7QCCLe9
 tjKv2USWutaNQOLTXGaUx7HlhjrG9Q/96VntWuE7KCpdTkwXXe8t5N0cS75LuGYk
 s2JHO7AdW95w8iZgqvqjDnZNeRpWTloocpqwz//+wg2OZcct06JAJvdH8Kdscom5
 DrmM7SKvuYYwlZBPDdZlZlvFlfs3SOq25OId9IxsXTDcOdiDVpSKeoiFAB098n7p
 QTizKccSaKoGJekxblARNCidNcQ4Fg9VVBmVm4xhyg4ZNjPgyFhumRy3hBFUh91f
 GlXi4nMszFZxI61Mojkb3hAJGTgySUw2Itl0rebGrQlg/cwvU6K/XklOyCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23494a515e3so1389675ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877884; x=1751482684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=EBoclPE1ADvkhQ7z4dPZTCNXv8D9E8BqIcZNtUbkz0H5+wElrTeEY9157cfstiilkL
 o7nnUDTsk5dSX1C/eI0N/IWq9McLBb94mGZ7uW0agp7Dvct3qd99HgW2gcWcvzWz6n+3
 7Md7ZjCewLwqRwwFubnXrAm9PM0WqIbLtnvMyhCgpVxFobo1WNJhspz/MwItI5PKFcem
 Ei3f6YNXde9Gs92MFGSdfmTxhJ/NkH6Us40Cpajhmz3/YQ191OaGk63LOUJWvc5HxF5N
 nd72DDQQFBhdEGp9tx1XwcNsrWdRFvRnbJ5iW3maxYWlGTmdIU1QbbsYQhnsqAt+OWKd
 kauw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwUvU8mD6BLU1CXWeua/fcOM8rh1rn4Z8lnD9zGO+bYr7qtniEaMzD6ooYSxPvF3AmwpEg8FSW61o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9RChvPGFZYsBOlgRg3/2znVKEH/IZ0EgLQJi84D7gIaKgi3fY
 kZLD5dISyL0n7qvsGtXdJZqjYglx51BfZ5W49xb5RKCnoE5NnKjsoaorW1+Dt+J854OIMCy818j
 3ZT7uwqeX1zAGiXvvV05GeCdvh16wVdn67/2F99jApbAJlTFDMutcbCujzlqiUN/UCbyFAi8=
X-Gm-Gg: ASbGncvxB7Px66me0ug6loU/NPjjh/OHZfzGnwv+MhtfYVQD4xVRTBxliCMqIuHojxE
 4gYaqhGsOt5T2xylG8dInoCm8UzIS303OomdsTM5Dqjsaxo8FySeJMl45I4PGaFNDRcREBC3PZm
 epbDfxqXDtdtKF4x+Fj2UqygAwzN6GVhmExUGevKXVgAWis58GEV7EmW9hHdt+y6pyACOvoOrL8
 g5ReZWFdExOuGJ/0qsaXVIj6Se4glhxe8AePlN66XDj8kfPo9EnLjMChmfADWHvNj+j6TVTodGB
 1NulN1N9yK1OWMqksKsqnbRFEhb0e3Uv
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id
 d9443c01a7336-238e9df10bfmr9537205ad.52.1750877884569; 
 Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxt9zGsBsFtjOcbawB8rK4sT+s71VW3b7IpqZzz7IC1qwcaoAPSwP8cubRNnwku3ut/tWrw==
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id
 d9443c01a7336-238e9df10bfmr9536845ad.52.1750877884158; 
 Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86d5ea7sm137335695ad.206.2025.06.25.11.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/42] drm/gpuvm: Fix doc comments
Date: Wed, 25 Jun 2025 11:46:54 -0700
Message-ID: <20250625184918.124608-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX2+yUP/k5GnKG
 14TCFscktYli3PFipQUom7gdIYu3YUMfK5tzgp3aNNgYNgf3Ee24h1G8Af4Iay564h6b5OK5TWQ
 2AEpHWP5UZSF86qj47CD+BWi60ousxxzSZrjJ7jRT+YaOfoc9yjtQK1PELZ6HUcsSeLsoPV6dGi
 QaGVINjyNZ4wu0J+23LyyBVh0gEgw6aX3oFWgDNzFXTjelHlhIFmmxfvQCSC8zlp1UWMesi/J8b
 grmLENk85Vs3OalwahV2wZCJpHhSDroSBiG3vQLVTS55vb11WyAbkfSa5h21J9uwEj8b0T9PocM
 zNRExeRa8cuHtr8H0uBcqzE+6rXh/UI3zIPewN2bElwvg2vAH9y6yrM5qWM5z+a6hncOcNzIP27
 DD67mEMnAuyns3EGq0VOn6QTxqN90axmo3O0iCBEy121ZYa8HesdBADNK/2Q6pOqvOV7vuqZ
X-Proofpoint-GUID: IGp5Zt_BU-kTefO_7h0CCmQkssXAKpUz
X-Proofpoint-ORIG-GUID: IGp5Zt_BU-kTefO_7h0CCmQkssXAKpUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0

