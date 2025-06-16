Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CDADB4B1
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 17:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD9B10E3D4;
	Mon, 16 Jun 2025 15:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxbYSMFr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF110E3D4
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8SCII010944
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=ZxbYSMFrn7l7CisnPoThSRW7Vr1
 6wo/B1bmVhyPYilbv6eAQ8x0DTGbHzQ3+P3PlfK6VD3uRlaBfkI7c9f2I45rYcCY
 /5+R0PYNux+VnLhw2uzm/2+wEEmDMtXAhWu5W1Xq4xBuJo44ua76aso1xfJ/Nu2d
 0vVCQPTTOy3vNv2AXPDpSzBJDqSKAYha34GRF6Ie5nvK9dBp/NTlHaJEkTxPodVG
 Yfq2h56XLfCGzdafhhf6PTeY8xnNFOmXCd7hvXO/X8ovJhkS4XvQiBtT3etYsNST
 Jgzg2ChR0cT4swJVH2uA52XK/JOel4yTa08r2FL1oQfagLZOtX5zoA5gLZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5khe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31215090074so6535932a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086005; x=1750690805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=kP3aOqrglnBEtxK2Jg0IOhqYdsdfqd4eUgXpa2Gula95NirwdwX/+MsCN1xSsBqkMe
 QlJXDVZzUC4DquTtDy3iJ70h92EXoPNRkp4hRlmNYuEPewGJNGjo+Mo+MzD1hrmLtBoL
 GWIAaUoScJ8xCXGaZUNIDUtFmcdN/M3vI2ZoUnfxcZ4+gtR77PjyHj5A13QDvcfGK30m
 OhiHueTev3HZT/lkS4tSSGLxH2GY1pDSj1WTbMOeUO8awEHmoenFoCj3ZDhZuQ80F0LX
 9Xi9byRGOY+bIS09CkId2kdGqF0wP7oUvDYvjG0lLNO0kw2WF01tr/WtY62POAMWyyZK
 XHEw==
X-Gm-Message-State: AOJu0YxM8ExWszV0R5AiAc82nb0E1M5IUnkoq12q7p63Ow61+OmBFlVg
 uZGSc+jrnR+t4RsPkj2tdsky3TIWpv1OyC9w1/liaG262TNp+Rp6S2PdRx9Bk6E83pVUc2FYgRc
 1Ntq+Fc/7he0ysz2jD8R/3D5n132rzZ4bHcycmgZoUQ8VcKV0/tQyV5FkYUf46/tz6j1cFsw=
X-Gm-Gg: ASbGncvHv4vhB/IhpIMGGPxy2YGkRN92Pgy4P1XWTUNQislcmHYeLdobS++kO52a0rH
 BW/JW/Idz7fLbQhXRA06hfQLn0jbzNyv4EuKsx/IuzF5WHpJtxTQm+kAlfUtV0mb2tAcwIcLxdt
 168uOGtRez84agaxj4xn+qii2ZGpM5ltA4+ih4TP14JzgCvy16K5Phw398bcuzUkcoKTBQnhyIO
 c3x+JweSEc9Obe0H4SeDvwO6NA2tAvvDAxBDPIsUV0oZsYMqI+C7vhc+PS2i9zyPyl6LuKJ2/FZ
 uqtICNl2BaeWMeScWznaGr9/j8dlqZJZ
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-313f1cd5a81mr16293975a91.10.1750086004618; 
 Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSwyYJbkfuG+cowVkLmWP7rTUfqw9+6BV4SQmAMwgYeSuRZuWklUdQ7zzXGTIOcmBX5tInA==
X-Received: by 2002:a17:90b:1b10:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-313f1cd5a81mr16293906a91.10.1750086004136; 
 Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b6d4c8sm8716826a91.48.2025.06.16.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/gpuvm: Fix doc comments
Date: Mon, 16 Jun 2025 07:59:56 -0700
Message-ID: <20250616145958.167351-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t9Y2kGQO96KPQoDCpva_7Gtx70KKI7EQ
X-Proofpoint-ORIG-GUID: t9Y2kGQO96KPQoDCpva_7Gtx70KKI7EQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX+wH+gMjZ6hBQ
 1XC8OnsLJ0N6irfVUYvp3GURbH6qh5NTZeDJ7wQWKlAq0pCL1HEkrIqos2SXAY9Ae82xPlJGvMw
 /lsk2XsKg5hDGMlLzEbAmXlZncy/cgQjlnZ1Q1jS8E7K20aSoGVqxtyAtUqTTjRcT+RpKUTGW5Z
 bInAxWoC05+gZaMrHGJbkAMkqQ2HltZ9M5pAb6m8b6jInz1gIx/0NwSRBPHVCNBx0sT2PYnNEb0
 zveOOUUJqLI6PiUgsVkfUJlRpN6T6UVSN3kLngbGVux2zy+6njzcPrqWiSQBh/t2uOXI2MgsTTS
 yRm2wyv/FLsKeKOBzo7hBDNu3Qm/xZBfcDIvrijl2H7pA1Hfj5Vk3jWfU8EwG5N5fOUe7jLNzMl
 o07vlWcYWI4AX1rpwe51owikX6yE1ASiy/ovZ+JjgU0BiIW0YjwPTbA+aXRQgFee0uO9ETQG
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6850317f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096
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

