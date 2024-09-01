Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61946967974
	for <lists+freedreno@lfdr.de>; Sun,  1 Sep 2024 18:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C9A10E1AB;
	Sun,  1 Sep 2024 16:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fNV0CvYk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66410E1AB
 for <freedreno@lists.freedesktop.org>; Sun,  1 Sep 2024 16:44:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 649975C40BC;
 Sun,  1 Sep 2024 16:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FAEC4CEC9;
 Sun,  1 Sep 2024 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725209077;
 bh=zfIVDZ++hPOLBEK3oz6U1xatxw9Z40PH3RNul3DMFXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNV0CvYkQTCOk8E9kMp7TXvIdwXgkTjWnBylbR6mQWxOcqrLSHKQCLfai5w4ZoUka
 IRvqo5skcXTJ6MZwcFgpI1ZChu0myJEiVXr+4B2taH2tfPeHOMnCuWvOGalGBh2Xb0
 wEv1oelWwA37iWj9Icn6WSPG7cjf8x3MWlKKMX80=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.4 095/134] drm/msm: use drm_debug_enabled() to check for
 debug categories
Date: Sun,  1 Sep 2024 18:17:21 +0200
Message-ID: <20240901160813.670282230@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901160809.752718937@linuxfoundation.org>
References: <20240901160809.752718937@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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

5.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jani Nikula <jani.nikula@intel.com>

[ Upstream commit d8db0b36d888b6a5eb392f112dc156e694de2369 ]

Allow better abstraction of the drm_debug global variable in the
future. No functional changes.

v2: Move unlikely() to drm_debug_enabled()

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/c7142cdebb5f6fed527272b333cd6c43c0aa68ec.1569329774.git.jani.nikula@intel.com
Stable-dep-of: df24373435f5 ("drm/msm/dpu: don't play tricks with debug macros")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 6a4813505c33c..d6c26426b1c6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,7 +31,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (drm_debug_enabled(DRM_UT_KMS))                         \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -43,7 +43,7 @@
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_DRIVER))                   \
+		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
 			DRM_ERROR(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
-- 
2.43.0



