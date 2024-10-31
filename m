Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BE9B7DE9
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2024 16:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD48110E8C9;
	Thu, 31 Oct 2024 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PUOWpMLU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1F210E8CC
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 15:13:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37ec4e349f4so653190f8f.0
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730387593; x=1730992393; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LCHAA65MmVVFpwvzylnSVqRrMzyJQ2PBeQVwuG34xXo=;
 b=PUOWpMLUgGW9UUCG1MqCuy3m2AJieI9QVTOVszE+eRRU6TqSYrZwbH+Tcu4Gf8DVix
 +RGY0SH/0CB1nO/vitPEFLuHE2/ChjLro89qCoFH+B3fT/R23LpEGsLIaWgOMu43Fsb+
 fBtmxqrNotlDyWHJngiicaOcCST3OAmSnVneSxW49C6gSlZSbe8xwqPevsqoZXSDlxhZ
 CQ6IzsI78AKIDn/4wsOtQ8fxsSioZMsx9HdEmJPN7AF73YxyX3w1D/wlPg57P6Awe3WL
 2QydbQxHLdS0r+r3VWpBstoTMVX3FuNt5INFagvAS6uTFA6wk23BlN+rZPU03kPpz641
 /Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730387593; x=1730992393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCHAA65MmVVFpwvzylnSVqRrMzyJQ2PBeQVwuG34xXo=;
 b=N5S02JmxdQQk9AswhGujbJHIOhJyL+StJ2iJ9VD4biu0g4HXGm07VkjXgurBgYR2HI
 Dvst4JM4hZP6+md1VIkS5seCuaJEIQOa3R3FXzuuM4KnagLlFvEoBvdtpUwqrcF60zmd
 LgaixVRP68QWccpbZvWwn+sRjtqcEIpFk+pY8mE/37B3Ol97+fg2ZIhYs8Sx71jUPwUf
 PeOyFFQ108g/XfuLxpOYOkO/ZppKYekfA7YPQsSXyTGaWT2rt/ClDhqVrD33j9DmeGgh
 XjzejbPzSuv2xeyltipzMkSIhP3kUILmDUWsU/yd41S8w7/rI9fg9EQlvmo+nGNsKwzn
 t6LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyEDRj6IaU/VVQ+mTvc2/VHcFX3FldQbOiY0FFH5PpX1LzzhpnbcIFQ0ZpOdhJ5eHIiiv7St6liIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeYHyxDyHo0sZN3Uhc4NR1z/QVnPS+u9vmXPYZpGz974M/IRWt
 pkLowQklUqHMpS6UGEj5V3zRViuv9D4OEHzK+ACvbc30spIhcfosta2pPTGXCCQ=
X-Google-Smtp-Source: AGHT+IGLAhJViAJsWNEjJ1x0ZrUiOA5rP+aDAfisAGK0oMbFmg09U56thBBAHPC/VibMF55iqNG64w==
X-Received: by 2002:a05:6000:2c8:b0:37c:d1bc:2666 with SMTP id
 ffacd0b85a97d-381c7a472f7mr268493f8f.4.1730387593293; 
 Thu, 31 Oct 2024 08:13:13 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 08:13:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:46 +0200
Subject: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=qTo25L6lJakOHs7bQLmqHAn1KYMaDHnpIwjy2cJNPvM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI5559Yxkmuow38QV8wabJ2bKSot6NxTaSLYmN
 g2nH0RwB6yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOeeQAKCRAbX0TJAJUV
 VmDHD/481bhsfTSCoMir4f/4gp6iKjR2jI9+OveNVVHlg1D6Tz0vDg0quYA7KScPdxZ3d5uVuXw
 enHzdvlUtqxwUehaxfa9hA+1rZGtCLCHDeUYXk6jLzdYLUoa9Hs7M2qC4nuB9aSM4+9LrGwTnvN
 rhgbrUi4sFu/T7ilSm1kAYGc+YrU2kZSQ3YRrqL99tABGDJ1AnVCA2n3V/9D6YFBPn2xKXze/ab
 EAYGV4PMF9VTNEUO2hISo22WRF4cn1GydxAvOlkT23AATf0jrfkd3M9UkC/xMDuGAaJwBWamHPl
 sOhIuytjO+xJXPqyvnOtjg/jTs8EJozYqt2jxDV4L7Ht42ZecgOCp796FAg+0pEBYe1f6HXhtQy
 Yl0Sr2AKrrQLiEvciNjSwPniDR6cDNpHd4YvuA+D/Ufd9s4S4bnT0LkIxz2hS/9hyggj/Lyyl5u
 m9d/tn+1dxPtExVusFCpQ39E6mORcrXo5obxWLBwQwWOyXoBkgi2LCb8keBkEwL2nxYgNh7xN6E
 zvjxgTJQFmwlqQMUrLUR0rkou9XaCK08ynC2TtPtJ4RuAGJLxwvq4myWFgBXvS1zWNctzb9nf1u
 zdTSnqFWgEvIAEuhA3J86aVorFmH2PcymJNqPIlknYCiMZdzaCUkngv+Hjr9HvF77kbPUyBVaNL
 xfveNb5Mpb1506Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them.
So use the drm generic helper instead as it makes the code a bit cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
 		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
+			drm_dp_lttpr_set_transparent_mode(aux, true);
 
 			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
+				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
 				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
+					drm_dp_lttpr_set_transparent_mode(aux, true);
 				} else {
 					outp->dp.lttpr.nr = nr;
 				}

-- 
2.34.1

