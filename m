Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06B670F56
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650A10E61B;
	Wed, 18 Jan 2023 01:04:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5071010E610
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ud5so79637461ejc.4
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
 b=c4+IadVG1v6vHRVEIM+x0TcO5mn4FPTbnM6tL/hFLXlB4bn5l9Jbt7wPGmnFo3/XKz
 p+QXOHjMYZJTJkJ/GcMtBujS33aBr91rP6k8IMjckb/EheH5FEhZQumwetPqeuca5YWT
 Ci+r1VlRqYvw+E13V+qulLZ62H7kYrbSy8yQbF92bg+np1w/p6mz+Qizp4pJ7Q10c26K
 FdenHZCzjdjK4OLvYw4pzb49HerHMNoLRfZm9fMkt4HhRWoggSyABRGy9CwHgQWvEWZs
 CPu+tzZiHf+bahsjOXrmt4eqzvv0hd2iRdJTlA3UrFD9uO9sg2Gl5W/wNlTQWTCFhpPZ
 8TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
 b=UxtyOYjCXAyfS5AQ9YqbRulKqj2HBTuck+4s3wzU8pQyfAqSR97zAcNAfRAdMOI4wO
 cUjqW1askqqoHbkA6E7+Yem1nR5A0EIXHY3DiyVXymr/zL1lBkD2/49xW1/5gFOD6Pgm
 6jII77d9etl6O9ZCrU7I6/jRMo6TbdJ1Wdei6g8UH2iv6qiCi0SRqvwhrA8Z63igBZ7Y
 5FCGe8R8gGstieEr8MXlV2/uDy1sYpsY9cStIG1gKHOoIp2xz3OtwoSJShcibod2nEma
 7GHKhXJaaSqRtg5ky2BUGg8RW3Yn4pMj7RXwsO59CLqCGsGPZluAQO5JRAkLXb6301PO
 s8iQ==
X-Gm-Message-State: AFqh2kqFAuAYYg5z3XxEEeBddu+v32wwyV+TScaF9/tPvOBCzPt2WwH5
 IzEhQMz274Wlw+stwPWnBSkMKcYKf0sIzuge
X-Google-Smtp-Source: AMrXdXsbrX4whZyE4W/TN4wre7PGGEwiXJsJa0DevP/1mPPa3o9ayYPR8cCbC9sb6CWX7aeHGhqkew==
X-Received: by 2002:a17:906:e24a:b0:86e:ec10:ed15 with SMTP id
 gq10-20020a170906e24a00b0086eec10ed15mr4124318ejb.41.1674003869883; 
 Tue, 17 Jan 2023 17:04:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:04:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 03:04:25 +0200
Message-Id: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/3] drm/msm/mdss: rework UBWC setup
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

The commit 92bab9142456 ("drm/msm: less magic numbers in
msm_mdss_enable") reworked the static UBWC setup to replace magic
numbers with calulating written values from the SoC/device parameters.
This simplified adding new platforms.
However I did not estimate that the values would still be cryptic and
would be C&P-sted instead of being determined from the vendor DT. Some
of the platform (sc8180x) completely missed this setup step.

This series attempts to rework the static UBWC setup to be both
manageable and hopefully easier to write.

Changes since RFC:
- Merged sm6115 fixup patch into the main patch, since only the comment
  was incorrect
- Moved reading HW revision and UBWC decoder version to the error case
  only

Dmitry Baryshkov (3):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 198 ++++++++++++++++++++-------------
 1 file changed, 120 insertions(+), 78 deletions(-)

-- 
2.39.0

