Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13443AED044
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64A810E0DF;
	Sun, 29 Jun 2025 20:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBueRC+D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1339E10E0C2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFcR2w026611
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
 8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=WBueRC+DWtG4IoBeo0td/gZKv9s
 LsG7wlfllHBIx3iAzAgDrI09reJm1oAWqhAwPNvi6WUmxXEH1YD3BleCbjGmnD9b
 PVLrrn1jtayMTJv+ScgufcCsct/69OQwB+MtqvgE26MEZXOs2OB6wtq4Om7sVca6
 oFu7J5NoSh4XnvbSt5xMkrcKckX76gT6IwY7IvJOIJMDKwIZIwcI7+LvRb20QSNs
 WOHos/5y/ZcHpzE0AMZTRbJddhmUe8Xel7aiYbmj26xO5I/0Yyp3+0LwmsdxOcqo
 HrZheKGcXcX6C3yDp59TyyOiEOuAwmDxzCkCgRO2ZoZybcojbrMl9JK7KUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:15:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237f8d64263so29995975ad.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228149; x=1751832949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
 b=BxvGeqOjDHlRv6f+fRlUj3JK+qGydqirszw8+VgrzxhD8qpgE/q20uNMnsEdq6ODHI
 jj7bBK7Jp6zum7yNwissK4haiWPRYxEEd2mMqpm0leVum5/vqKHvZH4k+yo4x4+S3ocB
 5wRj0usjGcdPwD6zWoZh9bU1N20wgo78lZtiznJ+0splHz5sEv5gDEJ3S4sZFetFC6sK
 y+RSeojEKg4qZwJln4iZQAATpc4LnEPLag/k/eNtb30rIQOM9K9xCGn4kj0c2XRoGvYb
 cMPUgVbZdYoZ1FNlQLJ7Ye/tf4m2ReLQa7pgkGMmsA4GzcNjYZU8L8BjdEy83cByZu8I
 J31Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYp5V1JjSDyTPurrakDFiS7naxw7EsXo5mqDay7ual8317cAN2uPMMbAUnMxxu7QF4GAeZTlPlq+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2d0kK/kfKW/rGExYRo00UlUlv4C1HBf35PvOwIGYyHHZ9euJg
 NcmyNUL1FnCBnYUKVBShLbfZxRVjel9n/BK68FQheCcg84pm/tBZFB/1YCmHBji8GXUiQJ0HD7a
 lI6fTuEwuKq+tSir2zQsKMk7KD+7vMbrEyfY/wOX9LmePzUp23+XiwPoqnenC9ThU2kxj/4A=
X-Gm-Gg: ASbGncuTkZNlYXvp1Q59dYOIoKqTlXKG84MGbovZU6FSEGa5/QbUIUNB6kEjoLS9N+B
 LP783yO/3c58G8VuWxtZNOrxM/0T5sz2G8JfdRMq65B/lmhC48MdjssBPe6J1NTmtQ+BP2HOeZf
 XdwXQQLzfoE0efsjqN9nVrP/Tqe4Bx1HTzMjRm9km8f0SsOS6veutcVbBV2Y9k2BEFjotR95ukp
 ITpua/13s7WpyWuEIOqUMebEz4Pb1cyJEwBcemiLC/4YXir42cquCrEfSAMmMG+zROVveAb2XZx
 w1Tvxha9HwgB7STa5ZEayrwA1owZ8fgV3w==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23ac4645042mr135124435ad.53.1751228148608; 
 Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeOYc4WiR21Bq+E+1OUk+x6dI7IFpiybjWV5ofoONV3kzSQEbyT8y1EfO5WQ1B1UfNOdo3Mw==
X-Received: by 2002:a17:902:ecd1:b0:234:a139:1210 with SMTP id
 d9443c01a7336-23ac4645042mr135124245ad.53.1751228148224; 
 Sun, 29 Jun 2025 13:15:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c54b8sm67165975ad.217.2025.06.29.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:15:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 13:12:44 -0700
Message-ID: <20250629201530.25775-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nkKDuJvhMl95YaGdlb0-_WZZITo5OCMF
X-Proofpoint-ORIG-GUID: nkKDuJvhMl95YaGdlb0-_WZZITo5OCMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5HoTFt08mdCj
 aYc0jHlAOVvrBLm70HA9CgCvrgbkPsXcDtQhAbSInxlUepJRU/GJi5pRe3v+m1mg417DAHCWw79
 FOjfUKUx9pNrlrhkgZRD7u17gjvCFPazxs3LE6u6xQT1bi/XM8WzYlYmw+0pCMVlXhPxuMde5CX
 zH9MlRPiX7GSSj8xpKee65sQL8sPktkuQJT0te3PzLL5egEBSPXR7QpK/Aw22A69m6r69+ugcAD
 6Y8XqQPCAoNRZ0wRT2nlRloNV2RR22Zv3CaccBIOi3oo1z/nA1jVw5dUDqErlWsPI0BmCio76vb
 nHC2mRbe36ljRKUAcfXkSMhD8+W3/VZcwBovvO+cYYHDc4CyTmFjky7d5ZNSYcAytWrAsrrbPAe
 Kl98Xqf3b4LWBHhy8q4IM7vP+BQkSWix/zV86reRXy8/93jgNiLqMMGiG51yuYAID4pzSzk/
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619ef5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0

