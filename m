Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD91381162
	for <lists+freedreno@lfdr.de>; Fri, 14 May 2021 22:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0670F6F452;
	Fri, 14 May 2021 20:06:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567C86F450;
 Fri, 14 May 2021 20:06:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l14so375826wrx.5;
 Fri, 14 May 2021 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Beqb/QMDDkalUMDor+4Tgdl7fgBEI/mGqX0vOGB5t7E=;
 b=BgIXynPZPV4pNpoGoVRCf41GjGiXF4yihmiAh91GG6sHICuCsSYUd48SLcg09+kuAX
 2xmU2hsthAFcc24v57LGKBIoqQDuX/fIEF/SVWJBSczh6vabxzu2walstzWPo/3zPwAs
 sHPMuiHrT1URZjOLXIIdwiFh/sxrILnLY67ojBmoG7c6YUBYSJil1h8FBOHaj5frYHfG
 kHymDKlzas9QzznbgIw+0/fvJkdVOZ80yQK5PTEsBre9uE/6hFGl+sE8kAcguy5ffCL+
 P8u+S73rOFUTKMU9TUsSsEW6ssYHHNhkTR91tFBy1vD/loGgpFzS+ykafroLHvDMqbO7
 4ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Beqb/QMDDkalUMDor+4Tgdl7fgBEI/mGqX0vOGB5t7E=;
 b=rtc5F/PdWvj0Z7v+/blfSFtHxqm2ONsGj6Msq/ZDDUN3SE5T8pv5BZjhFXzd3v3/4r
 vwD9ZL2xbyrNqYTSJOZyswyCfpgL5ytmf9Zzdw0LK3zRjisAu5fwAijtC8svECDvyKGU
 hQqXrM9qyRS9rQ2vjIrVFqcKcZPGSfF90CwbzSamNWTKhf5BvPCVzRHWiMurEpImYJ2b
 2fKc7xkJrKZQL2MIdyogQlvuZ4hyb30ADd/6jFhp7QDcvsizelFn8QluynnVNDokTbbL
 0tRphVb905zQk+mIDeu76N0/6ojY6tM7sZdwhGUOptLnrlDGHetmDhe5r7YkWdfnX5z/
 OAmw==
X-Gm-Message-State: AOAM530iwpRseLp6FnQVIQyPF5mzHjMUPbp+CxX0duFoqTYgdXJR1eCw
 K7zE9dUrVqBnxUpaBVzcclp0qSWY67f8IJLN4JA=
X-Google-Smtp-Source: ABdhPJz7gXwZ7Lv8m9o7hl23wOYCrZkgOl8V3j/QCn7bsqydj23k6l5aKvHiko5A2AxVS/rj/79+LgcipabcGWLQBm8=
X-Received: by 2002:adf:e510:: with SMTP id j16mr61886319wrm.28.1621022779035; 
 Fri, 14 May 2021 13:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtmr-X=Cs8V0bJZMAuONcvn8-rfJGuMNXCO9Q39JYEaFQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 May 2021 13:10:00 -0700
Message-ID: <CAF6AEGuCRpkNN7GCcGf5LC=NpyLb8gFnqhy5QE3bYioFTRoh+g@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Freedreno] [pull] drm/msm: drm-msm-fixes-2021-05-09 for
 v5.13-rc2
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, May 9, 2021 at 4:21 PM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> First round of fixes for v5.13
>
> The following changes since commit a29c8c0241654d5f3165d52e9307e4feff955621:
>
>   drm/msm/disp/dpu1: fix display underruns during modeset. (2021-04-09
> 12:02:35 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git

this should have been:

   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-05-09

BR,
-R

>
> for you to fetch changes up to f2f46b878777e0d3f885c7ddad48f477b4dea247:
>
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       drm/msm/dsi: dsi_phy_28nm_8960: fix uninitialized variable access
>       drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
>
> Jonathan Marek (2):
>       drm/msm: fix LLC not being enabled for mmu500 targets
>       drm/msm: fix minor version to indicate MSM_PARAM_SUSPENDS support
>
> Kuogee Hsieh (2):
>       drm/msm/dp: check sink_count before update is_connected status
>       drm/msm/dp: initialize audio_comp when audio starts
>
> Rob Clark (1):
>       drm/msm: Do not unpin/evict exported dma-buf's
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c           |  9 +++++----
>  drivers/gpu/drm/msm/dp/dp_audio.c               |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c             | 26 ++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_display.h             |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 ++++
>  drivers/gpu/drm/msm/msm_drv.c                   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                   | 16 ++++++++++++++-
>  drivers/gpu/drm/msm/msm_gem.h                   |  4 ++--
>  9 files changed, 47 insertions(+), 18 deletions(-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
