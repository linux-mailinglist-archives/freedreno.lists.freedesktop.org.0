Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4E398CDC
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 16:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876DA6ECB5;
	Wed,  2 Jun 2021 14:33:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B04892A9
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n4so2555984wrw.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=KvVi0c/OVMBV3walhJDo2eZIaOxaoxLvpytsz5zVRSy+FITa1KoS7LMnzgFD+E9mZa
 iVRAiDATO7BtKC1JctwKINg8Ch9Roa8aBSPb/z7bU6PEkcTuL9DrhA4ln0ilbQD9FdOS
 7kqfO2DUN7WzrYBtuj5eI9Wf9sdP0Lu4aU6O7zD3lUbZxwBMstWZpmBzgWY6QW6WpjXY
 9Wza22NBIhib6GkT5KaNYx6ViyPDN4ftldL8XW1752SWMMhhE29zrQeBaqAtEcfl0gmr
 xoItU6RsYKWV7ZePJ98sS7eFoWDplcUXbM/+eRsvYK806lV1ANS7sjoyVjqrTT4eLfre
 tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=E4WVbvZsRUu0C/5KV7VgCTw1r0aGeyxjaA1AHtFDfspkaxnnWcb58wWF3tD53Ppr+c
 Odwc/S1HZfXQZVoFancHue8JItEPulg/U819ZODDh8tNcTC+2ogFpG/YknHAW+t3NU3i
 woanz3GAQ+xFADxY+hFgyBKA+63FPUJEFcHYjtafREj6spea7ukXXuqk3HPaLjd8RR2H
 ykY2FAqNC4h3H1A3czaWPI0x8FWXrYh4TZJbtW4CRuhsoaTFCSTRw550UMLQxp4QCyQp
 e+vy8IgAK6yLmv1JoWtyI6kRYF5TDQRLxN5xeQq8VyRHT7fTKXRfJphjrJ1m//Mu8q1J
 2Uaw==
X-Gm-Message-State: AOAM531aKwlGevN68PC1yVxPh5ciZJfZr0aHuHaQOm/3r8Qvef99dmM8
 4N56seXWhoNuTupHWE/l45wdCw==
X-Google-Smtp-Source: ABdhPJzd2vW6XihcitQ2K1uJ/JKMN3WhefV+sdm3kCF831XAnwjjgxWuHWBwqKhr/jNqVCOgDdA3/g==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr24708635wrn.413.1622644401710; 
 Wed, 02 Jun 2021 07:33:21 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:21 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:45 +0100
Message-Id: <20210602143300.2330146-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND 11/26] drm/msm/disp/dpu1/dpu_plane: Fix a
 couple of naming issues
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:373: warning: expecting prototype for _dpu_plane_set_panic_lut(). Prototype was for _dpu_plane_set_danger_lut() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:498: warning: expecting prototype for _dpu_plane_set_vbif_qos(). Prototype was for _dpu_plane_set_qos_remap() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7a993547eb751..ed05a7ab58f53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -364,7 +364,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_panic_lut - set danger/safe LUT of the given plane
+ * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
  */
@@ -491,7 +491,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_vbif_qos - set vbif QoS for the given plane
+ * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
  * @plane:		Pointer to drm plane
  */
 static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
-- 
2.31.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
