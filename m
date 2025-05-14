Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0758AB79EB
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 01:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145AE10E758;
	Wed, 14 May 2025 23:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPZ7BrCu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525E10E756
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ5ptp012642
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=; b=YPZ7BrCujttzWefS
 7k52LLoHd8QJTzwQO/vxTEVo9omV/tg5k8Dew05cPjOh3isk1cwYDX34iIzw1g4j
 igq5KYXFwoEyKyvi0bNt9MULlip6eOdwpfYrybNgmvysUcI6oJH0VFcU5zM8HrQQ
 Irzoqvvf/eY79bf2nqrGaeVMPviY4WXHShYDDWAp7QtrrkXnUPiywGhfIvViZ5Vu
 nzZSkv6EfS6+wFybzFLdurzPV7/1Xrb5inNYNri5rz8JjZRXky6MX+ypwcFJEKKY
 CKFGl/L/LXe10A0wuItAt71F8Fq2KVVZBzeZUjw7qP6EL2hV8QO61ld3Xj9H38Rg
 oUlBpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcymeq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22e816139b8so2648675ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266766; x=1747871566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=;
 b=b9pJeinzq0vnc7T4hjKhOw2sqHsOFYeVqGOIZYfb+Mg7+p0Q00Z6x65eioMzTyDUZs
 4lfDaGRuBNdb2AzqZuWdTnXn18GUy3ifsKa4EfSoV8EXjVvT5Qoa89WVmXlr2djSKE0l
 VbiYZ0B2hMnFDjCVGkIjJ6dMdOvrJCOcsFc98FzjFLQMtDRd3uHrvzMG3whAAIk5erEH
 D8kGVeZYyjC8m5jvl1QWuQoo6y/sBFlDNk0nun+PFjcLghofKYK+ogJUipyA8e0Zv8Sj
 020MwPvykK6nh3Zy1QO4Ib66G+bWPlazZgn50ALt28zma6WBCQ645cnFr/9G85564K5n
 /V8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7gKzsNMNvwpnLHJnhl33yKAIS5oUFB1UNDw4MhcUluXXs72Jm0h6Q7mruMcanI6LreTHYYvBqFrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybFJYMuWr0t27w4+SI2bMyzgrjVdTCVzIEXyDgqwTFyN23WtDX
 Naf7jZshHTKzil/OW9tKOSKjloupn0aGhfimTdvrF/+yEQvkfCmaLuj4cFTwZW1N1hNz/PKwtGF
 BakPvDWtiena9TJFFDqpQrHkGQqyUQZotTmlFI8wy6QlAyoAmCf9+Q5yafm3Q/gvl3cA=
X-Gm-Gg: ASbGnctyNGSA4O2SEGNTu7FnfXQTMbWWEXp0SFVxDP9wCwO2w/pyBq88BSSDS2nogPl
 1hQeyEL//+MT6ti08BLgVeohCc+UHVYIlF+3YiwISh1p/cVBRxgr4cO0+vdCt1CjBP9u8PEVAQO
 sRzShRe53Zcp1GKyCiqdQO7N8uVMyw3eE7MQXovrRsqC8rLIFKJQV3IMFV2ylT0EWGhXydURGuP
 LsMFPBuNMrpeDDmYjONtPbQt1/WE6WUpr/YT8KRcm2kEyA13qN4vGbZgcjjmCGNa4YviR4xaCoI
 Vhv2osokKptVE1NU6UWIyIL3U25djwXK7hMt1r3erBagMdmKZm2BxtqQRWQI/SmLac48weR2
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id
 d9443c01a7336-231983c8d26mr78384295ad.49.1747266766594; 
 Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElBMMtlFs73GOE/CSJfWpv6kvzPVBPciQe95hl+3ogbQol8ic5ww8zShcsAEXLyX/lBBTLOA==
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id
 d9443c01a7336-231983c8d26mr78383945ad.49.1747266766200; 
 Wed, 14 May 2025 16:52:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:32 -0700
Subject: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=1350;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
 b=0lV/29bwfrvOOIXt1cQk9FuWEEWPvaC+02GdLvIzrV3TQ9b+8xL/6i24PUe+kv775VH6GIiyB
 PYZR7MOt/YnBvHbmvbU+ftLOqf6bUJy37F5YtG9ufV0E3xKiNFyxO3V
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: QKk9cKU5sZ0wuKVYxrWo99KCgSiD8Mb6
X-Proofpoint-ORIG-GUID: QKk9cKU5sZ0wuKVYxrWo99KCgSiD8Mb6
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68252ccf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX+gTherNfBzbF
 0ZjQ2GTnzSttTIGBL7k4tz5YeYAGppjAhAaorDvMtt+PKNmoFxyOO+Oz6l+MWO0oqFj46oV82G2
 G/CnRrZj5gtx2SQ8sbAoQau/T9RIrIX8TQXBb1XKPKnKf79DE5J4PfVQjFFN8/JpjZmxWxRmUuD
 aKjgS1OBJ+l0fdTw+gmB62XFE/Ouv+cUheXNgri9YnfPZVO52qHS1PiVjDw+3lqLbjIbjDwKFxc
 QCgowkD7hrMP5OLsabtfLKhHvkKnG0oyXLYFIzId8mUVdvov65OD8+xktLtNPorM7Lvm55NQAPh
 rIHXdmRppR/OgkAOHLryhS6gCXWWz0P7j5p0oKVOmDFnStq55pn8Yj0ck208WSxnJzTPMf04JC2
 tEVyKupiXZXc+IoRlz2KgRsTrGozJMAzpMra4EOP0dldNuEFiFaQg20ir/lu7LEBqer0Nz3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222
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

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902..0a198896f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.49.0

