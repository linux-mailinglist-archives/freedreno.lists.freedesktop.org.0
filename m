Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356CB4A62D9
	for <lists+freedreno@lfdr.de>; Tue,  1 Feb 2022 18:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC52210E47F;
	Tue,  1 Feb 2022 17:47:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287A410E1D3
 for <freedreno@lists.freedesktop.org>; Tue,  1 Feb 2022 17:47:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m14so33288233wrg.12
 for <freedreno@lists.freedesktop.org>; Tue, 01 Feb 2022 09:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US/OKgVIq7RQTvUVVDRe6xDQAKQFvgSJ0bC4ZgbJ/HE=;
 b=MYlzl6pGX5ozr5W0N8tzLgaoBaN7ZxAxMZrYHi1p9AMu45EI6sVmQjAh5LOzqZMZGn
 A26oIIkNc9Hb3em44A15yWRmAxlv2YJy/wSzcMI+TRimEmqiTu7jV4xSM5H9Xdruqn8W
 I41sDYM0ZJhdV+fycMWw99ORNq4UzOQwWJLFUhDisj7MSPt7hJooGByquusV3D78x5Lv
 nf3S3iJ50zUvejLNPg5C7KJ7o3a02xx6vbYwHZT4Ab8GxX0OzLyOZP+SswKKtbk+2zJT
 fwsVZD0lBkcVxYKQede0BS5A/ZoP3vVBaQB6HQsgBWpIAZdYk6JtrMWBXqVHjnXYYQOh
 L3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US/OKgVIq7RQTvUVVDRe6xDQAKQFvgSJ0bC4ZgbJ/HE=;
 b=E+WnkPGjXLef8kTRCmuIP/hNW86/2U85vxwmvJbUsQK0Zp6wJvRxfkJBMxa5DDik0u
 qwkI/bb0LTRAJrkgWmqB4Wa4EuHakHer56RVvrfrPLlLxauvXQOkCr0HlzGPe3eE+Wej
 +7SBjA98VSmb9NQc3cZyHn6ch17eDe0Qs37Y2lBAEWxPYjj7BExWig0nFbkJuxK0ALlS
 THDObT6sxVxQgtT334BRkYe/Khb5NgxVgp7Dt348LUqIa1B4rwk8QXblEmQLwZEo5GkF
 dHMtn/UPx2Q9UP9MU4+QDAfoqnH7ZmJM1ZsMZOP+b+UxAf2Gc4X2MWehDF97brbQaZx5
 uznQ==
X-Gm-Message-State: AOAM531XUOpJj19m9d9nupcenM8SkH1x2tdXeAsiya0XlFlnZu7yMyL3
 yHA5JnqqIjN/7JAhiv8EYiw+IQ==
X-Google-Smtp-Source: ABdhPJyv91uAdSZ2+/CfoH19SZ7LhCK1uLFNm/z3HHrAL22Qmg4Ltwk+rufuf/oFeWKR6aywDtXvFA==
X-Received: by 2002:adf:e386:: with SMTP id e6mr2424961wrm.542.1643737666682; 
 Tue, 01 Feb 2022 09:47:46 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r2sm3392332wmq.24.2022.02.01.09.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:47:46 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  1 Feb 2022 17:47:31 +0000
Message-Id: <20220201174734.196718-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/msm: Remove spurious IRQF_ONESHOT
 flags from dsi & hdmi
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series corrects incorrect calls to
request_irq(..., IRQF_ONESHOT, ...). These anomalies are harmless on
regular kernels but cause odd behaviour on threadirq kernels and
break entirely on PREEMPT_RT kernels

I'm pretty certain these problems would also provoke lockdep splats on
kernels with CONFIG_PROVE_RAW_LOCK_NESTING enabled (because that is
intended to find code that breaks entirely on PREEMPT_RT kernels ;-) ).

Finally, and just in case anybody asks, yes! I did use coccinelle to do
a quick scan for similar issues. I didn't find any other instances in
drivers/drm/ .

Changes in v2:
 - Split into separate patches (Dmitry B)

Daniel Thompson (2):
  drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
  drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag

 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 26291c54e111ff6ba87a164d85d4a4e134b7315c
--
2.34.1

