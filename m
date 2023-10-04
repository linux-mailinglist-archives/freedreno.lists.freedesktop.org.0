Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD17B75DD
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 02:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAD410E326;
	Wed,  4 Oct 2023 00:31:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3369B10E326
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 00:31:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-533df112914so2579067a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696379487; x=1696984287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
 b=eaFEpa1ZejJNZw96wOICpIKwssujAlO7uVy8lpw4xmpf99dAjCJeezZQPqzT5AaRTQ
 XWFFwZU621IfgEcerME7cWFOEgLHxpDijvKL6y3bctNhsWp5/6Y3Nmp2W87723UN9z60
 Pp8TBPu5sbrkz047K3PNNF+mkNce4ZIGYWa/nAQ/+nK+VEqEMl5waAe+mr9FWUP/Zq/2
 Cr2R7GdFR4SRF1YmJocAsdnc253LY9MHzYO8HOj1TpTYI7zYZLPchr1wAvwzbXh3R4lx
 Fe08mHnTCzdZxZW9mJ6luf4v2PrhNA6wekE5AoVduYKbg+0ZI0Ik8jHv3iFQ9KZNYtmf
 LFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696379487; x=1696984287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
 b=Wem+0YXebUXfnGv0FszLCYpjoR8Dv5sdVErpPz1JK1vP8K6XL0wjvKHuYsyR3HATsh
 /cHiN19PSZYh6VluGuof8fOrS4yoZHvXytQWCUQXD8CQxJURpuVMKVm6glT1jJQQGZWd
 qJcGoMjaMl7Esp7YPZlQk1CrEIBO498540ka8YqkLWSa7kVeZvxFthNoXG4aysuH/jbw
 00yw7qTkCUFpw687y/Scoi0bsvoMRNvctf0S8OwAUHv8AMNbnD1WnsWAl9yU53yRm+o3
 Glchbbrxq/Iqdd59R++aGzpUl9CoPkIAUbhMyclflfFfFbPvI6Qa3ceQvnzF1xnhbFwM
 ZCXA==
X-Gm-Message-State: AOJu0YybjIqZdZfN1mR36hiF/lBu6Ec8WB3MjIn59O25sr/J/eFBTmkA
 5kMqTj8j6ufR/DyjNkDNM+fLMA==
X-Google-Smtp-Source: AGHT+IGgOw+KKnQkv0lbmacveyuE26amjk0smzsNyHfmaKinFgyepdVzf6ui+/+RR+BxAV/eMTj1eQ==
X-Received: by 2002:aa7:d703:0:b0:530:bbeb:571 with SMTP id
 t3-20020aa7d703000000b00530bbeb0571mr646676edq.36.1696379487071; 
 Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 17:31:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 03:31:23 +0300
Message-Id: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/2] clk: qcom: provide alternative 'parked'
 RCG
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
parent_data and parent_map.

Dmitry Baryshkov (2):
  clk: qcom: implement RCG2 'parked' clock support
  clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 34 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c | 10 +++-------
 3 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.39.2

