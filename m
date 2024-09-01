Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86539677C5
	for <lists+freedreno@lfdr.de>; Sun,  1 Sep 2024 18:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7D910E0BA;
	Sun,  1 Sep 2024 16:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gCYD8Bp2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912C110E0BA
 for <freedreno@lists.freedesktop.org>; Sun,  1 Sep 2024 16:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4596AA4116B;
 Sun,  1 Sep 2024 16:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F1C4CEC3;
 Sun,  1 Sep 2024 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725207838;
 bh=wWRdV5p4nQfoqiJ0mlLfx4NkNTOoGZNwSUVpEcTxru0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCYD8Bp2OMrFkC4W5H9jNgMZPCefXGqV+5MMbD+KGfb8a0+CnliVzuy2RL/XJwBEn
 Knt8vjdjEIXldma0xzdgStxw7/5JCtKgYhiudOsmzZ+fiXb+Y+v5ih+dsa+jYbSTIb
 S81Lsp58kmmRPH9e3f5/3aK/QtDh37qZg3D+e3NU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 61/98] drm/msm: use drm_debug_enabled() to check for
 debug categories
Date: Sun,  1 Sep 2024 18:16:31 +0200
Message-ID: <20240901160805.999662896@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901160803.673617007@linuxfoundation.org>
References: <20240901160803.673617007@linuxfoundation.org>
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

4.19-stable review patch.  If anyone has any objections, please let me know.

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
index 56ae888e18fc7..97840b29fd7a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -42,7 +42,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (drm_debug_enabled(DRM_UT_KMS))                         \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -54,7 +54,7 @@
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



