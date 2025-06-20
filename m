Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF29AE1F23
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 17:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5F10EB7F;
	Fri, 20 Jun 2025 15:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBdG1v4O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A9410E233
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEdqIY013835
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
 HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=fBdG1v4OHwDOATjWpu/VacCWiaE
 KMa/eig7Meb6q+zYF5fn4ALlF7D7vCgah2Pzdw9mk21oLl/RJXvd1bArRnao224E
 7QsXk62dWFUEDU0HWZb3KfVxH4UHvQIETWDnGamP5hbffECt93++APkU8/j0+nEl
 9PGhnbFs8hjfmhDbHPwuQuSYjqaDiER/VovIZKevpDIDekCOV4xKt7HJzHn7U/OE
 kmx/HT/WnOuSD30vtekl41h1edn0m9JU0JS+OwmF75FuRIFrAzuFt2FHst7SFaJZ
 tOtj+JCzNvHijNFRw97Xn2t+aItkUtuzLOLisgZvNsfjyIWo9kDSlp72S3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdbv8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 15:45:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234dbbc4899so32943585ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750434347; x=1751039147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
 b=KCGMoCfX/ToR6lCKiVMbEv/2m3oCV4PHWY1KlHH5STE4jls2qetqU2ndaIMsVteKb0
 TFMC2pBGdt8UFRzCtg3kX8x2SvVuHX5+4u4MxhPXCiaCElxMUYPJEvh42D0YgbAKPpoH
 jThHGp0zbh1yn/3VfF4iNl+4WByFWqK5EdkW2BstKq4sqqlgh7ztpOw5iLwKV6tpgBR/
 xa9iAU6S0TYD2lFLhz8x2zoSOvDdInFBgjRrueH3nUMeiqKyhtBesXOHYKQBRu6cyMY6
 G5fE4PaOr7cP2k7rArsk2iImImN3hXEGWUcZQT5Vq0heCYIV/gBxyhGoIBo3DKGovNGb
 PG1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG19X7/R9GYeDMfHsXSku5puFhRXuJD9X386udk3AAn4GCqWsxQYmFgEdDMtlBtnoQJTQ01QUHdGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRsfau+726ZUBqkH31ceBCWWwhsgOKD4myX4Ih6/DXRJ+vpkUS
 VcRWa8mUTz4S57zufn59vt6peZSKMSEmiyTjHOb7T9GCNcq5JeCzoQFdfc9pwpYKYPlL/6lATU/
 NMZ1CH60RTMD/+Ia4LgnXBbxM6TTavUg6fq3jhiG1YhLok1UtMHsNelVLGjyN4FLjg6pWmdo=
X-Gm-Gg: ASbGncsbLiR719/XWNlnDQpujFmPHdLXdzS0H6xQOVeYgWyIzQsPGwQl9QEetwNAGOz
 3PlyuEniJh0h1zxBiBRAkHdNTihtUz/2bTSgOU2NUG9hJ2NCh59xegTGsFUVuQqAakdUwHRaFWS
 V2AujFkHbZwTOC4/GVrFm6zPcjwawgVNNfZqe00SnKGZfQt3dapPmrvSrVUoYRxrap6uHdVDedY
 TKQ/LZJUNqH5Mn4d5bToTSeQX+Gcjt0sULYVyNXLnNZz7QOkSTZAb5EJnBig4GfKkxVTNgvobev
 nh6OBF4mOlNqhCpdCL4E9sT0lqP2BnhU
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-237d99d83f3mr42383305ad.47.1750434347246; 
 Fri, 20 Jun 2025 08:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDiFB/XTk6onD/OV+d4aZvXfxm168CHsEY2UxE+rWdnNuvA7GDtDI7V0CiMaCnXa9H6JV/nw==
X-Received: by 2002:a17:902:f70d:b0:234:e3b7:5ce0 with SMTP id
 d9443c01a7336-237d99d83f3mr42383045ad.47.1750434346876; 
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d875c1f7sm20922405ad.257.2025.06.20.08.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] drm/gpuvm: Fix doc comments
Date: Fri, 20 Jun 2025 08:45:35 -0700
Message-ID: <20250620154537.89514-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMSBTYWx0ZWRfX8opfnule55e3
 CcDr5L0AIWAe1LRQ1pTe4opSvff3F2qyAlnYCIHGpda1NxTnp33rWwayUtUrkI5El8NoBXn54Av
 +V6ocL9iru7jIZyoNUWjUsrQMH+dskRMQGCXbpOLmXkWwpcimt/V1PzilsJhe/Kynz5k2iXBixx
 PoGBtFNPZhUnYKs6UtHHGm2zuGxGEueAn6pW9phADxwlNkjiDY0cfer4PpHBlYSLF5q2NvBn0Lw
 2nF4+X2MHLiaM/lalXtrlkN69NWqZWAodGguRo/hwYM+X64EX6HR/sqknVu1vx1uIx0+k50ohin
 x4WIl5eJowM77KU4L1d7DQ2hsEbCRjDyCn/7BtDYHWy7wSGTnF4RxWg4iHG7+9Cn0wXX1M8t+tm
 iYK4ToKVbGSRP3E+uwLue+X3r6o4glOtfvJT1H2Co93ESuwZw/+j5ysM4IRc5QAlWzEdaj85
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6855822c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0Yglka0O8IHkrYpnM2M2USwWNLsxSFPY
X-Proofpoint-GUID: 0Yglka0O8IHkrYpnM2M2USwWNLsxSFPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200111
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

