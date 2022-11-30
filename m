Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3D63D1AC
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 10:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB610E438;
	Wed, 30 Nov 2022 09:22:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD10310E439
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:38 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3704852322fso164874107b3.8
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 01:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=esqAkKsNPNa+vWU1VEu3p5pJm5olzNFS6cZhKN5g6K8=;
 b=OH1nH0cfbXVH7lX96inipfihQDqcAzOBuPL6pnQ6uFYs+2t8n0RmwCJCpEqhJG6hMy
 gEd3CZlJJCZIDT4OrLt0d+L61dZuYlVu07TGc6SOGDgVrzdUlItR9clJ4k/tBn+WvfFu
 SwRR9u1dwsdHThjGptZYZGzIL4PxFiBxXdqCeDJmIGW8kjvUHjWDfuFso7i9fh5/OisF
 obXKDXIO981BzKPuhy+U7vgvLsJDsZL89AOBwJgnrDdNDqGZaE8BgoqEed9Oe8D6CSIy
 ODu58bEWerMuu1XCJWXaEAXXs4DEKWCsa4cHNQOtgxscHMdKl3u+JdM/8LcLXkz+oUba
 SccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esqAkKsNPNa+vWU1VEu3p5pJm5olzNFS6cZhKN5g6K8=;
 b=rRjvvFf3yEHleKh0TfPpJoHdgtZBUtDffvAb1+DS7KatRWAIn5UDSfEmozpPvTJiDA
 y9+SuBxzaiezNDkD21FbOc/3TO3zIV2WeFCX572EBHgtbQTs6+iuexvDBlnXJlfLvaFd
 aHCdI/PUY7JFoWA7+ZfizCpZpPdlQYgxmJ53SL63G1ZVeb+o7VajVZJrJ5HIL+iWeZ5S
 q03ECOp2Rrrat3LlHJqrJrb2GlqY7KgQibKnWauLx13LsJQJZhDxTckjGl+2G5EW6+JG
 NniwQb8MsLoiXeAVrTJ709lb5p1u7omvOOkzhjxQO0zaOpe6iuI96IYFW8Q11MRElpNx
 9jJg==
X-Gm-Message-State: ANoB5pkfchsPfVmu7dWhpmGhg4tj9Obhs0QRUc1WHSf1luFXpC/C/5ek
 b2epo8dtuZ1nd4xZG4uAAmJ6xH1ifSh8mHvnSrNj4w==
X-Google-Smtp-Source: AA0mqf6eRY6wdCOqxX33Z4M4u21qczGijL4HTcdnMMJLEpRYeSokHrYtqrqbnwCO4ETK0bWEGQxk+x9Y9p+wGxJYsRc=
X-Received: by 2002:a81:598b:0:b0:3b7:78c8:a205 with SMTP id
 n133-20020a81598b000000b003b778c8a205mr26625010ywb.188.1669800157826; Wed, 30
 Nov 2022 01:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20221126102141.721353-1-dmitry.baryshkov@linaro.org>
 <CAPM=9tyjMCOY3-tJASxNg6dFizfaivqfSrhSG1otFTvfuSg=dQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyjMCOY3-tJASxNg6dFizfaivqfSrhSG1otFTvfuSg=dQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 11:22:27 +0200
Message-ID: <CAA8EJpoN7HAkdRnJHFCqTxF__L7QwyDK4hLuFKn63A3TgosOsQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [pull] drm/msm: drm-msm-display-for-6.2
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 09:02, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 26 Nov 2022 at 20:21, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Hi Dave,
> >
> > As agreed with Rob Clark, a pull request for the non-GPU part of the drm/msm driver. Summary below.
> >
> > The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:
> >
> >   Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media into drm-next (2022-10-27 14:44:15 +1000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/lumag/msm.git tags/drm-msm-display-for-6.2
> >
> > for you to fetch changes up to 8d1d17d47eaebe4466459846d07e4ba8953fa585:
> >
> >   Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag (2022-11-26 12:06:29 +0200)
> >
> > ----------------------------------------------------------------
> > drm/msm updates for 6.2
> >
> > Core:
> > - MSM_INFO_GET_FLAGS support
> > - Cleaned up MSM IOMMU wrapper code
> >
> > DPU:
> > - Added support for XR30 and P010 image formats
> > - Reworked MDSS/DPU schema, added SM8250 MDSS bindings
> > - Added Qualcomm SM6115 support
> >
> > DP:
> > - Dropped unsane sanity checks
> >
> > DSI:
> > - Fix calculation of DSC pps payload
> >
> > DSI PHY:
> > - DSI PHY support for QCM2290
> >
> > HDMI:
> > - Reworked dev init path
> >
> > ----------------------------------------------------------------
> > Adam Skladowski (2):
> >       dt-bindings: display/msm: add support for SM6115
> >       drm/msm/disp/dpu1: add support for display on SM6115
> >
> > Bryan O'Donoghue (1):
> >       dt-bindings: msm: dsi-controller-main: Drop redundant phy-names
> >
> > Dan Carpenter (1):
> >       drm/msm/hdmi: remove unnecessary NULL check
> >
> > Dmitry Baryshkov (25):
> >       Merge remote-tracking branch 'msm/msm-fixes' into HEAD
>
> This commit has no justification or signed off by line, I'll let it
> slide this once, but no backmerges without justification and please
> sign off merges.

Roger.


-- 
With best wishes
Dmitry
