Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC664ACF6B4
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0810E8E3;
	Thu,  5 Jun 2025 18:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdAgdvEx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C49D10E2EC
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H00gT000708
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
 sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=TdAgdvExjgLyGj34idphX4xSZZ7
 pgITHojzHMnYNLmEHWmE4ZKRINmCWwMX2v/X9Bb1lCsAC/BXVtoG7/9cXZwKhEqh
 cftJJCR1uhcgs8LQ/FvCcVbuS/AFDM6Hs599yk/7hqAieIUmy8FekRqeZIxwV2t5
 ZBDkDCf8Blm4LxPgQ7NzmScNC5n1fNjVTAkx82Le/2vMFA9CIigDoV5gZTwiMKOm
 HeyPvANF+SLmQ3aud4HAprnJH9KDH9COrJIcobX18Ckmc+TF9NNtxutC5fbhxN4t
 jPJn3m1/0pgkL62zsyVZgzVV6A+8CiS9ootUTpFz3I6AIFRsGhSqNRf6C9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qacpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2358de17665so12416755ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148358; x=1749753158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
 b=ZkfPp6lYiCEltWFiFHbHHRs2i2H5XZERZqFrpjGzryqkfgNXorw/PZWZ3udw/IjwYE
 6Xef4kMp9dexJ545Pih20pwBi9hd0P8QJhe3CWssbKZa0Ps3+6VhLRPghi7+ZehGD/OS
 thY/YKqL3YkjGr2PnctMdaeCUbDAM745sglk4kqc0O17zB4WMndE8p8kFCuPqKErZN9y
 Z6umNcGw+nY8JrCEp2E0/zvE5GfkR4rhhg6Y4sPZn5vhKpP3OXJZKX1sX9RbgcEIuZJN
 4oSxnxaN+cQn+W25FLN57xP4EZXFUqeAtNvNq6+HbrI4JirRoEqR3GXG4HfyEZGl3BEh
 PLDw==
X-Gm-Message-State: AOJu0YzGdauVraug+02l2eLz299mX4/49aRgBHXIpq4oMXgT5zx5u+RT
 L493871WwXNM/Ow5rWjkqk1Mw2nn85vfF16ztM5WhQz7mzhCgquIpQcsBWIhB+RKh8h9Ts59S4Y
 wooAdav+7dhpr+QKQzo7yjT/bGg4eTsPOyywnBmrwvez0vrJWUIJRmyar3EM/eJbWOoJrwYo=
X-Gm-Gg: ASbGncvHMhL9zVYbrq4m9U2xcYMeCa1FiqQXgIlDvOCJDpVhf9axdMpK8PswwYjHLQu
 Ebz4tJtrtvDLMHTgtFSlEV6m4+YTVgR0unKGHWQonk3L4F0iICPv/91kgqh6N9I9c0cFGjMwxlu
 gkZsJvQSJXfer6KEYiUjYrrMyUZjsKbxxxXqzYcJF0DerdF8LHWiNDoOWa/7n7fM0/c77TZAa+j
 L5kZKY31MN/iwtlD2oAeFG6rpFzSPm8j1x3PnxWcJgWs7So2ug5CMHoMwNWmqvfP1FdwF2PGncS
 PloQqYO70vWuCwCOsfhKW/Yf3mG0Rm5o
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id
 d9443c01a7336-23601d96e8dmr6602395ad.38.1749148358328; 
 Thu, 05 Jun 2025 11:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgBS88FiFnJWBPK5j4gpjhnAM+FBu71NhFYDWj/9txYixjz/XfgZjlMTKenwua3ROM/Jrug==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id
 d9443c01a7336-23601d96e8dmr6602035ad.38.1749148357957; 
 Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235e1e4ec12sm30594695ad.11.2025.06.05.11.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 10/40] drm/msm: Refcount framebuffer pins
Date: Thu,  5 Jun 2025 11:28:55 -0700
Message-ID: <20250605183111.163594-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jegEzEtVdWsrfcH6K3QY6WnO9NBAlh9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXwYjH5b1hqdve
 BH2xvAlKbHq9mAPb8UmG1vDO0ZCZqZV7nNv6vxPCyTH8tahoKWy7c5DyoXfta5JReC+WsMlBcwi
 B9DTlBB8BrErR3O3IJoeEpXbPo60HXfctc0+cEqVhXGN3GW0gkapkqi/u8f3u/cBdL/0gj6Ovrj
 x7nBxyc5tykznFGN0vp2Levp4vkT7c5tXnhm4Ebegt/d3bpQyqJrM9qvVl66c6ig6NQcprJcgru
 VlOsWufXJEs12pJeywiVOaDJe3mnb/IvrllRIZKKU2N0qx9hiZraP2vp88txgeY3LFgaMPRi8rN
 GWrNPKX2M/6KOHoGPVTWnuCCdHKESckRYrGXgmR5qBXVsdqUe5weddXrL1zcvobNOdpj4pKidQy
 rYnKdlLsfuDqdKrKmftJ85alMg26dY7gCZZ6UJHs4Th+PiEBsVQhKkZ/aOQdimtBVqDZHQcr
X-Proofpoint-ORIG-GUID: jegEzEtVdWsrfcH6K3QY6WnO9NBAlh9Y
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6841e2c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0

