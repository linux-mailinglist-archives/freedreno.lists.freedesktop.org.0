Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDA664723
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 18:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969BF10E62D;
	Tue, 10 Jan 2023 17:17:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11FB10E62D;
 Tue, 10 Jan 2023 17:16:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CE80B818E0;
 Tue, 10 Jan 2023 17:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996A5C433D2;
 Tue, 10 Jan 2023 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673371016;
 bh=iwpyzqVQok4g2qkFvOCpfycpEy0u8yaiB88caR2d+yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFlSHcAy0NVD0oYNOUp4HIjmISXck5EjgZpyTmX54tPypcLovVkFVVpnudqYpDO9K
 UplsOHprYvZuBJWXROow17T1QSPJ9QZQ54qHZ7K+4lIImwm21BkKOyDX/y6aNRNvIE
 YOpOjPeo1MC8X78tpaaZcAaMnqfo/1PzI3LMkc9s/RTBpOn7HtDmwPMLtFlftePR1Z
 dAvWgG/yUp0DYlqlctwKty89d/SAmKWqT6wyI1dHKOOf4q5AptgEh75dVt0mY/JWx+
 HcyXcmbv91fqoUnJSNq1nvDjzZ57STNdv1N6O+WPWU7RKaEQSN9AqknmRWvvddHlxI
 yLxzhbWz+WeNg==
Date: Tue, 10 Jan 2023 11:16:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>
Message-ID: <20230110171652.ur5zgdwvjj3kaimj@builder.lan>
References: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
Subject: Re: [Freedreno] [PATCH v5 0/5] Improve GPU reset sequence for
 Adreno GPU
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Chia-I Wu <olvaffe@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <len.brown@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 02, 2023 at 04:18:26PM +0530, Akhil P Oommen wrote:
> 
> This is a rework of [1] using genpd instead of 'reset' framework.
> 
> As per the recommended reset sequence of Adreno gpu, we should ensure that
> gpucc-cx-gdsc has collapsed at hardware to reset gpu's internal hardware states.
> Because this gdsc is implemented as 'votable', gdsc driver doesn't poll and
> wait until its hw status says OFF.
> 
> So use the newly introduced genpd api (dev_pm_genpd_synced_poweroff()) to
> provide a hint to the gdsc driver to poll for the hw status and use genpd
> notifier to wait from adreno gpu driver until gdsc is turned OFF.
> 
> This series is rebased on top of linux-next (20221215) since the changes span
> multiple drivers.
> 
> [1] https://patchwork.freedesktop.org/series/107507/
> 

@Rob, please find the PM and gdsc implementation changes picked up here:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com

Regards,
Bjorn

> Changes in v5:
> - Capture all Reviewed-by tags
> 
> Changes in v4:
> - Update genpd function documentation (Ulf)
> 
> Changes in v3:
> - Rename the var 'force_sync' to 'wait (Stephen)
> 
> Changes in v2:
> - Minor formatting fix
> - Select PM_GENERIC_DOMAINS from Kconfig
> 
> Akhil P Oommen (4):
>   clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
>   drm/msm/a6xx: Vote for cx gdsc from gpu driver
>   drm/msm/a6xx: Remove cx gdsc polling using 'reset'
>   drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
> 
> Ulf Hansson (1):
>   PM: domains: Allow a genpd consumer to require a synced power off
> 
>  drivers/base/power/domain.c           | 26 ++++++++++++++++++++
>  drivers/clk/qcom/gdsc.c               | 11 +++++----
>  drivers/gpu/drm/msm/Kconfig           |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 46 ++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  7 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++---
>  drivers/gpu/drm/msm/msm_gpu.c         |  4 ---
>  drivers/gpu/drm/msm/msm_gpu.h         |  4 ---
>  include/linux/pm_domain.h             |  5 ++++
>  9 files changed, 97 insertions(+), 20 deletions(-)
> 
> -- 
> 2.7.4
> 
