Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D341457292
	for <lists+freedreno@lfdr.de>; Fri, 19 Nov 2021 17:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189DC6EDC6;
	Fri, 19 Nov 2021 16:14:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14E36EDC6;
 Fri, 19 Nov 2021 16:14:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so10929927wme.0; 
 Fri, 19 Nov 2021 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UcqY3TV76OxNe1xu4n8DKFERXvuTUA0Ucfm9ueomvFM=;
 b=MHhVidxEBzBTALz/eMu3IOohwSk9E6Mdp3oIwEzXnNbjVXnitIiPqqQlBCS2/ZRFsp
 Liwgi2UtlyjggwA7g/Ev4awfC/AYqmE3DcWz+ka3uhEUn62vEr6J0lAdR952KtJz38CY
 OO0EsbPviPQVV0tFtht59BHVHC22ZHBtN8M1/BZYi00SRlB9+49NTjvoR3ogCAJy/NQx
 jzOlUXOon2WqsSTKLRCF7AT93tUIMR7XbUdZGLfqB5alQg7g1sL0qGkBMD2MGaeeME8b
 oPzljj2V1ZJKN02jj2IQwi+/H5PjyaNsxoLaZiMXnVQQtaKAKdD20e+yUd7+3EUw9/Qx
 iKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UcqY3TV76OxNe1xu4n8DKFERXvuTUA0Ucfm9ueomvFM=;
 b=Yrjn9ht+bev7nyb0PLxgcB0c5AxTF5G1lp9r7GGOwng3TV6ot0fDhtOe7e4H521Rdw
 YGal7OypG1Sd94DqMg9lsQYE+QZwm87hhMT95XGLWPIIO7PA5x2ExmWz+9izBKrN9y3q
 B3oCyXRFNjFUXhErYgVwveIvmUHlhCLkzsxDjZ/kJHCcvuRCQKzCgG1VyN6GzR3Ds7ZC
 J3vulT+UPV0g0vg9YdHI2sxxS4QP4qHUGnnNuEiRdFHI8NCulD8TauIttkbM9Ylt6Bpr
 Y4Jby/KBECdNzQwVRboNRN/y3+z+pKlBjN4ucDcwMusICGBJGg7GbzLlJ52zLD/4g/de
 /Pkw==
X-Gm-Message-State: AOAM532dvEZqMQECh4vpKoIIRTTyM6sIoxwmRMQx9U+dDezRzSUf0++p
 yY4MZilEPuWFpVbwWcecEac5s1ARELi8wqMZ7ak=
X-Google-Smtp-Source: ABdhPJztRHw/IXsl/jzRJwmq6CaBP2pBkI2TX2vFR+YvDgcR5py+7U8KVWDGTo1h0iavOJPh4SuhT7zbJbHPCOJGVcQ=
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr1036483wms.44.1637338492141; 
 Fri, 19 Nov 2021 08:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20211116003042.439107-1-robdclark@gmail.com>
 <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Nov 2021 08:19:56 -0800
Message-ID: <CAF6AEGsKq7g8ngyVngZpLBeZ+-XavguaCUnNNbptdv0pA3v=XQ@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH igt v3 0/4] msm: Add tests for gpu fault
 handling
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 3:56 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Mon, Nov 15, 2021 at 04:30:38PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The first patch adds a easy way to write debugfs files (needed to
> > disable hw fault detection, so we can test the sw timeout fallback).
> > The second adds some helpers for cmdstream building.  And the third
> > adds the new tests.
> >
> > v2: Fix headerdoc comments in first patch
> > v3: Add helper to detect debugfs files and updated last patch
> >     to skip the one sub-test that depends on new debugfs when
> >     running on older kernels
> >
> > Rob Clark (4):
> >   lib/igt_debugfs: Add helper for writing debugfs files
> >   lib/igt_debugfs: Add helper for detecting debugfs files
> >   msm: Add helper for cmdstream building and submission
> >   msm: Add recovery tests
>
> For patches 3+4, in case you're waiting for this:
> Acked-by: Petri Latvala <petri.latvala@intel.com>
>
> For the record, msm-specific test case changes don't need to wait for
> review (see single contributor exception in CONTRIBUTING.md).
>

Thanks, I was actually just waiting until I had time to start putting
together msm-next for v5.17, and pull in the patch that added the
debugfs which the recovery tests use (which should hopefully be in
next few days)

BR,
-R
