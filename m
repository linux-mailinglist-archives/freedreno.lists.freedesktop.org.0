Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCF80200B
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5060B10E24D;
	Sun,  3 Dec 2023 00:28:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B537210E0BF
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:27:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bccc2e3efso4400053e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563265; x=1702168065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R+F9KtnHAuBlxFpyMIAKCtS5pRfWJWCefg52u/IwI3Q=;
 b=sTP5GMQ4hMY/JJnA/Elb4lk8bGpnWgicls+jT61LeD4qC1xiM2Q6+oNx/LBikMfX7A
 NxDaivp2fRzc91S4LQ8oMEblI7e1AOiRwWEwhQqoyzSk/eSoL0oJlw7TQtIgo0xik+kf
 JsOuAkZa1uw5gPaBCw9jcaSEr2JCgesets3DIKqXe64sqWPGCa6nDNY1vwM4o/dXtv1R
 eXt/YXQTlzzrD34mhzwZ6y4OegDxC3KeJf0v8JKYUupfmEz94dkVo2qKugE/YKc1qAJO
 9iVFYBs/bTeW1gV/l1J5oeX2LXtaqRAxh+wHTk1NS0/AVg9z58dMuZV6JVZ3h5StNEFe
 v7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563265; x=1702168065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+F9KtnHAuBlxFpyMIAKCtS5pRfWJWCefg52u/IwI3Q=;
 b=u/9yOw8poNvpgwIZVDa7TSRpeKdy7EwIDYnWM72/FMpjP2SvBiSdvK+QCmUoXDm6P8
 DRFqj4F3GaNn/Xic0Z2XZGUOHTjiwp+NmK7CG7lzZIzgopdJxCTns/K+fEntxKPRh14A
 gGzUDt84lRuSryQn+acJygo0/UksybQZQ8TqlUHLMjQgkmoDwM5x5aZGiCn1yJroKMey
 q+7ZZMph7W/SvHAeaPs7JJFGI/p2qWwDTnAzda6nzOm1bTyo3ugKwU/SDrlyAArLI3GO
 4YI1vv4Q11ocFakD0gK5dKvLS5TxnMtbdvCLAJ2CQJNr3nibHMRzHPyXFkz0HF3ZtHV/
 PdhQ==
X-Gm-Message-State: AOJu0Yx224Tud8y9ROELgRPmiDRpenbzQlwGdYSI3rmvLHDYZBx2v8j9
 b3x1Eszzn0N6f6agghgKbXf8ww==
X-Google-Smtp-Source: AGHT+IHHUNC4uz0HPKwvp/xqcySBZvS+jzdLyICyBJtqV7EARMTu6wxJEg42v6egaFhvdHxCg5LZSw==
X-Received: by 2002:a05:6512:401e:b0:50b:d763:fe40 with SMTP id
 br30-20020a056512401e00b0050bd763fe40mr2278754lfb.91.1701563264970; 
 Sat, 02 Dec 2023 16:27:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 03:27:40 +0300
Message-Id: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/3] drm/msm/dpu: enable writeback on several
 platforms
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

This enables writeback on several platforms where I could actually test
it.

Changes since v1:
- Fixed the CLK_CTRL for SDM845 platform.

Dmitry Baryshkov (3):
  drm/msm/dpu: enable writeback on SDM845
  drm/msm/dpu: enable writeback on SM8350
  drm/msm/dpu: enable writeback on SM8450

 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.39.2

