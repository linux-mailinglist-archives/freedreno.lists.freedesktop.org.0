Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D154CD16FB
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375C10F07E;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="EwufHDfO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E810F070;
 Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PK99AItbHdRoxa+xwxOdW/W/b+6sW9m4zAOyS8iStas=; b=EwufHDfO8tBimv/IaCDcTHHWgp
 e6u/zpRLj4AAz+oO3VQ8tfIT+7sZrXRqWTryx8kugR4xz6SBTLlt5HOpocrdpxlV1oiOCOqXf4vS3
 /5yXRXqWjpQCaZqx9xE8v6Gnk7ddEOEgBjT2j2DDP67Nn72ZkX+LhoiqWRBJwvNsmQFnYNWsjUgIi
 5DRj6rXNA7JbVmP0srEjtDaqjYLye2ZOVGEpt6iKUQ6bpu79KUSFcxqaApk9Bf60/dSeGCEAyTmGV
 nTQo8RRkrWW8/kFkN/7MMolLX5DCXGr08QtDUiF5ckYk+Gs6oQ0l+dymF8kFpQBag3BJ7xTgDDlfL
 bNilVm7A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUx-0000000AqkV-2yx4; Fri, 19 Dec 2025 18:46:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc
 warnings
Date: Fri, 19 Dec 2025 10:46:29 -0800
Message-ID: <20251219184638.1813181-11-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Delete one "empty" kernel-doc line to eliminate a warning:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h:14 Cannot find
 identifier on line: *

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -12,7 +12,6 @@
 struct dpu_hw_merge_3d;
 
 /**
- *
  * struct dpu_hw_merge_3d_ops : Interface to the merge_3d Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_3d_mode : enable 3D merge
