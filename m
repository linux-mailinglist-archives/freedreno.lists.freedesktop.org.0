Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F283D039
	for <lists+freedreno@lfdr.de>; Fri, 26 Jan 2024 00:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016C510EB04;
	Thu, 25 Jan 2024 23:03:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC21010EB90
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:38 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-510218ab26fso1165872e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223756; x=1706828556; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=aTKLIc/uM0pkazGRax83pkx+9Et4feu/KQPDrG41EN88dYiY9xRrUMJ7uX4PGQsOwL
 3dK06/UnrjK21mmGZGvwos89SInhap3y0FsAY9+2W6G2Tx+vlgs0SWM5Kj7KParA4JnP
 6HceIwb8yhNszk7cj2mBVWTI3cKIyxzAG8WtBaLfGOtD5BxaVtvJ4h5nfUEC1nnNEAIT
 smfKHE/jlfmerCk8jirQPscfdkF/raP8rUaNYiXXnkxailzeb2McRayPYCV1TmzKucO+
 E3cfUjEuJL2RrLV1DW9MsnJqIdRUuP9nz+j77qgMgvAE7E2jxeo6l+WV9fG29JI7VYmA
 MIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223756; x=1706828556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
 b=gqz9njpjZry5nMpQm6PQ4HwHkPE5qHHpQ26f1oE9DfMFjO10zi3TWoGVnMT538oSon
 exEz6x6KDIweak31yK1TFgABRv5BSSrrdT83a9B0TQBOp9DNtQ/A5LwQaSObRnu2vdni
 v6BiY4whQ//RpVTBLgFy52VGuYWNbgtQ7ojafJJzLJgoZbxB0pa9jUj91H7cdAHEnQya
 y1UVvtLP8Vf4MX+LTIRSLxZ3CMkD/AZO5wOQK1K1A5CeVLNYYN2OkrYCZ4s3k5b+SGUw
 nJwr4fG1QSNrSqSf0oQiQekrMRg1n4xi6KBYKYAfc0tIqTy3rqCEZE+SVJTkRXiAjCNu
 ndyQ==
X-Gm-Message-State: AOJu0YxgJ8XT9ZA3OGM24WiU8A7Vi1SfTipIrk4Cd0Glz2qhjDWi/NRc
 zel68D9B7m2PiEEkgx4QOvWJ9gu6ZxtbIbveg7rzvD8uu2FuTToojs/nTCEoItR8FcG2PswM8qu
 O
X-Google-Smtp-Source: AGHT+IEuKmhBr7IQo/zONLid7ms8H0qa0G0dcB7qK4RFRuOeXXZWP6ac2gg12ffU5Lm3+olFvIF6BA==
X-Received: by 2002:a2e:9b1a:0:b0:2cf:1920:97 with SMTP id
 u26-20020a2e9b1a000000b002cf19200097mr344865lji.12.1706223756527; 
 Thu, 25 Jan 2024 15:02:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:31 +0200
Subject: [PATCH v3 02/15] drm/msm/dp: drop unused fields from dp_power_private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-2-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGNAr46NZ1w3CBIbbh0cMys0MRlrs8ZNB9P
 X47yQghQx+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1eIhCACS3P/e/pspDDThYqBfabbu16Uv2umGS2kEE4M+SDXkVivOv2L4UIctr44vgx4crIZl3vG
 fNKhKsxM2WgzAvpeu0YgH2GjWOQ7uwjdZUfQprbKf5vrtdUcT6tz+PiQ9Vzg4sbbptZfpYPIcW6
 5WDdcn9IeBdakzfAxCOa0DNd6LiyfH/z7J8vhhksuVCtsXIjXdkmEEuSleiUtv1es1NKsaWRDe9
 hsG7K0ap5JdTQ27Zu8ab1Y8znqr6+uIqw1JDi1FMVrHWw8OO/FSE2gku1vYMDCfiWceGVWDjlcj
 vUmlmssgG+7PjfFh1vMbQ0WvIzA3o47fEU86H4XfhD3ZjjsK
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

