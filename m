Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822724B6EA
	for <lists+freedreno@lfdr.de>; Thu, 20 Aug 2020 12:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8956E934;
	Thu, 20 Aug 2020 10:44:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF5F6E936
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 10:44:16 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id h12so934530pgm.7
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3PXtPhgN15xkqptqDoOT+6OR5bz1DwLunRYJNev9KR4=;
 b=zkaFZto0eMoTUXrhXnN5c215rPk2SI+mYKS6axiQrRCTTNkAxc+HQ1zvbE+9q8CdK3
 ejrwiC5XvbU1VEVR0PkGPGG669EkRUf07na+UAjM95hQEAsG4rAcauD7W4QS/mQQK9Ji
 aHAzBEJD8cb3YAopp2IN0BnKR0TfeOemTuipy2eA7MsVI9rqpSpfngZuJ3YGffGgvoOr
 2qaNwaJ3BQvjLM/eOrXzy4yluttDslK9WrVaLBIAQGyCyGmcBfTPfVT8FfIY5a1ueI/3
 qAMmm3cwSJncp0MSZc3c4f5Ucf1L5617fzuL31JE1OimTfSyQCLy69f4jWzzKMfRVtbY
 sboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3PXtPhgN15xkqptqDoOT+6OR5bz1DwLunRYJNev9KR4=;
 b=kAfbuz5WCWuH80ffX795RJE0GagV8pgm0JC99H/b3XSWlOmvN4dfsU1tANIzkrO3QA
 gF8mZJkgD36a/q0I/+v6sFMj/e1LZb0HfDeHiYfxF9HoNe6vg8P5ptuNQdZ/wR4WUS4s
 MhP0SGQ9sg/gPk3CXS30e9XrlPU60mWCFV4AH+MVsXhsB6Mj9cKHVt6rxasJ/6Ejo6U9
 E+uayHdwyPDHT5LrVUni5F6PRJmyJN8/Y0n09hAE7858bfkRemk2JntHG1wsKdxzBB+O
 48BobbyzbyOqabx7GKNJBcrqoDbTNSmVFfDg3CN++LmH4uGsLAY0cryV/h2QVSVH1WHC
 wp8Q==
X-Gm-Message-State: AOAM5331zEQ5lvtSROuKAoql8sUImaDUDr3wFAookaddO8pRr+Ik2P4d
 aNQBbHBvQa/QI8MfqvC1x1XjnQ==
X-Google-Smtp-Source: ABdhPJzGI4PMt2rxPglqL7BKdt2SWVVgHiE/GuL96GZfgXci06o5FRoVl3y2qYxeBmL8p5wYvmHOSw==
X-Received: by 2002:a65:4808:: with SMTP id h8mr2045357pgs.113.1597920255960; 
 Thu, 20 Aug 2020 03:44:15 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id e8sm2352323pfd.34.2020.08.20.03.44.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:44:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Qiang Yu <yuq825@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Clark <robdclark@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 20 Aug 2020 16:13:49 +0530
Message-Id: <cover.1597919647.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/8] opp: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello,

This cleans up some of the user code around calls to
dev_pm_opp_of_remove_table().

All the patches can be picked by respective maintainers directly except
for the last patch, which needs the previous two to get merged first.

These are based for 5.9-rc1.

Rajendra, Since most of these changes are related to qcom stuff, it
would be great if you can give them a try. I wasn't able to test them
due to lack of hardware.

Viresh Kumar (8):
  cpufreq: imx6q: Unconditionally call dev_pm_opp_of_remove_table()
  drm/lima: Unconditionally call dev_pm_opp_of_remove_table()
  drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
  mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
  spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
  spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
  tty: serial: qcom_geni_serial: Unconditionally call
    dev_pm_opp_of_remove_table()
  qcom-geni-se: remove has_opp_table

 drivers/cpufreq/imx6q-cpufreq.c         | 10 ++--------
 drivers/gpu/drm/lima/lima_devfreq.c     |  6 +-----
 drivers/gpu/drm/lima/lima_devfreq.h     |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 ++------
 drivers/mmc/host/sdhci-msm.c            | 11 +++--------
 drivers/spi/spi-geni-qcom.c             | 10 +++-------
 drivers/spi/spi-qcom-qspi.c             | 11 +++--------
 drivers/tty/serial/qcom_geni_serial.c   | 10 +++-------
 include/linux/qcom-geni-se.h            |  2 --
 11 files changed, 20 insertions(+), 60 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
