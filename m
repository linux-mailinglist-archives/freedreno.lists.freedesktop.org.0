Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26A6711CE
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 04:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7AF10E658;
	Wed, 18 Jan 2023 03:24:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D5C10E659
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:36 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x36so13205307ede.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
 b=PDM4ZC2iRec3CPN1tjGInxDAqgdmGQflGmlfq4HwSs75xGjghkQXnE///SrRlF8hMQ
 Qo3JGMklyjaacq5UrP/4TLhogF+tDswRA+i9jtee5AzsLXZrmgej0d3j/KShszZwYCd7
 C0Bpljm3dAQCxllPIZMIeNGZA7GOPBkzTs491DiJybMiBG6ifPj2GpwkEwQXWiHeYimm
 I9YP278HdGRK+AP9k9kTl21qWRudauU3r3F6fbqfSTxeyidH3dD4jTF3T9/B5cEK3+fD
 QfHxm3P8Ecv+cBl6k8wvbYIt+JUo4Jc3isfBHkFI41Ar3N1v6rPZe8jAhWMeZ1bKsQoT
 Cu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
 b=bkkncHS/bGw5uoBwtI0sm5gOAQYCZXlmGT+UUDBWcZhuKgsrQZCECVp2OyC9n4FnuV
 vLCepFlF1j7NWeTL+B1e7Txq29EiibGVO8oxg3lwawrSx8GgCQ5Mb6x5u/gxGKGBzCQY
 7niW0Wjedbqf/WYpxWyDvsXRSQ7VhgBUbjNEfwvt9vXQ093hgsAbxaTejmr0fBqLBaSP
 ujM/WxEjBghRQAttnyXw1J9sEzUJzdmYQkCNPG+W/M/kmEW+UYFLLP2xptYL8duxbTCf
 kjrjouhzYjAXEO8rlMpqIHVxp0do2MWGO6V3SjeVQTTfCqQRjmrY/mD4zl8d3OMdFO78
 DoKQ==
X-Gm-Message-State: AFqh2kop6dgE+T690rYHYdmFmchxaloTPljwsWYtVBh5HWEUT43vbVQC
 SyEgYzL3325qwiPwlXg5knNkaw==
X-Google-Smtp-Source: AMrXdXv5ySMa8omogU2DWfZzBFlpGddX6yt47sQUUg/eO5RJgAycTZNSEcC/IRMs9Fu2HFoh4SpaUA==
X-Received: by 2002:a05:6402:5002:b0:49e:1d53:5e20 with SMTP id
 p2-20020a056402500200b0049e1d535e20mr6130218eda.23.1674012274513; 
 Tue, 17 Jan 2023 19:24:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 05:24:28 +0200
Message-Id: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] dt-bindings: display/msm: more
 dsi-controller fixes
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A small set of patches to go on top of Bryan's changes to fix a small
number of remaining issues.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: display/msm: dsi-controller-main: remove
    #address/#size-cells
  dt-bindings: display/msm: dsi-controller-main: account for apq8064
  dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
  dt-binbings: display/msm: dsi-controller-main: add missing supplies

 .../display/msm/dsi-controller-main.yaml      | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.39.0

