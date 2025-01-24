Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7ECA1B481
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 12:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A61210E7C3;
	Fri, 24 Jan 2025 11:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u+PPjaQk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A0210E856
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30761be8fa8so20557261fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717278; x=1738322078; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
 b=u+PPjaQk0QWd1M6pKcYXViA+MHouEE/wJp5lL7hGlCJG/mjFlBlbkLbe2qqisO7nzU
 l0ZEGFvUcDeVH+xHTzXmWXkhm7TA9lFurJHTvRywBbYaJ2/3JzcFFRr+yI0tu70fkFhC
 NNPdirM4rQEJiLNXWau+wswoZsGtF3rxSF1DtmxvqnsXJu4HyLP1K7WhyQqxIRh0klrc
 fkPV5lduMZ+SSL/DC6l/JBD/1fa+qYaKTt8ETUCI4v3W2KysQaz2fb/ZiUHZ8mcPYjz5
 NpGzNm4mhNziTXbdwd6EvkkhRO5TnsBKHEt1kPvFpYZ9UEm6XrwOb69QyBe6VntZTHib
 iy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717278; x=1738322078;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
 b=clGuq4etAt0WjiG2hWdeSB5+q5Pl/hacD+BmiWmZ1xScqillkSfyRlcwZDg4lT4cRE
 u6QLR6U3utEyOJcI+8EZo/WWOKfIrgj51CymxWAyPyfg27c2iqvXxBDPMssJ6YnkdZq8
 istIRpj6IoI68I8IoFq6XwRv8i2J9rysa2rEHdYYSs7mnTFaKSpJZ0bKGLre3Dl6vU+X
 TeOSfUhmKNxiNIXAKPjKzs7NTRqlDSqOGeAYWJfSg7F6C39K62L6w93oWniVCvRDAE9Z
 Sl+emkV7/0VQls4GRUD0kI0Wznch5E82zubWVkSiIOIe0TaTYpBqdO4aT6QO+DdlPMoI
 zqRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFhJFz+I+be31Vz2VITX8SapeNkdiBr4G0Bo4w9Ar57gqmUjWP93zG6KQB4POnQHWmmZS16Cu13AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybLWkbOloi/50hZIwdYgtTnGLBXlwU0JVlUb6mYI7SsyZcWngE
 KGYF5XHA9Y4Aws9LV5I0ttL3PR6FI8ILXoKZL4eE+GliKprxXnHcfvWjDWQOHfk=
X-Gm-Gg: ASbGncvDR1W67B9Mei00Z5ih8fifE0GbEjQj8ZHqh9Zj5N9OMXKEupI7iWiFsnBjm15
 MOrI6wC+Z7vyqO8M/mpwpn3f0j+P9FlrctWh4a3ZgoZ1/8lGrBlUX3x6VKDvEcj3npaZyt9wdLw
 O79H9KUj/BHexgzBbB+ff6FVKwt2Mz4jtUWLQp/6FUiMxSMDW/ro9kGNqmqdwSfhZTK4kJ+xOhi
 ygdPGOTTvgmNQtNXejq5YWFJ0Pc+sJq/GGLDQ88Q6J2WwI9TwDa5E3uo/7yr3RL7ifNSDCdkQRy
 WFJvPSv7duwx
X-Google-Smtp-Source: AGHT+IF+hU0ZazCKVSv6vYDDyjuO4CTENcYUETOBAM8LkY/QMiYkhDEDR5ndt0J3TA6a6cqVWwwrEQ==
X-Received: by 2002:a2e:a4b8:0:b0:307:2b3e:a4a9 with SMTP id
 38308e7fff4ca-3072ca9c335mr96093661fa.20.1737717278457; 
 Fri, 24 Jan 2025 03:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:22 +0200
Subject: [PATCH 4/6] drm/msm/dpu: move CTM check to
 drm_crtc_helper.atomic_needs_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-4-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YiER9uGGuMLloEwX06ETqf8kcBguXBtNB7NcpB3/rSM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YV5nq8F9m0El+GSJKXaPPIb12nQcNBZmQDv
 tOzihmqah2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1e4cCACDuTp4Lz5Xz6+mOmcEorb5i8LjmnEd0GHFi0favS9T4leDhX3UvxN1wnDqIT7/IbQ14KA
 IvYZOrh5j7JLlzZhKJaGSwbv7qEZqsD/OULP/+gTbyTEjwZjY4kOKBzoSdAv8gEZMwEdYkrlOzU
 9FKe5VDy46cVYMrr2ekbdX0RNBD1qNrRLCZisI/vxIoZlWCSV/NX8jQvYxcbZLCyJ8F5biUbQn/
 HlN9vXvPj/9esINrbv3gKi4aC5LKw1oiPVnJJS40HeyQ1u0dY+UwAnxvEnsMJsZZitQi08XsZL8
 a3rVkeRPgkEvPL6XVJxU5yeXZ68SW5WD1rr2TipPVLU3Rttd
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

For the msm/dpu driver if the CTM gets enabled or disabled, the CRTC
should perform resource reallocation (to get or to free the DSPP). This
requires performing a full CRTC modeset.  Current code sets
drm_crtc_state.mode_changed from the msm_atomic_check(), from the
generic code path.

Move the check to the new atomic_needs_modeset() callback, removing the
need to set the flag from the generic code path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c         | 11 +----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 65e33eba61726929b740831c95330756b2817e28..9a990386570e037f2b1c994a0140f2b7c4c84669 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1189,6 +1189,20 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+static bool dpu_crtc_atomic_needs_modeset(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+
+	if (!state->allow_modeset)
+		return false;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return !!old_crtc_state->ctm != !!new_crtc_state->ctm;
+}
+
 static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	int total_planes = crtc->dev->mode_config.num_total_plane;
@@ -1535,6 +1549,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_disable = dpu_crtc_disable,
 	.atomic_enable = dpu_crtc_enable,
+	.atomic_needs_modeset = dpu_crtc_atomic_needs_modeset,
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index fdbe49edf2e1506ebeab500e782d456d77ba4fcf..4377233bd6447060b1300cc0d6877b6a777b1edb 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,16 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((!!old_crtc_state->ctm != !!new_crtc_state->ctm) &&
-		    state->allow_modeset)
-			new_crtc_state->mode_changed = true;
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.39.5

