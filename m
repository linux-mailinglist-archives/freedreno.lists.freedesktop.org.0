Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCD6A240C
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 23:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B4310E5DD;
	Fri, 24 Feb 2023 22:08:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4C10ED2B;
 Fri, 24 Feb 2023 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iY5kKj/uyI389skeRqcah0v6Nw8t4ga+c2MtkCEUHrE=; b=HfmEt4C2KwsYjK80ZQkPaiEVYH
 JA0rbKAtojtPqY8QAl07nbPxyhGuQUNFBsfRv8wwO91n75PmZc+bELXpFqCMqK2Xb8KVFllQlNMba
 uRui+ouWX+cSONiynSTJNrnyP3M4DzlJrqbChMNuYJJlWa+Q1v/1bIICXuN8WTau58GJQ+n93qgZM
 RCAlxHROpBrdj2ouCjn4k7b9ADyyFG0TmXS+gUGqmkTw+q7thXrXP3jPus38BeJJFoN5nXFuHKTxv
 1xOLesdbSsZnaU+B0SM8ZfUrXfypqHhHb9oNwA5bnCokD/p+QOD35OQ/1IwHbRyx7INue47PsXWdS
 Mkwvo5ZA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pVfpD-00Dulq-WE; Fri, 24 Feb 2023 22:41:56 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <mwen@igalia.com>
Date: Fri, 24 Feb 2023 18:41:33 -0300
Message-Id: <20230224214133.411966-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224214133.411966-1-mcanal@igalia.com>
References: <20230224214133.411966-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Feb 2023 22:08:48 +0000
Subject: [Freedreno] [PATCH 2/2] drm/msm: Use
 drm_sched_job_add_syncobj_dependency()
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 freedreno@lists.freedesktop.org, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As msm_parse_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in msm in order to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 73a2ca122c57..d360277809f2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,7 +550,6 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 	for (i = 0; i < nr_in_syncobjs; ++i) {
 		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-		struct dma_fence *fence;
 
 		if (copy_from_user(&syncobj_desc,
 			           u64_to_user_ptr(address),
@@ -570,12 +569,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 			break;
 		}
 
-		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
-		                             syncobj_desc.point, 0, &fence);
-		if (ret)
-			break;
-
-		ret = drm_sched_job_add_dependency(&submit->base, fence);
+		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
+							   syncobj_desc.handle, syncobj_desc.point);
 		if (ret)
 			break;
 
-- 
2.39.2

