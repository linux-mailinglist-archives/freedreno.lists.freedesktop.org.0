Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A980B83E159
	for <lists+freedreno@lfdr.de>; Fri, 26 Jan 2024 19:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1953F10FD42;
	Fri, 26 Jan 2024 18:27:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98D710FD18
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2cf4bc44ce1so8475961fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293588; x=1706898388; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=cRdEUBO3QUDhCBN/tLoxUKrQybsLNKARJI9VV7af3zeTJ2qPNDHrEoRO9kbLXDsb6e
 R/zuwtsTzw5ndZEZpsKWlXQq/9thuQ5gcUysktOKzGgM9BC2QNrJ6aiF9Q7JPNygXI2/
 9xPJKLidLHPj0jl1lBlsRU1ePvFt2mN2bcHCwxUUAgw8/0ce2HT8siM+D1PSQsk0L8XB
 MXoyXlbYp1jtCfohKax69ER1VG4YqZqduaiyQT8+RagzG1u7bxZbUmCDrNa0DWSba2MM
 wmyllNmR3kkc6Fbmv3iLiJf7b8FzzuPzsAF1Tzgwc9MdfVbTx35ju4IpWd8mIXw4xgUg
 n6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293588; x=1706898388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=OIm0ABOZy4SfthVdbglbAnSQnPMMrxLfapsZx4Yg+CsgvSsCnd+ATWJG7uoGXj3kwH
 l0C85JInNFJT1BPPAMfwHfBq+Y/kOM1ei38+GWhhL51xKSLuQtVp4roJvWBd3L9DCaGl
 7RNPj1sxm/hWP1JdAy1+r5mDT4UVDfm3mBB1hmzvR2pjf/2isrc7jVp2NvNenZyr2bdn
 OKPHG6OsY3qSOayTtMh1A76YhhgIIEJs05fGtvmTGU6C+N1yZu8O1EYAXLqholL22dpx
 dzymzIIlJ4KfR8xqq6ajpcfRAuIDqbNQqfK7er2soLmcKy59LmlIda5dI2ZS0KtVMGuc
 yseQ==
X-Gm-Message-State: AOJu0YwuGtbI5MdSNPjWOgZpwMywSfpt11GizlFIajNc+4+Pl4GHzRh7
 y4cvoEYuum/mJHfIW2DE74PX0ZLPz2IGldWjlXmF8SdOAXlVpGXmWKDkT6mRFzSW9fe3an/tcp7
 E
X-Google-Smtp-Source: AGHT+IFiRKKpC1MmWIOnmeVOU5vtrhmk3jEYF1uhWYyx+KxUzzr21U3Wn8emuBWR1ul2mE+Khq00Vg==
X-Received: by 2002:a05:651c:8c:b0:2cc:6928:ee59 with SMTP id
 12-20020a05651c008c00b002cc6928ee59mr124763ljq.74.1706293587940; 
 Fri, 26 Jan 2024 10:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:21 +0200
Subject: [PATCH RESEND v3 02/15] drm/msm/dp: drop unused fields from
 dp_power_private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-2-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rmn/5PvPfVfjOeuI1p7jcvFa+LkR/j2pj777UEZHw73
 3Hi3hS1TkYjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5BYb+xeeyqxS4R97TFY9
 aJ6ldumqBV9IZ4uk/TK9eFu+K12lcaYMr/+6rm3NS9B3lVY4PSFx1zPV405TjpR9532oY9i14n6
 y6V2v91e/7dznbrNc5cijwgctVe9rZf/P+C/md/nkHAUHT03VwB71e0szZexvHjL2C24OkDQT1V
 RiyPk0N6tzWn+U03qZ0oSfDFELuDmmpIsInfO3WDOjh/XzBK6rH5pkw1tuXXuoJLWN5Y6ioeeWG
 bz+s30WyOUyLLi3/f1EAQW1qCVP9TS4LJxCM1bcups7u13mjWOhwrYz61/2WPU2NTz5z3uq0Ukk
 MOzSJNW4ExbHuG+fMa/o+tz2cV1w23YzruUldY+knXoA
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop unused and obsolete fields from struct dp_power_private.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };

-- 
2.39.2

