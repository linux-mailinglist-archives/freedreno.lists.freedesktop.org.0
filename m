Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58729AAC9D2
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 17:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316A710E6E8;
	Tue,  6 May 2025 15:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiUN0Bbv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5710E6E8
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 15:47:52 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-306b6ae4fb3so6317327a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546472; x=1747151272; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
 b=hiUN0BbvE+5MMrOESy0KPhaI2zBMciURZm8Vo+7j4iL0ScxdXhZihjypGzch0ty+ct
 m4AX5nT0xD9WWTkgE/PJCiXlIc3+/VHjvxcr5/D6C4Ew39k2QaODmUwEGJC/HiFDLIFj
 IEWHawgbxAqgZsk0qsfOTW8FlhBWi2PD3vNCz5bB4BMagSqol8wIELmh8E1aSOs8gJDX
 UvNFsfF9DeUeee7xKpsBe18QTMTdb1eRImvhTNEROx1ZCjGdZB8eOajG/O92pkWS1WWC
 CWbUEQW9LJX2KGVxjrTHwWfenhB3Rl090rseVJ8cHSJ+F8qHXKTHmYbxst1ZKVlmTHvC
 w6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546472; x=1747151272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
 b=d3LOQ+eLzgVwfoNKlnS2EqhiDvj8lXzEl/+rjnni3Zx7ucvY30FeSEmRNDh1uFjjNF
 WDcK6n2dmJCgFZo1l/nigsG7ktAhfAbgNQ7yYN51mZ04NpIXnX7rKHgp1Lk6r8qpWCxZ
 jvB71PMBnp6OFdCVBJVne6gT6RUgr7I051ApW1RS4uGf10BP3KfksHy9oKEi5wzxxc2n
 3dQKZWGrFxGJ6nrnoINMtB6HE66o9IvL1IVy2t7MexqroEnx5XIfoIjUr1EmOpJhgyMb
 pvUm3faVfPowGXV5LPfXtn4DAlUMPA+16uvRfck4GxDBGOnhvfMNG5Ap3AQRQn9Blkbf
 OuxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Ag2VGy3FA9QHcmIIqTZVurwbgmueqm7VwhU9mfUAfxH4HcLIdSGmbOiNpZkrJHIGFM1XrbOL0EU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlZfWN2jzUvI31sb+Pa5NXzKi/fENR09gEG9esFcya/ByjIGMM
 PJi4gfP3DkMpLBtsuyQVBe2fLtEGnIXztxrkZHe8v7ILuzrlzHQz6abJjSTrXVk=
X-Gm-Gg: ASbGncvHPJXnXwMPQ4JJ3L5QufR21azpy6cDNiVGKErZzNT51haHfUeCLDfGLhJ+V6w
 lO4DEt9m5akqcptMHZDgqI88HOJ+yAtjkP7Gms5P6yPKRkURCu5eCbML6Dxw1ejDJnCplDFawmN
 rFhjpzMJwg+S5RrY8y367wW9F384pqoddBpoKtCFzYEyk43/lFd+suht6wGiXlV/3E5TmhydupL
 0NK1a4oe0+6F26cCF7Za6D1k0XWT5UeLPt1vACov7tNlNnkGBAcFArKE+SJ30w/DMmYeGOPmvzN
 qDQmValE93a4R8re/DBaRssd4NsHO8I3uczcEw==
X-Google-Smtp-Source: AGHT+IFnRgAer2YqJDKDG8WSftGtJ1rR+zxfOuhlRqYyJ424rX57bTivAhXqIy4syKRnXc5Ylo86Kw==
X-Received: by 2002:a17:90b:2e0b:b0:309:f53c:b0a0 with SMTP id
 98e67ed59e1d1-30a7c0c8b02mr5742205a91.24.1746546472392; 
 Tue, 06 May 2025 08:47:52 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:47:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:31 +0800
Subject: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before checking
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1629;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
 b=zpOMrRtqL6iX2AnAGqg8NxcePk05uQNGAMoOqxpNJZAmmvq/T93PJYpj5MEkzyl0Fs18ufdNZ
 mXIzLx/KpGwAtrE8yNGE6pJr71Tx85cXy5Pz8Ck0WGp71qZ5JT8CS0t
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Some display controller support flexible CRTC and DMA, such as the display
controllers in snapdragon SoCs. CRTC can be implemented with several mixers
in parallel, and plane fetching can be implemented with several DMA under
umberala of a virtual drm plane.

The mixer number is decided per panel resolution and clock rate constrain
first, which happens in CRTC side. Then plane is split per mixer number
and configure DMA accordingly.

To support such forthcoming usage case, CRTC checking shall happen before
checking plane. Add the checking in the drm_atomic_helper_check_modeset().

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		funcs = crtc->helper_private;
+
+		if (!funcs || !funcs->atomic_check)
+			continue;
+
+		ret = funcs->atomic_check(crtc, state);
+		if (ret) {
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] atomic driver check failed\n",
+				       crtc->base.id, crtc->name);
+			return ret;
+		}
+	}
+
+
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;

-- 
2.34.1

