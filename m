Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65F6EB62A
	for <lists+freedreno@lfdr.de>; Sat, 22 Apr 2023 02:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94F10E1D0;
	Sat, 22 Apr 2023 00:08:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876E10E00C
 for <freedreno@lists.freedesktop.org>; Sat, 22 Apr 2023 00:08:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso21313601fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Apr 2023 17:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682122120; x=1684714120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuLJIWPT7McWRmjFf9J2eAbiIfK6D/3jAR4EmOgvOQg=;
 b=UehVe7wUqjBURQQtzKfocd/Ltqbu+WDQHz/g4Ek465MkMPQv6IHBwF+XZ/NDbdbKMZ
 2zdTIGnS0WjBjOOBzkNnUGHOakbytrTc4RpbSQz/hohDQhXxgXO220tXjM+i0gxffs/P
 li3NlSNfAj7rKPSvnT0Q0D5Zi3A6P0MAXPGxx3x0gfQyG++X6XlFi824Pj9Srg/eAw20
 8w8iDu3KY5qVifG6aSyKFLlkIbcNjk5BNgTbNrG5HHCwNI4ooPn5/XyUKh5IYSnC8Nhr
 BzMZtb1efoYuXvTPjfQc2Or9Sgszgrrz9WbGWwydduwYUS0au2g1iXWmojmYxidOxGfs
 THoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682122120; x=1684714120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuLJIWPT7McWRmjFf9J2eAbiIfK6D/3jAR4EmOgvOQg=;
 b=L9uxIK+hp9rTuEtplHTlDIC2V99RDMROyAjmB2TlAPzbNSauJunioCkza9wIMHt9OF
 8zeEq0YuLhNL0OJSPc5YTuPFVYjyYRIsKDdr0sV6XTo3+youChaQQ/1uoDuehoN4Bgws
 FoHVy+uWqdrXYAaNZnEzo2jrqbK/asSQ7iRQW7ltuLvGkF/+38YPM7HndlESJFo6/Q3B
 h1PNGs2dXxmQ0fk5etW3NsgY3q6HWPu3zVKFWKIkFymyUTRJLDxfW2cBEEMFbrw8wJO5
 JdcUfMOLvYtRhDHFzOvOm7opAjvgkYsdsKR6EWu0WxnMmJZcVBAyXc7U9XW20Lbra99k
 CmJw==
X-Gm-Message-State: AAQBX9dS6/dmtOnHE3IaWTpMjp9Tvu2cga4RS3SYrB/Xn2dDYOwoEP5R
 6t/MvAm09SB1z2VZsE7RS35Tlg==
X-Google-Smtp-Source: AKy350b/GMzd5fPsHipMD+26tdLwzmryErhQNZVDm0qigfioyEtdKDTSA9nMt9HvgBoy8e99qkp/hw==
X-Received: by 2002:a2e:3002:0:b0:2a7:653d:166c with SMTP id
 w2-20020a2e3002000000b002a7653d166cmr967978ljw.3.1682122120214; 
 Fri, 21 Apr 2023 17:08:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a2e9cd8000000b002a8bce7ce0dsm744681ljj.107.2023.04.21.17.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 17:08:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 22 Apr 2023 03:08:36 +0300
Message-Id: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/dpu: drop _sspp_subblk_offset()
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

Rework dpu_hw_sspp.c to access sblk base address directly rather than
getting the sblk address through indirect function call.

Dmitry Baryshkov (3):
  drm/msm/dpu: drop SSPP's SRC subblock
  drm/msm/dpu: access QSEED registers directly
  drm/msm/dpu: access CSC/CSC10 registers directly

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  10 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 184 +++++++-----------
 3 files changed, 66 insertions(+), 136 deletions(-)

-- 
2.30.2

