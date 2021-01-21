Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A392FE889
	for <lists+freedreno@lfdr.de>; Thu, 21 Jan 2021 12:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506A6E1D2;
	Thu, 21 Jan 2021 11:18:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092E6E1D2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jan 2021 11:18:26 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id o20so1326296pfu.0
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jan 2021 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3SmdleK8UZBluZ+gLv61IXIdA7ChI0uJ8q02WGnkWs=;
 b=kKul5ID8v5TbX97ww+cpfmgrUv3kSKDwJ5+iClldpCxSEMEvh16BW9c99r9D6TxUF/
 UJy9U+fbp6GgTXqQAKH2vpfq+OBFaUhJAFtmu2GlHVA0WGpq/UGkkQR9iGMbQoj1Iitv
 n10xlrNXdq0kiQQIE5ELsxJO+0LGCp2wS9uujRkXF7ZC8F+po6ARY/vc2Wfe1Q2Hl5ea
 ea/DVLs27iqJz6zMgl0grfTLeQyN5TuTmnmrzme3iilGPe9v/xC35tR/mdM3Bl/HM1qU
 XZS/WWhF29VdoamNtm9NTJNGg++hLG8LJsFS9ZiaU3Au8PjSKQyPReA9zoIHqr/wIRDf
 hK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3SmdleK8UZBluZ+gLv61IXIdA7ChI0uJ8q02WGnkWs=;
 b=HPuJns0UEaWLscg9A0r0hYHcKE04EPuiXMXqkxWz60lZcgHjEyde0nWftA4r6LIPAd
 hVq2Y/i0ea/g30we/oFW+kDak6PAEBsowrzvIrqctgBTjQu3jL9bHp25JPWCBusqJNG/
 0FhYmxafe9D96hoTyNdVxxZ7LnvvOgD9EnJPovSrLlne4V0eNTiQne6kzWI72dwR6ChM
 e/9MUqH5TQpSypnyYszD1p70F6KSYM0qV1KIfb5fh+6ZP8VG94lHQb/M3ErGksaxW59+
 6OudOgcHvp2kv3MyxbrEsX3DJAqMmegkoXBt5BY+4WeiKhh/VUz3xssBeCjfx6ycz77B
 Je8w==
X-Gm-Message-State: AOAM533epwPds7oDU9oeog1arV/jq8X2YTzZgqKIu6/+m2TvjA0wd42+
 Fm3ns99Q7+foHUyj8nJgMTJBGknt8I3uiQ==
X-Google-Smtp-Source: ABdhPJzYjBGnMJtovsRHZ48WHArs33wC1W8Lrm5qvHpSIs5QnnIQMqLBBg9eMiM+WEzPlls9eOjVdQ==
X-Received: by 2002:aa7:84d5:0:b029:19d:da20:73fe with SMTP id
 x21-20020aa784d50000b029019dda2073femr13718975pfn.16.1611227895317; 
 Thu, 21 Jan 2021 03:18:15 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id 68sm5691390pfg.90.2021.01.21.03.18.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:18:14 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 21 Jan 2021 16:47:40 +0530
Message-Id: <cover.1611227342.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 00/13] opp: Implement dev_pm_opp_set_opp()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sibi Sankar <sibis@codeaurora.org>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello,

This patchset implements a new API dev_pm_opp_set_opp(), which
configures the devices represented by an opp table to a particular opp.
The opp core supports a wide variety of devices now, some of them can
change frequency and other properties (like CPUs), while others can just
change their pstates or regulators (like power domains) and then there
are others which can change their bandwidth as well (interconnects).
Instead of having separate implementations for all of them, where all
will eventually lack something or the other, lets try to implement a
common solution for everyone. This takes care of setting regulators, bw,
required opps, etc for all device types.

Dmitry, please go ahead and try this series. This is based of opp tree's
linux-next branch.

Sibi, since you added dev_pm_opp_set_bw() earlier, it would be good if
you can give this a try. In case this breaks anything for you.

I have already tested this on hikey board for CPU devices.

To get this tested better and as early as possible, I have pushed it
here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

This will be part of linux-next tomorrow.

Note, all the patches need to go through OPP tree here. Please provide
your Acks for platform specific bits.

--
Viresh

Viresh Kumar (13):
  opp: Rename _opp_set_rate_zero()
  opp: No need to check clk for errors
  opp: Keep track of currently programmed OPP
  opp: Split _set_opp() out of dev_pm_opp_set_rate()
  opp: Allow _set_opp() to work for non-freq devices
  opp: Allow _generic_set_opp_regulator() to work for non-freq devices
  opp: Allow _generic_set_opp_clk_only() to work for non-freq devices
  opp: Update parameters of  _set_opp_custom()
  opp: Implement dev_pm_opp_set_opp()
  cpufreq: qcom: Migrate to dev_pm_opp_set_opp()
  devfreq: tegra30: Migrate to dev_pm_opp_set_opp()
  drm: msm: Migrate to dev_pm_opp_set_opp()
  opp: Remove dev_pm_opp_set_bw()

 drivers/cpufreq/qcom-cpufreq-hw.c     |   2 +-
 drivers/devfreq/tegra30-devfreq.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |   8 +-
 drivers/opp/core.c                    | 314 ++++++++++++++------------
 drivers/opp/opp.h                     |   2 +
 include/linux/pm_opp.h                |   6 +-
 6 files changed, 184 insertions(+), 150 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
