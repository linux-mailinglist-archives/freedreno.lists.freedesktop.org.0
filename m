Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D6AE8D45
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2CD10E7D0;
	Wed, 25 Jun 2025 18:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFPAYJxO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD16810E7D0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCbgMv021986
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
 uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=pFPAYJxODp7VLqvoCbvH+1VyFoR
 TVVh8aSjTtlmlxdCSvt3gkbQFZA5EiJz+tz0zl2LIqflivHZYPF+St2WOkPcCHdT
 5G7cWuDWjzBDv4gGMEAtA65z0/XlHKoGGajfs0u/EjgkGiKYnISbAJUh+GsYoBj+
 wfz5JwZrZAd94KBVHajZQ3FQHvHiL1KPe+JAR7JJbwP9PzdhOWqEasP2ezVf9L4d
 dYC5FmQM04XuMxffPpu0rh79jaKEjWeVsw5XNkJKAHJtcqN2YWh5vRDkoGac5VoL
 /y5jyaLj02fxQsDabfjeGOC9A2NO2jjyY4tWqAqeFI5xfB2R+t9Kep2ttAg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2eeff19115so204976a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877909; x=1751482709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
 b=KrfULkhUXTGFaz1eAi2Xp/ax17TI9WOgeml7ZKi7lm7Deqj7hJ2n+ZJGQiT/9+QyVX
 Kgv7GD2jqvDhlnG/HzlRe+Pg8PSE1+Gul07YstxTkLTzVNmyHmTZiPVnxjSH/WcdgMBO
 /ZDnxsRg+C0d8zNoW8AUAQDrXiXkZaXDscSfH+sFIj9HRTo9jdD4j2nkPBEZn9j31bLl
 2p4dAzB4/jNXoDVqH5062vrTb3nkLdKW8dWZCD+vuhBqpmhqsDPlE+odB4dCH75pPh2Q
 yYPwSrc92YnRPdMBMMZCx7bZ8xuhHXSpcjpqhH3JVwFsNiNRAC9RI0znkBtQZeKJW7RB
 p3bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbBEyzOMo/HvVThfsYYtO8nP1nC1zDzh/gM+sGLtXU1zm8aLLkj1ZWD7nzWBHdLNrQQz98lQLc5qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLwX+vgPCX0Uit6NZDtYcrAV0i8DHFIKm9dQRNGBfWxRHNfsB4
 EGGTlrpDWJhIFVwgAdxlYDINk0KPO9tZmkiZdRCsLnAU08J+t3p0yBo+gbdBOtTQlIrDYLXiD75
 AFinKtcMfYtMih+ByUWe/IO+jpdxvwGLHxiHBXQ9EUo3lidi12az7egRsPNw7Q7kp9kiIKMTaHa
 gnwlU=
X-Gm-Gg: ASbGncumMdf0VRev9010m2g6tbw/nIwSG2foCzZW+gfHboiureF1jPfPQPSOZWWMHJm
 CjigjECzwaiWO6TXtcXa+d8Pw8NFF6ABQ4PS7TppxGVDQIZtDimjYSDOu/NBZF7VYDdxpgOXfkl
 uyEncMo9ceDcWpSQtBDYB05Fofu5/5Nxz5vi6OVRkA+OpkHPW3dWLuhz9CNV6ymAaX/+z5FLhCX
 QgkjioTTr6LrREWglw25E1gdcXLIy6t3MG/lcUzJGHQSuyWBY4t52ulhlVcVWltiuQ+jkPE/jz3
 XnxWAeK5Vk8FVu13dMAuC7wQ8ZSf691A
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id
 adf61e73a8af0-2207f25dd7amr6659474637.27.1750877909329; 
 Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC270RcmL94Y5v5YXXUNIT0L43Aj7rmknkarCokDfRAAcbW7dfFvu+z2RftyoP2ixS2WyXNQ==
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id
 adf61e73a8af0-2207f25dd7amr6659442637.27.1750877908935; 
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882cc78sm4909730b3a.87.2025.06.25.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 10/42] drm/msm: Don't close VMAs on purge
Date: Wed, 25 Jun 2025 11:47:03 -0700
Message-ID: <20250625184918.124608-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8/6bkIJYYv+Z
 4/ELNkCPy9aln9FKggEuSD4vQdONggokcrxrszXJUYe3wgq4rfsM/Xt8FMasgp5ygBlAiQFQxlu
 3nsPsK05V4pqe3CvCoaJa1p0b6j17mmgdIiNSV3E+SHk9gIbO2eATrOyrQIiliVnr63Hytr9rDW
 QJqDvutrGEOvh4QYa+ewImRM0FpC44pTgZf8uO1uf7mScIDI78l3dlPW7megcjGDkGq4RUN8291
 4kIbNgX6LlN2w+u11OdVe2pOfj1+K/wz5N+sujiq36I9Q8bVlCpQ2OaxSvl5jYQDPFi0RIeNzGI
 q41aMtFLZjy6TKbv02MQvn4aahCsl7zKTnZLn9mHepF4ardS75s4ikDfBCOztznO2cfj3jy2PEa
 xod/BbfRvUET1A+/iDey3VYFfLhA2LLYmZf1qRu7qQLigM1mGdIyFMzZymHL/lHkYbdW/vHc
X-Proofpoint-ORIG-GUID: 0KrtYywg517quFMw2hp55SqNs7lEtu32
X-Proofpoint-GUID: 0KrtYywg517quFMw2hp55SqNs7lEtu32
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

