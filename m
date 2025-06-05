Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11FDACF6AF
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35910E2F9;
	Thu,  5 Jun 2025 18:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUa4wx1M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503210E96A
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:31 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HXrDF007808
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
 uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=JUa4wx1MONrVIMYhDve2lIQwsws
 4cOE0chvJ8aod9TXux8ng4rmXFhO/oFJadVBjgwuOWPdDkMpZ2oZw5z3Zmf3o3sK
 O9DsVa4mmS3kJ8cuWa8slPvUJePRZcNLoF9wpZ+6xyBa4X6lJd6Vdkxl7HDUr1dM
 gAwmBcbnAPq4devLEuvIT8/P04suQDLeDHJiHQLu5h3d1omNjsBEM0DJEUPHT8jo
 F+a1sux+uZ+2gcSTJrLy6WroRqAadVpiVVBnPlHHBYANN9CG8QraClFeg8EJRnIN
 i/jbXtrvVVEuDE+spHob9fewbWibvEbVG7FMhlZtaes71nIf4M5wF8aH8FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311e98ee3fcso2180763a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148350; x=1749753150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
 b=ApocN7sg0Akq0wNoc4yhcUJrSoOd+7Obxg2CnBfyvk/W75Cb8N0cdaDz+rl8rzhsfM
 BwDKdxGfdYYQu8jx8tOTT7Sn9hmr1ukfdEuklXSZcQCMebX5eOL0NuKTppGyqTKH4EV4
 r0h3oAD2Jtj7zHq0Y6Djk4qvCa57o4B41PWMEa/6l30r7Z66EbvS4W1iOcAbxiyla4bs
 ywFTOiIpQ46F04wgLC6yP4IEz+RbdTQSrHfxUNUTVYQSoZb6Q3kcJ6PjIXdoRFqy8Oyd
 J5DJYnSxWtzD4vBGWmfLZI5N7Rj+6YvIctpSbYH14Iz8XdwGWnmxptrHzpmH6pT8ibvZ
 BPlw==
X-Gm-Message-State: AOJu0Yz0DjYEa+I0bXf9bTXfrkEL7++gqVRxCPf3CLolW8GlmkGnpqr0
 iFLS/+cV3uaWyOJV6eylQye8j90wKPxC6KQCve3KU67/cP1c+Wnu1YJogeqsStOw9TX3h4B0VWZ
 J2Z1SVMTGz4FMMaAj96A9eitkOikmq0sDdUr6xjkYiqJuEp6ohERbUUI6cK0eOC3NeGzfEVM=
X-Gm-Gg: ASbGnctKDssD+JcDV8U/+29NSErl/Jz/nXV32WyueI1BWxtN9QlXKRhLitmIX2+uEZG
 b1pR12liyWc2yINcIQH9uTm5X8shkaojnDpywIiVdL5ehcT7dy7bInPy7lks+puCWSYUZkBSihV
 AdIaCaGPqz9RqRk6ZbFmuVIRvDE3dK7HjvZxTEFVw50p2dqgsG1OrjUQnzvEC/nAEO8WDTy6cNL
 SZeDwVUgDpVaVPojT8op20UxkS+7a/mZCkpYcadXiE/xzC4QX40iy+yjYylgInlkbe57PktD/yR
 rdUX2ClkAF1QRGkJPYj/zQ==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-31349fb9e7bmr314332a91.14.1749148350479; 
 Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFf9Ed15WnJ0bK+g5LNOmp59mIQDowolw20rilCr32CVyAeCUxH7k2sAVz4uNjydss8qX1kA==
X-Received: by 2002:a17:90b:3d8f:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-31349fb9e7bmr314299a91.14.1749148350077; 
 Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f6d8f3sm61281a91.46.2025.06.05.11.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/40] drm/msm: Don't close VMAs on purge
Date: Thu,  5 Jun 2025 11:28:53 -0700
Message-ID: <20250605183111.163594-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfXxoMp8leRhj+b
 1mzu8R8N6kSvAbFkPBDYNeXNB0lPE2yCZNKW74asBUX2iiaM0aa72pQANpMtig0yETZqKrLHobQ
 IxHvyJq2Fn5S+FBnQI+MMOnNsbdbANh//usliAgjNyB7q80AUWRJctcl6Jc9eMforXX5p9394YT
 olyQ5lFl08EcqRkYomQnBCJfDkmqHf/rUYbzD9BEHlDUCgt5XnmWGBXS/B9gy00cJujYqaUaxgt
 IHhTiM3ny/O5kdWU+BGAy8bDDJ42c3Uxo5cUmazQYVtx1PYv/J+ssDK7dIGqfsHtDetEoati8Zj
 3EibQ2HQ8KSzKaHWaOzrX0Ayf3QaYBat5CJWyGuSsLssKczg7MAAvm+5uFcg1ZeMKRi8vv4QQzh
 Qs52L2SgnMgHZOBTUrRQ3Yz1s9d2a8e2AT7BjTO9Z/0QJQqzavGETQXqRmRd/T9MqP1HlayV
X-Proofpoint-GUID: jdYzGi6n2chYsLStr6FYbElUbP2P_jnx
X-Proofpoint-ORIG-GUID: jdYzGi6n2chYsLStr6FYbElUbP2P_jnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164
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

