Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A5510AB5
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 22:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657610E226;
	Tue, 26 Apr 2022 20:45:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495810E226
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 20:45:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so34000225lfg.7
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
 b=nf00EnqdTVuaInkiRTATH+wUsR/zbQ065eWO/SHOQRq+jUqnz2T+b+PAXIDC7n1cvU
 1bP88lnPHF44nCEXVir8RcOzwvPbEwH+k5uwk2A6ol4eUptrZSJwfjBij+14Rvmgv+sz
 872oZ5AoOlYKcqNjCog/1ZRF7HWG6b5aombucXMM8gV/ryBWgM55/6Yq9R/Hzf75ktMD
 1yXZwZoobeZNkVpaRaKq5jyiKyMJgK2eOwTaVyTBI7F/cc2pHrejAtbQBMqp7RKpZx9G
 0I+bGaR+WxaE+2v9Fkd2dJFvEl9fcObsdRpQx/l7JKkJL6LLkzReeeYp1rdMbvJKxM0I
 r5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
 b=w/v9T6AaVBE4pbaEBiQEDY07S92db1EIItZNXm9g+h4ACDv0/tyUwlQ8vzJIwLprSN
 lq/p9MIdjOEQEBvblYY5czNuotYX601bp9eH4ukZFh7A/PkAlwOo9wdgYpoKqc14aV1K
 50PTqjnYXgM/kbp0HZNhguKK07bCEBEbwtxIe73qf/GjDFtCbdtVch0oz4tG3LQnSNV7
 rvPgAUmF0qvxRfiZA86teizByM4GT+vIHA22CZsoPKqAMmAgHtBY2rV/e+1GbzXZyO+C
 piio+4jNGO5HWKjI962taQCmzWNxdLzqA0iavoJcYpm9ho8uRMUUO0MfR8m10Q7vuQ/7
 MtlA==
X-Gm-Message-State: AOAM532y8MpEf63O9lW6xW+SRaZoeFe+IUsDVJxAHc/Hgixqj34swx/u
 eZxqB1NezDLgUJyxNrmAjvbUrg==
X-Google-Smtp-Source: ABdhPJxf3pN/h29eAqBJozLJJk5QBm26rZN1LDkpibb5aehmkalHRNBXTcTjnEEWQSL3XAO3mcVSAw==
X-Received: by 2002:a19:f24e:0:b0:471:c076:bfb9 with SMTP id
 d14-20020a19f24e000000b00471c076bfb9mr15799324lfk.442.1651005929750; 
 Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19dc48000000b004720649aa22sm888322lfj.182.2022.04.26.13.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org
Date: Tue, 26 Apr 2022 23:45:28 +0300
Message-Id: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL] qcom: add firmware for several Adreno generation
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi linux-firmware maintainers,

Please pull the firmware for several generation of Adreno GPU (A220, A330,
A405/A420/A430).

The firmware files come from Dragonboard 820c BSP available at [1] or directly
from Qualcomm at [2] (registration is required).

[1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
[2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip

The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:

  Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware adreno-firmware

for you to fetch changes up to dfa3c4c30996376dbc3adb530c0505b2efad583b:

  qcom: add firmware files for Adreno a420 & related generations (2022-04-26 23:36:27 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: add firmware files for Adreno a220
      qcom: add firmware files for Adreno a330
      qcom: add firmware files for Adreno a420 & related generations

 WHENCE               |   6 ++++++
 qcom/a330_pfp.fw     | Bin 0 -> 2212 bytes
 qcom/a330_pm4.fw     | Bin 0 -> 9220 bytes
 qcom/a420_pfp.fw     | Bin 0 -> 4292 bytes
 qcom/a420_pm4.fw     | Bin 0 -> 9556 bytes
 qcom/leia_pfp_470.fw | Bin 0 -> 1156 bytes
 qcom/leia_pm4_470.fw | Bin 0 -> 9220 bytes
 7 files changed, 6 insertions(+)
 create mode 100644 qcom/a330_pfp.fw
 create mode 100644 qcom/a330_pm4.fw
 create mode 100644 qcom/a420_pfp.fw
 create mode 100644 qcom/a420_pm4.fw
 create mode 100644 qcom/leia_pfp_470.fw
 create mode 100644 qcom/leia_pm4_470.fw
