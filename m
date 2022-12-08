Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00BD6465A9
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 01:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1B810E442;
	Thu,  8 Dec 2022 00:08:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CA110E442
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 00:08:53 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f20so9532496lja.4
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
 b=PBVhQNapqr4cmLJCdR8D5Sdl5P4/8tpAEwjNuEE2wGLMJ5peKvdtsnI2ivJpl+jHzN
 uAoxNVeQhgeQQTBA/aBhz9f4QhlfikT6pl4uSV3hAGzGhExCpvUGtL6u5REV8z3Lb2uq
 tI1KWLFLs3D+DU6rxTZ4OzZmhMYdcY4PP/lP8wu4LWRECsrgeWDpibMAqu6jyzCGXxhg
 LwhVM7kdLxQvfwv3hVhjqWFyLUO5NwEHexMlipGeU3HwEKQqys+1gd3iqrWz4sdE52lY
 gI0Bxmp/Oo0y+A0qGPanxfFyxueP2buHqVWX7eHOfmCmgMvmX6VaxTrZ2XBrl/dxnTc6
 aG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
 b=YWkqTTWG5y/fAVBN9rioCkgrbnxSi2Qk/3gJt5DlRW/XQgOcId2DykdBqLNe17sFj2
 QUTYOmG7vSq1oNdOWk7YepeLT8I9Xl2P3RubINJePTjxHGGjNFBFUFu/kvcDNNepEIxT
 dZLKx8QkT7WsIcOQH7ZILyUJ1a5G1a7bLb4t1X6z5CC3ue6wEVgKARukIa9yaKXx8anX
 d6XslQDvT4rt3SESndqJg7Oa4q8dgZJ9mu4BQ+WtnsnEEqu16AiLNSOvoMjyNYHhH9DB
 v+JHm2MBeD6fIvloqAkvZstxlBnbFwUyUt9kh3LcYwA6PgI8y5Y+pj1vTzaav0BvlhSq
 HK0Q==
X-Gm-Message-State: ANoB5pkUg/wglrlxVG4XN12uU8CzsRgFFDAC/decFJIG+gj8VscQIF+x
 8mYAP//oxEP6nZLLlqnWoV63TA==
X-Google-Smtp-Source: AA0mqf5f4MwUymkUiV5aW2405ea51sxV7NAFzW4fUh0BO0lImetVwSWSzxgMRYBuksvOy7RXokUYWw==
X-Received: by 2002:a05:651c:50e:b0:277:1c8d:27b9 with SMTP id
 o14-20020a05651c050e00b002771c8d27b9mr25091000ljp.210.1670458131740; 
 Wed, 07 Dec 2022 16:08:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:08:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  8 Dec 2022 02:08:46 +0200
Message-Id: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/4] drm/msm/mdss: rework UBWC setup
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

The series (being an RFC) depends on three pending platforms series
(sc8280xp, sm8350 and sm8450) with minor fixes applied on top of them
(e.g. to fix the hbb on sm8350).

Dmitry Baryshkov (4):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: correct the ubwc version for sm6115 platform
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 173 ++++++++++++++++++++-------------
 1 file changed, 107 insertions(+), 66 deletions(-)

-- 
2.35.1

