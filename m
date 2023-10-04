Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A07B763E
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 03:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131F010E32F;
	Wed,  4 Oct 2023 01:23:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677110E32F
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 01:23:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso1773745e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696382590; x=1696987390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zZOGHdiWccaH+lI+d4c46L7IxfGyvf8H8j4Ss2u6XUM=;
 b=CyRp0Ck+ncUMunWxh4+g8hJM3RiXT4u508GETC4cabK93+b69z6Y2qyZWqTDT4U4KN
 cq5uKEik3U2tXNjyErInV+6IwTSnuIn50tIdPJ+0wr8JKBKVVmbY+eQl/qKx0g4f5j1v
 9EhNrNZwzP5AUb4XcSFU5d4k3Ojv3a90fv3agwF6EJjWGHJy61nI8CPuaSsvM0uhcMYO
 0sv6qpRUC2qmr/YFFUTsJT2Fwz6Kt6ktJaFhElaLZEnAjvru3YjvmL3tnkySSy7zSYWv
 wrorp+iZnPrxr3YDJswo31Q5tvNb9sGqOxzNLUD+KN+yAOjLO2+BcaOrBFfdjJd7x3tj
 J+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696382590; x=1696987390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zZOGHdiWccaH+lI+d4c46L7IxfGyvf8H8j4Ss2u6XUM=;
 b=D965WKLkBD01AxvQbiEahuKAlG0ycAz3zg/ocq3FaEKD2HUhV3xCetffd1auT9wzcN
 6TaL24RSbebzIOJwftLirTlPTfQx0ugLr3JYQmYL1gkIQ/ENbNHWgz6rGOMtelNiY2Qs
 P1hWR98ITnlBDKeFalHRZRwyeATLfCYnBJXdZpdKiN0tGvkykJbly6JKCfRIEO0fWpF9
 /REiIlNkkuYNoWAu1Sr1JpTXUFMwy7VlZABEPox8H0CcolWggqapYEPZGFsjIIUEWv5M
 zTIzDJFGPBiKKxP4CR4LPoSrS13MYnM3YifCEV0OXy/Q+bBiryNYLHYcY/IyyG5X65ZD
 q6RQ==
X-Gm-Message-State: AOJu0YyTi7tdJBwxopWINodB0yFyhyIYHDEMZ6qxgc7r+dPHKidRakqy
 2MARIComH78myA4s4npcHbHrYg==
X-Google-Smtp-Source: AGHT+IG+sf42x5UqgX6/tUnADMw8ywfyluNYFJxrjCn5F89fxCcebmJvXrjI2e0zvbIZZXO7gGVTKg==
X-Received: by 2002:a05:6512:b1a:b0:500:9a29:bcb8 with SMTP id
 w26-20020a0565120b1a00b005009a29bcb8mr785860lfu.4.1696382590028; 
 Tue, 03 Oct 2023 18:23:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:23:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 04:23:05 +0300
Message-Id: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 0/3] clk: qcom: provide alternative
 'parked' RCG
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
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement an alternative for the clk_rcg2_shared_ops, which also
implements a proper is_enabled callback. Note, to use
clk_rcg2_parked_ops one must remove XO (safe source) from the
parent_data, parent_map and freq_table.

Changes since v1:
- Replaced a call to clk_rcg2_is_enabled() with check of the CFG_ROOT_EN
  field (Stephen Boyd).
- Added the init function, reading the default clock configuration and
  then defaulting to the lowest supported freq / parent if the clock was
  not configured at all (Stephen Boyd).
- Dropped P_BI_TCXO from freq_tables too.

Dmitry Baryshkov (3):
  clk: qcom: add helper to map parent source to cfg value
  clk: qcom: implement RCG2 'parked' clock support
  clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 56 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c        | 12 +++++++
 drivers/clk/qcom/common.h        |  2 ++
 drivers/clk/qcom/dispcc-sm8250.c | 13 ++------
 5 files changed, 74 insertions(+), 10 deletions(-)

-- 
2.39.2

