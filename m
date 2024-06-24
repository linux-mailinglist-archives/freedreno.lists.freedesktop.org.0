Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71A9150A8
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 16:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014CB10E480;
	Mon, 24 Jun 2024 14:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qsFByJDb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08A610E497
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:24 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cdf9f934fso1954776e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240443; x=1719845243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
 b=qsFByJDbwEkl7aLWRaRoY78fMNsHlawnkoFXYQ98n0tTgcy77tLkqeBtOuCHNdhzW8
 Dr3BeYx6Ai2wYPE2zlCyxY/qOUYdYWZMKLfoGIZojdlKHWq8LEWYBYfT45Xg7gAQwntO
 myou0XADq929wFNNvP7XGowNL2ahf7z89EUVBWo9A3wf3Wy0jnhfkob5pMtXk0HMldqS
 4hwgmuXXKBpk7JVqr8mucFx+PSu+5JmfaSDW8hD9qYSqMEeTk3NmPJqU93jaTp9bFKLH
 MiJJ077VrVdwnw35aKKTPpgK3WgUMh257cxEuo96pqI3IRGrTTfcZZlSNkM2R+nltuA+
 YG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240443; x=1719845243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ+DHa1toN2+n7TWo7+TJQaBjFWVOUMw0Gcw8PZtG9Y=;
 b=rHPyGW56bcPOrdtJ3WmOfNZ9vDTXAMktP2Hxm4fO4f2pOMLs2VaZ4pw/LvbPpkFF6u
 Z165ifETdpTJfX5tk9ZUCrFHdauEUlcqHY/U0Vmt5cf9W4fC6GsTxzAo/onMhCVSDYaX
 6+MfgYNrffBeyQA4/4PJT4spWcKOEl2KQXZj1Qf7qBHn5ykLX5AQ7kK10ZNbhLtGqVFu
 O+l9yf/4hYtXFSbIXvlJZUyycAPX8QybrPDoc0Kms4TB9zX2LhfGdtWW8H7rPr0//Dh9
 5mXh7ga+y4AbrmXuwmPs+LDUkvE7a9UaNfVWl2Jc4rd4HA6Cm0Sz3Z8HWz4f5lyW1DCc
 MUBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr/Wl9YtZKwM9ukkJ8+TjWOXzxlWRrbGcLLu3Ibki4/8m0umBSEPWEW5wXn5Gl+Al7gatG9ZXyrnfkXwsptlG0iuCuwdLv3LAp1i9BZuDb
X-Gm-Message-State: AOJu0YxuYYhWPGLey2wGy/rA9D9EAAXyGrhDWBh8IZC2XOgVDrmqDuol
 sNVsamXaAbV5bjm2+ix3tt32+gNojI82XBHc+20YnZEGIaB0pXiEXvxSXmWB7mI=
X-Google-Smtp-Source: AGHT+IFYs+QdZxu7xVQC/R0vHG0CMkV/ehojX1Swu7BBcnrWQIzEquRrVkOeQ2GviNaYZZN8p7mwKg==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id
 2adb3069b0e04-52ce0673b84mr3108321e87.46.1719240442967; 
 Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:19 +0300
Subject: [PATCH v4 13/16] drm/msm/dpu: move layout setup population out of
 dpu_plane_prepare_fb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-13-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KA3D+m/a7g73ZaHa7e8wf9n+neLVMHpRovLAs28rnZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwdB+x33XFTd68Bqk8Qd+8V4zPpzKguQLAR
 TFcquTWZnaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1eSSCACG2Aiq6eqYvlJ1pnYozr1SXoRLqOGO1q+bShx1C6vjZbh5Z6y/wdiF3rAyoipMEGmQ/vD
 sUh5RW+GxShGjICYW8qelvlGt/5a3fGm9mhT0WDtagmkRIdqG5jLlx4LrYbfVAM0IyHmy8Voszr
 rgIAFFs6yXy+V3Z1tI28DUiqJ3UqSWDrM3kq3hjgJ9LG0sotymjdR3Zxid6fa9kG96sQP+1h9Dx
 qxM7Ctl05l0P8DMGILbqqs0MRkc0kOq2MsK/+3P3ZOcniLw2MhTHI9YYlhWWTvvSl5+rfw9b0Pl
 8wDXuRZwpH1GqKEO0CIBriNoesdaxCOm+vtBXBp0ITPo+jc/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move the call to dpu_format_populate_plane_sizes() to the atomic_check
step, so that any issues with the FB layout can be reported as early as
possible.

At the same time move the call to dpu_format_populate_addrs() to
dpu_plane_sspp_atomic_update(). This way the all layout management is
performed only for the visible planes: the .prepare_fb callback is
called for not visible planes too, so keeping dpu_format_populate_addrs
in dpu_plane_prepare_fb() will require dpu_format_populate_plane_sizes()
to be called for !visible planes too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1431ea753a4f..a309b06b0992 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -674,19 +674,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
-	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
-		if (pstate->aspace)
-			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
-						pstate->needs_dirtyfb);
-		return ret;
-	}
-
-	dpu_format_populate_addrs(pstate->aspace,
-				  new_state->fb,
-				  &pstate->layout);
-
 	return 0;
 }
 
@@ -863,6 +850,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
+	if (ret) {
+		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
+		return ret;
+	}
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
@@ -1090,7 +1083,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		_dpu_plane_set_qos_remap(plane, pipe);
 }
 
-static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
+static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
@@ -1111,6 +1105,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
+	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
@@ -1175,7 +1171,7 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
-		dpu_plane_sspp_atomic_update(plane);
+		dpu_plane_sspp_atomic_update(plane, new_state);
 	}
 }
 

-- 
2.39.2

