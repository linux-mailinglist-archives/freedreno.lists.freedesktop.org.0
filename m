Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F166C2737
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 02:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64CD10E6B0;
	Tue, 21 Mar 2023 01:18:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61F010E6B0
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g17so17242810lfv.4
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
 b=GrqYqhhsIMn2xfgfbCoGZNP53LWMZSCxJxVxh3b92VCfmVcZyZUhLADpEkxVp97/9c
 coPwD3Po75Uo65GLG/15Gvq6yTvNxeewn7Mrsnh/khiwtGIoB5LkPuns8HyzC7HeReEN
 C2jeqtmb6IyzG3THhmf0DKEAkahOoqU9wEQ4jWyAxBwJhtJyasCNn5+nVVA6EFOepEOS
 5LSfRGmGIra2+5+hsnsm/2nNlUGjd+m0MpLQHBaknMk9o41sddol+pC0pHkiOis7TO74
 bBCbSuqzwcQr7XaHb20OYQU6JHi/tuVxIMij03/ce0bwEMdwqZuMxU8+WoKmMrGhG144
 WWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
 b=zXJA8RSntEc9g6giFp4ouqnalkSwCNq1kM5w5ONGOjexWOaRrutPI+6FafKUDgq4Ew
 PnkPv93eKqkS+VXS8S7PAP2aWZs3f1Bdf5smwrR6zzjJWywgjWijwz8vJ1sKF/pY3QOK
 6G3dchmu+Uqj91W1Xv4r0pfqflM/HuUEQLxc9I39XPKKzoUkggTqZcuYd1qur8mIsj1G
 fotof1qzqqsx1rTnBT5ew0iPIP7ze6fev2WMod6E20suHKBx+4sPTqzZSgNi2cQUdoA9
 +gIbB21mqoBIXmlkmB5toyAP3jX14pub5CV+6PS+gg8uAQaWwseLspBJz9S4wic5nYgZ
 a3Ag==
X-Gm-Message-State: AO0yUKWlnJBHvgg6/kMsVgKQV0nV9PftjKeZTAlJuy0fXBu00p4mBdRE
 fMGEVW4K2FHJk4lbBWEmis+1sUXXVOZG5UK3qifO/1BX
X-Google-Smtp-Source: AK7set//en3R7J7A36LAkaMdnCjbcNGxUJiPViGi+MCKzk39MaPSyhBsndT6fLK50TOdhIsO+FLMfg==
X-Received: by 2002:ac2:5961:0:b0:4dd:a718:31dd with SMTP id
 h1-20020ac25961000000b004dda71831ddmr265068lfp.12.1679361504107; 
 Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 21 Mar 2023 04:18:10 +0300
Message-Id: <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation
 into account for wide planes
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2e63eb0a2f3f..d43e04fc4578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/*
 		 * In parallel multirect case only the half of the usual width
@@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.30.2

