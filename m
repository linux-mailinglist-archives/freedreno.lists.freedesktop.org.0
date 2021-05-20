Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28538AD68
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 14:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151AD6F415;
	Thu, 20 May 2021 12:03:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8D890EF
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 12:03:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q5so17383967wrs.4
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=Ki/5vsccVM8UHJjBDGFEOMuTjOicSQZ1oz/OgLD4xv2Mx1VnM2VGHXxQik26n7huqz
 z+M0QggmLyEdbh5Z6f5cvjF26hkbqkjqZdRsDY/uCBFP9XHELAfxkgmlEHLWuxPcKDl0
 +ueptwbIz3rdVJVYcrJrmXoJISOoWkn/qWGuX0w8/oNZzsrv8zDCSW3V+lYoFDY+4mwx
 DdAQ44Bz3ymEqFpMxp+VFW/PuXEBgA6+C2u6IQfhVS7FCXUKQIRax56FYq3e5u94hjxV
 uJWLg8jT4C+/uABqpXoJ1pHREuWwxGXHwSP+D7wfEOuHJtO2jUvCHoNKxlCDoschLjdq
 N70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=GfHsQDBcE0Ly+nxUZ5u5IvG5L8Is6XZusEz3TE4xM94TPxaCBByBzcJP78nGooS+EV
 gOPljA9/LioHkl35K+9dax6wQaGOhP+x1g9EUF3VVa9xfrVMCdcoWzlveWM9L/Eywh4W
 NeQWs9bCglVPQhWCC2Tk+IcZN+AmlENAweXd2gWK/S+le855jICVqT2N87zqapKdrHeg
 8JAs+Ws5kznB8A9mjAMCrc3XIVU5/eVupSUxht3YtHrEuEGm/Rz4vnTHBhcx/KEdSRX2
 9d0W+TMVUpnQqq1zgwTQWB41d1HN2G65XkCsPfrF929mjRUEZ1F0qD2j9hAtOHCkqoLn
 XzLg==
X-Gm-Message-State: AOAM531TfwgNwjcVX0M4n8QpmZK9sdkC6Ue7Beek4nk3ae4UQVSSPRWP
 wagBXbdYQmadW5yhFP9w30EYaA==
X-Google-Smtp-Source: ABdhPJw4bICpRBMx5HeraldCYJJDz2R+rg+I59syE9V7H9hsq2MLfMyrxB9ejwWsFz74csOg7ggUcA==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr3998746wrr.159.1621512194487; 
 Thu, 20 May 2021 05:03:14 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 13:02:32 +0100
Message-Id: <20210520120248.3464013-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 22/38] drm/msm/disp/dpu1/dpu_plane: Fix a couple
 of naming issues
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
