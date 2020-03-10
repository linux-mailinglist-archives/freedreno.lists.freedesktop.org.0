Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B817F967
	for <lists+freedreno@lfdr.de>; Tue, 10 Mar 2020 13:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9F16E0AA;
	Tue, 10 Mar 2020 12:56:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11DE6E0AA
 for <freedreno@lists.freedesktop.org>; Tue, 10 Mar 2020 12:56:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D69D20674;
 Tue, 10 Mar 2020 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583844992;
 bh=8NYG1n3xKdhO8T2dlTDUokQeG2/YXy4P9DT44E3uIK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wFgEGdxgoJAnA8Un1j1JvI9b4+veToeLq8B8DuzR+XO6vwyD1O7LjH9GADnoZh160
 YE0LefKxO/7Ph4VZiMz3QSICHRXV230piZZW4wYeqY7XcXHaU3i55vNXAvLT9tHqdj
 gRd4p01Alk2D+mWjXrLFT81fTgB61Ztk/Dt+EXWU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Mar 2020 13:37:40 +0100
Message-Id: <20200310123641.816284321@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310123639.608886314@linuxfoundation.org>
References: <20200310123639.608886314@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5.5 023/189] drm: msm: Fix return type of
 dsi_mgr_connector_mode_valid for kCFI
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
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 Sasha Levin <sashal@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 clang-built-linux@googlegroups.com, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Sami Tolvanen <samitolvanen@google.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: John Stultz <john.stultz@linaro.org>

[ Upstream commit 7fd2dfc3694922eb7ace4801b7208cf9f62ebc7d ]

I was hitting kCFI crashes when building with clang, and after
some digging finally narrowed it down to the
dsi_mgr_connector_mode_valid() function being implemented as
returning an int, instead of an enum drm_mode_status.

This patch fixes it, and appeases the opaque word of the kCFI
gods (seriously, clang inlining everything makes the kCFI
backtraces only really rough estimates of where things went
wrong).

Thanks as always to Sami for his help narrowing this down.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Alistair Delva <adelva@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: freedreno@lists.freedesktop.org
Cc: clang-built-linux@googlegroups.com
Signed-off-by: John Stultz <john.stultz@linaro.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 271aa7bbca925..355a60b4a536f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -336,7 +336,7 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
 	return num;
 }
 
-static int dsi_mgr_connector_mode_valid(struct drm_connector *connector,
+static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
 				struct drm_display_mode *mode)
 {
 	int id = dsi_mgr_connector_get_id(connector);
-- 
2.20.1



_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
