Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755A221139
	for <lists+freedreno@lfdr.de>; Wed, 15 Jul 2020 17:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C36EBB3;
	Wed, 15 Jul 2020 15:36:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32326EBB0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jul 2020 15:36:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so1944648edy.1
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jul 2020 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
 b=WcIywgf/5yGovAVSIjXD9OIB0Yx1Lqe39sKQcKnE0bhl7NpHMP3wyUyXsz76eznoDN
 kLjzcwlopVjThClxHuAyihsZX8FPaEHuAR07Xs+vzRHSsrUbJI0eICfPyJGZKPi/QsKZ
 mmZYeZuAvUsvxgkbItIok1s8pKt4mmzBtXk9cwHdKDPanj9nt1L5t+ZuHliLF00lGmDj
 sgGGTAONqoqLI9wypqeA5drEqMm5oVMEDqzFIsWfOobV+z2oJKOnAPiPglVQaa4qup8s
 aimYRQqb3HkkSb9UJ3FCrUOw7rkvO35YQrAjHrLTkQRICmx+aHtbSrz7ehlxcrNUKK9x
 axwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
 b=rvgHanZ72f2EkBlFLwx6VJscJNAYXc8DHJQeAKaJq3c5pn/AYdbiCD3tCG8G2ekNGd
 2UUP04a8itFAP9Nk3hkVhoha0bfA9Etgr80eAilIbOhvpXMZNx2lNAJTz5hyt2YsTOoo
 yxFoS9hBE6Tx2rAjuzestgw+g1xRhA1RQ/PjmhZk8w/JWXvcCAHsTWKLIgDW8t8g8VX8
 dpOS4WXgoY0dTTrC2AOsEtyQHxLMhQzh8vuDMm3/EsLPRTfCiHWd+8c7j4TDFWJhBohB
 g9KxNHMdATpRlrhwMN27PgAwfHEO1GanvYfm4NmXQZGjupD6yzngq5YxpffULmw75i8M
 6AzQ==
X-Gm-Message-State: AOAM530y5UE92W9TuuDuY259Ad2H872KyTNx/j5H9IscoB7dQ9bCTq2P
 amisdop4OYbE/FT44otgR+z69GbRc8gOW0aom3s=
X-Google-Smtp-Source: ABdhPJwUDgryr+uwNIkAcro/MFjmRNEHds+xBye6alkuUKRwQY/Ip2yfUIBYAYZ0SbfRqlleTEVLIvRkwjo+QnLxV+0=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr209684edi.120.1594827370435; 
 Wed, 15 Jul 2020 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Jul 2020 08:36:43 -0700
Message-ID: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5 0/6] Add support for GPU DDR BW scaling
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:41 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> This series adds support for GPU DDR bandwidth scaling and is based on the
> bindings from Georgi [1]. This is mostly a rebase of Sharat's patches [2] on the
> tip of msm-next branch.
>
> Changes from v4:
> - Squashed a patch to another one to fix Jonathan's comment
> - Add back the pm_runtime_get_if_in_use() check
>
> Changes from v3:
> - Rebased on top of Jonathan's patch which adds support for changing gpu freq
> through hfi on newer targets
> - As suggested by Rob, left the icc_path intact for pre-a6xx GPUs
>
> [1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
> [2] https://patchwork.freedesktop.org/series/75291/
>
> Sharat Masetty (6):
>   dt-bindings: drm/msm/gpu: Document gpu opp table
>   drm: msm: a6xx: send opp instead of a frequency
>   drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
>   arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
>   arm64: dts: qcom: sc7180: Add interconnects property for GPU
>   arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

I can take the first two into msm-next, the 3rd will need to wait
until dev_pm_opp_set_bw() lands

Bjorn, I assume you take the last three?

BR,
-R

>
>  .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 108 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
>  7 files changed, 112 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
