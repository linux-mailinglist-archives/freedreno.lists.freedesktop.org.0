Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A55A249E
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652710E7F4;
	Fri, 26 Aug 2022 09:39:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DED10E7E3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:31 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u24so1082657lji.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
 b=PqHJaHohZYwsm/CV439/jAsas87s0RNPbSrywTlt2XGjyomH/MTwJqOrsWzSFFQMTQ
 vaZmlQdxuPI7z3gmHCq3pbqaXk6Z2esxQhDPy7ETKu0O/Yo3My7k8JfAflQ//2hHenTy
 XMtzeSsgDdsn4VXR22zoazGO7Zy0hT52NHsfzgG8JV0MR3LQSdbJBqpZ8wj+uzxx542r
 ppMVtgIVH0sCPyzk4PHyrtgBBrX29Ap8PyM6QWxRclJYeBVU8t4sIm7sRDHi4e2X1JCb
 cM7ZY8VirzSqE6h9GyPWmR8mvCOVsyRu3Qr1Gae+I95bVyGN5kidODIYsmXxU0Fi0y3u
 bmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
 b=qAY72SzR7HWyof+hLUo4FKOLm4HAHL9zGPmNr4io4lw7J1oahUdRGo8hqNoeHnf64t
 8Lm4EeD7NYdwF8TMMKQVlHM+t6jixfCTjileeqoKRrAyqNRnp1Fnm+Wj4lWK1NbejLrx
 lJ253nwkYqDbVjMfb+9xdO5MnjAoYkBNf/fD0IG6/ooXHn9gXPDni5nnrJXThjrrHR69
 ra5fNJ5z+jKuN5jEh3ht2RRGaUYrXQvcIjzcERH1/SH5Nd+oOgXhx6PJ1qIqolU3dDRu
 jotghBOUe5v2aPP+5Mil8tKLySC7aXZB957NoBhH+FZ2FCodj93AmYS1F2hnYP6QK4L3
 ilkA==
X-Gm-Message-State: ACgBeo0OkJjzFxajKuihCCXwLd5cAKBatuP83loQm358g1Zxkargu6+z
 lG/hX4SqdaXwuodDVLs+6K9aKw==
X-Google-Smtp-Source: AA6agR6PiH5e9EgjVJ3S1NHkzUw9Zid8iMhCu5LWfb+2bIn5w5XIKzzL7wkJNzmFuI8/wm+2YKr8gw==
X-Received: by 2002:a2e:8443:0:b0:25e:21ef:952d with SMTP id
 u3-20020a2e8443000000b0025e21ef952dmr2213447ljh.403.1661506769254; 
 Fri, 26 Aug 2022 02:39:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 26 Aug 2022 12:39:22 +0300
Message-Id: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/5] drm/msm/hdmi: move resource allocation
 to probe function
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Changes since v1:
 - Moved a call to msm_hdmi_get_phy() to msm_hdmi_dev_probe() too.

Dmitry Baryshkov (5):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function
  drm/msm/hdmi: don't take extra reference on PHY device
  drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()

 drivers/gpu/drm/msm/hdmi/hdmi.c | 348 +++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 161 insertions(+), 190 deletions(-)

-- 
2.35.1

