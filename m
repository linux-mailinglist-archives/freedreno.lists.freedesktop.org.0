Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D6D9A4928
	for <lists+freedreno@lfdr.de>; Fri, 18 Oct 2024 23:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AED610E9BE;
	Fri, 18 Oct 2024 21:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F36R66Lu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B910E9BD
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so543942e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288163; x=1729892963; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Go5ATa3ANcllBgMb3i995a+Tn/9iklS8uo3r/4fZl+Y=;
 b=F36R66LuKG537OMcWvhgMUFYHHNhV6tpLOHDBBorjRfpPHMR6P9eVAN+nzKtODXWTB
 EjeJ/QRZWfCLriYqgZ+fp/ZAhqc2jq+Gyxo8r3XCd6xWXCYorSpslUfn7oFmOg3VT5Ai
 WMvmQs7m90ALVouK451Pa4AGCq4s/GyZdzrYrHT74zmt6WFeJYeocmuvi6Ea64oj7gzv
 UwTqB3K+a2GF6pKOzeM0BRfN7iQiRPS/7/w8RIyhV6LYWrCnv8JJVLNaRJrLqDmqdXTV
 laW/DpnQ4WluYI0NhWK+d1h+ZQ80EIyrF0VVo71LILFgX6DnJ5p3KLpBI0K/Gt3FhhUh
 j2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288163; x=1729892963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go5ATa3ANcllBgMb3i995a+Tn/9iklS8uo3r/4fZl+Y=;
 b=oMWBHHokxQ/1qspPNOY+gqKvE4iE8GmcbQlvqboqgYhXHyLtOUO1jK/sb1PW9iwf7Q
 qhc7YG6WB7h/Xv1OqVrgtGi3W07BjRKjn4gWhZJl+Ntl5Zo1OrgVxf2moCgYdLVqo9zL
 UtWWTR96BXGsZUTwzfn8W7jNGFbh1chbhvOZlM331Tkpoeoxm0tmRzTS/IxAVASjkSyn
 PcPwNDJUVga5yY1UGypt42vObdXmJloe7p4/lC2Cgzh5ER/XP67/TJFpsSh3epz0K+Vp
 CkcJAtecl3R/wR5WDvqKQ3LQfNw54J4vYyJ5B1i2I5NHRIfCKI/GMI3ncjCGWK3CGHRo
 bFPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMvwCl2o/IDhRPr3njGRMXROFeoV9ZUh+dCeDhGsVbJH2s78eJ18q8y24GZWFSTJr+O4hoJ8eGb98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrOOt2gwSjMrIpMkNrE4cxJLPUDZnfg0tc5O0+jMWOcCZVaHSY
 yjPzJxBvs08MrVUS5lEkupCDv3xcXNXcgOcErun/HjhkKXjtBkb5bkdBcCJNXik=
X-Google-Smtp-Source: AGHT+IEo/FMuV8BXcaeTLXW0eKYEblPO9D0Z6JBXczbnQvEt9ytqgCebRe6synIHwL/ExZe7lEvCMQ==
X-Received: by 2002:a05:6512:3c9e:b0:536:a695:942c with SMTP id
 2adb3069b0e04-53a1520be7dmr2388053e87.7.1729288163023; 
 Fri, 18 Oct 2024 14:49:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:13 +0300
Subject: [PATCH 2/6] drm/atomic: add interlaced and ycbcr_420 flags to
 connector's state dump
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-2-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bRmnoe4tVoeG590rXiMuIqAybo/BJ38wHNkcgqIlmso=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdV58nH3hPAsgrDZ9l/GYMAVX0S0QXyB3Om
 au9VDJz5tGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1VjhCACxMe6Efsk0jMD+km71rST56+FRiTPqH+ulz1SSX9gFC5ae64pRNdtVSouzjEQta4XWO55
 TR8odbc1YUb62bW4jdPyQ6hWGQ+m2pnJ76JcZTNomBlvh9WBURN/nn7j3Izw6QJK3o/hozejaOu
 VVfbcWJGzREM7vnHQV3i5fpBqIbd31u9+zf4karPkxgVnUj+6FuOCVsmV/Fp1rRJZQKlpiKq0yd
 MRJFtyJTPKHvXbPGc/wautX5WvPq9TLXrfb8bbaATPxf3th7DP5WbsDfNMSyrfyOjEMsspoQ8Jd
 YGmInnt4UhpdCGWANP5rPQGdkFDWgZc3Rs/ou8nS5YNF2/Go
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

Although the interlace_allowed and ycbcr_420_allowed flags are a part of
the struct drm_connector rather than struct drm_connector_state, still
include them into state dump in order to ease debugging of the setup
issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0fc99da93afe..9ea2611770f4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1132,6 +1132,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
+	drm_printf(p, "\tinterlace_allowed=%d\n", connector->interlace_allowed);
+	drm_printf(p, "\tycbcr_420_allowed=%d\n", connector->ycbcr_420_allowed);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 

-- 
2.39.5

