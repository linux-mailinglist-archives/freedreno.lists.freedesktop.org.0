Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA16F9D40
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 03:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043D10E08F;
	Mon,  8 May 2023 01:13:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Mon, 08 May 2023 01:12:57 UTC
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9932310E08F
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 01:12:57 +0000 (UTC)
Received: (qmail 8302 invoked by uid 990); 8 May 2023 01:06:14 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Mon, 08 May 2023 01:06:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
TLS-Required: No
To: regressions@lists.linux.dev, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, 
 "Rob Clark" <robdclark@gmail.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "Stephen Boyd" <swboyd@chromium.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, "Johan Hovold" <johan+linaro@kernel.org>,
 "Sankeerth Billakanti" <quic_sbillaka@quicinc.com>
X-Rspamd-Bar: -
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-2.999968) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: -1.599968
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 08 May 2023 03:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=Ew+ga4R4XmyLDd+z40yzIO7CFGKrkhYk+0CcdiQL9Sw=;
 b=od7KhyxiI988/H0wo80l6KXEewxhiWVhz0SfXY/weB6DUvv7GRv3Rb/20C0sRcopopbYInGJAy
 u0LpHpGjdT10DN1ywJ9gw54CY4sTZ1EK+qfwoWlK6Lse+2EHQ/egTwgmIjUs+3z5u3Wwgf2Iy6Ov
 8+JjmHzraSUXx1gN376lVMSrsd5uBADfq6ae0aeSTI+rNg4zf6AV1xa3l5aiQndVbCH6lE0WEeEm
 zYVDBem9t6Hx3ZS8gyRPqIkcfQbP90eDXu/W0EeiG19jKZPa/Y3Co/7K7W63phd7QdspH60A9w7K
 VwwVw/VfIp+qZk7/k1/P+Ml6xftCKNVMRj0wvXjVH2HF+ZiYSdtQCAuN2GHBFd/loesiMFjEzv+I
 0HosD/qeYweyP2l7P8Zo5M9BCVOS5D+sQ7hANY/c0S9Gs+r1qOHyYh7Ao3RIPYs40pW2Dkyg2jEQ
 aHQ0tdpJavp7CCkSAp/9YrYiLAwe3X5B7EZtR/Ps98/1/vbTd/qmkEGg92iF9QRm/5ksjayNrbY7
 /bELzo3Iku+i5IQJi3ViM9T2NYaNUCbY2b3VCzRVNM6rEuAIGMOjqs3/oNj+fY9fwnQ54frY+pk0
 l6ggn2GIbzVozsNkDoO3VfNBRY9HlabFLpLiNVWt7loWZDv2y3sxN83aeCKOHQIdTZq+mLtgvcaJ
 E=
Subject: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Nikita Travkin <nikita@trvn.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This reverts commit e17af1c9d861dc177e5b56009bd4f71ace688d97.

Removing the delay of 100 units broke hot plug detection for USB-C displa=
ys on
qcom sc7180 lazor devices. Lazor uses mdss for hot plug detection and dec=
lares
dp_hot_plug_det in the dts. Other sc7180 based devices like aspire1 were =
not
affected by the regression, as they do not rely on mdss and dp_hot_plug_d=
et for
hot plug detection.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
Tested-by: Leonard Lausen <leonard@lausen.nl> # Trogdor (sc7180)
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
index bde1a7ce442f..db9783ffd5cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1506,7 +1506,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_displ=
ay)
        dp =3D container_of(dp_display, struct dp_display_private, dp_dis=
play);
=20
=20       if (!dp_display->is_edp)
-               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
+               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
=20
=20bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
--=20
2.30.2
