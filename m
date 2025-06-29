Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3490AED05A
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339010E363;
	Sun, 29 Jun 2025 20:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEOaRKgE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3655810E364
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJhK3g026235
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=/ZGyoxYE2vw
 gSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=; b=TEOaRKgEKXZl8BVMyYJNO1xYFMo
 x3PKu+eoiNJTKuj0pA+s4MaHzMIk5igdemEau9XbwnkAKzRAY2xHkG40yVqWlF83
 vsrUs+g3OZA+88YnFkjTBHPRoaJDjTyPt9+iDSElpv+ILQuXUiiXkFQ8ZfSArb2X
 0G2zalrrEmr90ylqCWkJRI5jgIbX0cc1jt0QKjnm4g8YmVFKXOUjhfJxPRIQldPj
 ik65WTUeUr83UGaH9+ne8r5f67RbII0uIpmYnQeojcEY6wT76EIBXCONgdawH5tP
 yjsx/2m+JrdVRo0aSDFTReI7fI/3sCDxfrjEmmuWzUWiyL5xgR/C0OzMz8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311d670ad35so1016827a91.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228178; x=1751832978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZGyoxYE2vwgSzvJVWN2YN0dI0s8P9cmHBqgH65Sao8=;
 b=c9wzfvtGDm6TTlyY23p3uNVJog+VrZS0Nh7LuAlwr4dI1COO9HHTf7Lc6WnNtsSGYd
 vIjx3HBnQ/atZB7jZtAi4Q07XXOUYkyh0fkklibSPTlj+Qa0viSFDeKYgpyd1DVIZLlA
 0Vp7bnrao3NZK0swAZishFtMckokXnxCk3MKQPXo/v4hDNxPGVNvIwCw4/J8wzMx5UJS
 JxRz69ZPmKqHTP7RftejuvYb0zznY9nNOQcLfBv2jU2H6gQ7FOs8hlRkRTR8k3d4nJcO
 BayCr0atOb3130TkpM70CVKgfdNwCUp1rc6IJc6pZQ6RPVqCayAAN+FpjFKmuJLNu3nz
 7WNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl2xsxeCHy1NQkjHstwISm7Mh2OoIvKW/hzKrinTLv2602r5Hqri0aNPt61Eyav4ozsRlMnnGPWfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmUSDZsLNFumwMhoK4Vc/bPc8Ew2FHdN8v7WVshMaazl7lI7g7
 mLA/NWqAuCcdlJqjMvtbc41yRxG5wUEVJOGTBwqOKFoehWnyn60u+DUvkU9Qzc2mwQOphRfCAQ8
 LbHWQoeBA/C8VPas89pH5IgoavGX/dsJyRX4+85sVxvqOqHvmaWv6jIY9WjTPXF1A581ZLlKMdX
 OHfPg=
X-Gm-Gg: ASbGncvWR3M3ikc27ccgBmjd8j5oi9z2+SsU+fXbCcFqps6B/RqoL8LJTm9D2/52ots
 6Fjd+PaQ3gS+H6g2DCFe9wF1EMr/9OHjf/zXsfZrQjfk3cLT+iSlkP7BeFvYcWK8WV94HAIQiGN
 AS7fbNQrH593RxZ6we1doy5hmD886Z8AmaHC6cjWs4DYV19S+wPhOHiMoThcpemHEte8ozn0rnh
 uahOQM/xnUsVlICATmnZd77idtBoInbqbMOJ+U4E2FcyWLnK6GcvroriF9WgFHlSWMKIaUe2jYs
 ZT4/BE8Z6lmZ9w7eVxcG9ZMzoJ+GOuRw7Q==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-318c92ee68dmr17157228a91.24.1751228178450; 
 Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqaNgJEnMkUx7hpJGEVz350AjhfdZASStdapMozh2ARhQFgf1aXDQ0y4avr5wbj9GJufNNg==
X-Received: by 2002:a17:90b:4c89:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-318c92ee68dmr17157206a91.24.1751228178042; 
 Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54414acsm12293812a91.47.2025.06.29.13.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 10/42] drm/msm: Don't close VMAs on purge
Date: Sun, 29 Jun 2025 13:12:53 -0700
Message-ID: <20250629201530.25775-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y_fD-MLA6Zt03YmZceq1Z73G7taKzLHy
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nDn0RKeFDUDCjqZoaxcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: y_fD-MLA6Zt03YmZceq1Z73G7taKzLHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX/+U6PO7p9XLw
 WiOL0uotgLkQH0n6lusy3y8nwHv+KZvHOHs3Z6bxAsD7r9nN6mz0fOGMugCR3I+Rf+zDo1v08Qe
 h2iezxV9g2ZJqhIi102P2i9ZRqLtOA4/V54OoQTT1zG7A5BHE8dm1+DzzQr24O72y5rT0emgkBc
 KTvws34VzA4JMinvUMY7vQkSxQSAN29wQns7YrJ8bBD4ZsF1RnAnRQyBJ76IKhLCNokWpjSEdUD
 IMoUu9DYmM37RA3a/WZAnsPiUW+Ocwno+YdT9zFqW1/GZMGKp3tY/FT02ecxS2XWI4gTXuUWPSn
 dQOmGO8kRHb0OZZyoaibfInGUdZ3nFIitAuZcc0aqXApV36UOcudGdR+JcW1NlD8hDK3UJ41OAv
 u8ezERAnnfehd04YrohBC3BvuSPbY7+I56sAbz0LC6zlkevr/3GDzbo+zrJCYqHE9D2t5G8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7b0430628834..a20ae783f244 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -755,7 +755,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.50.0

