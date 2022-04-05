Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD64F480E
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3C10EAE9;
	Tue,  5 Apr 2022 23:45:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FD610EA3B
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:53 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a30so1013009ljq.13
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHNN2mSJ3x+q9jH5PWO6X0bvixa+kSt0fmYoqYECsKk=;
 b=T6Jcn97rtZF8kxQuxjc+V1ulcQ1/sxTl7CIWujNP8Iyu0sDdXUOkRfiQufT6QFhZaG
 bWIDgTZG3PTHx8bRNkYAUjGLbln8Wc8JCaEOx0Gm2TGHOTtuN3ThRoUF6qdNg737stNT
 Ou1MwgLjmxb1SwaJqWRkSELPODae5SxJwvJUqGWz7z/KboCp9oodSIrvrirnJM1qgG1n
 G6bELGU1sqYCMJ9uve+/XjO0j8wLMzRFq3pTFa6RxfsI5bYE6CpBtjqafjxKO6f9cA0r
 7U+3nX4/9XZNDSY9J0bsKr7hqco0w6pWO9tNZp/HuZRMovDWffPkLvQ0xCBIY9eX9Blx
 QoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHNN2mSJ3x+q9jH5PWO6X0bvixa+kSt0fmYoqYECsKk=;
 b=xguXP4axkS+VZ8rXAfBSmO5nr2YlMJWqy9QxMuRUwY+wzgJB7E5EI3xUBGymHmyWuU
 AyJPUCWO2V089cynKuUs7GlswbGHp7+UhmrWiCE6kzCMcDSdqv6IZL0ZNwbuGhdIhWy0
 qwdYW+JptS+UUEF/7TEltu6J51aOF1FeQu3FjHmw6vMMMPxUheihkUmSPVqaYLTXIPYv
 dQnqUkeBrJSsGfGsnz+qBAZkNLFYoZCGArRN2qqslvgiWf/xyrYF17f2h8Cy1Ug7at5o
 3oZn7/rFc1Avep2I3n8VREsex+bBwGK52u7/bFz4HbeHka2OZnHbFuF7Oq+r3NTjRg6h
 BeYA==
X-Gm-Message-State: AOAM531uRHZ/c8sYqti1fw/HtoUrruV2HZXFX+wyFl568W0ENPNdbljC
 D4w2VYU5r4jn7WVPPxCULdQEHw==
X-Google-Smtp-Source: ABdhPJzkToHLpplQMOLHZSVka6ZBmiCriVZwm+PE6IeOGsKoEGIEhX1BAlK9J5qMuBzNWr0j1FJRCg==
X-Received: by 2002:a05:651c:50e:b0:249:89ef:101b with SMTP id
 o14-20020a05651c050e00b0024989ef101bmr3490721ljp.109.1649202352309; 
 Tue, 05 Apr 2022 16:45:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:45:47 +0300
Message-Id: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] drm/msm: properly add and remove internal
 bridges
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While running the kernel with the mutex debugging enabled, I noticed the
warning reported in the first commit (that the bridge's hpd_mutex is
unitialized). Additional research revealed that we do not add and remove
internal drm_bridges in the msm drm driver. Fix this now.

Dmitry Baryshkov (4):
  drm/msm/hdmi: properly add and remove created bridges
  drm/msm/dsi: properly add and remove created bridges
  drm/msm/dp: properly add and remove created bridges
  drm/msm: unregister all internal bridges

 drivers/gpu/drm/msm/dp/dp_drm.c        | 5 +++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c          | 3 +++
 4 files changed, 14 insertions(+)

-- 
2.35.1

