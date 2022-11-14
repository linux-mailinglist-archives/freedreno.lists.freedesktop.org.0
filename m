Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF5628AA4
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 21:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6C710E318;
	Mon, 14 Nov 2022 20:42:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8284E10E318;
 Mon, 14 Nov 2022 20:42:22 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n205so12724466oib.1;
 Mon, 14 Nov 2022 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FhLdcZAhUiSSVqXijIiTlHHql4argBY05Hn7xx4K6sw=;
 b=kyWAoQ2hD6W55qcbLsRwPlrTRIQ0nY0WLSqB3VytSiIKvEvQz403hjsSpHt9afF2Nu
 XRUN8MzjE5iYZCsk3fUADAN+/Br97opF5pz9FX1TpuY1eNok0nRKJQrc/Giw2KYi8ShH
 aVnse/+6eousi/GRG/YP9wfN7GWFdRFbBGqekMAi6C721oUrOfjmCWPTlpWKb+shL34h
 SL4xyU6aF9DE0YxpIvUMk45hMhHdLBwzh+YL9N+pjP7D/iu7G/fpmIVp4PF9eowCuqXM
 5jTK6nf0VJarjCjDD7iX5vxdI5sUKGH72A4XoRRcgGd4pEpf+p9Bf73YfPAlpm2/cKyI
 RhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FhLdcZAhUiSSVqXijIiTlHHql4argBY05Hn7xx4K6sw=;
 b=z4SMZBoEThWxtnP0C/IKh7SUQ+kTKNaSbz2gurd/i9mwqLc0aFPwInRAcqrZIMqJiX
 Wr0ByLfO8xYJqR9OHv2PDbmsgq4frJblsnkLT2SnxP0coixqWjbSi/sAsjgBSPuClTLt
 L9Dhm2f7pMYX8d6qAQXZIRULz7j0pO9nxJWaSCdm9jJbxTNnfdjdY3u4Fp4InhE7T8hu
 A/tj+p3Ai+RLlLR3b9V8nPECzYKgHO5MPCo8VRFrtjqWbNE9lpX6sMtFxGTrydzeqnFc
 miyUVH2LXssuHhuyvFR/bl27Cw1UWwuwtw/0o+sv7gOSlPui98u8O//pmDrbguodk6Hk
 vPbA==
X-Gm-Message-State: ANoB5pmW53NJEDsBRFEpqU0x/o6GyB5iEfMGhxE5vyhuhTA2VP6e7/M9
 KAL5hwKkhDsAVWnDnjEw0b/ARYog/FUltTT/wdc=
X-Google-Smtp-Source: AA0mqf71L3WKc2HDxj3fRALVFx6wOxJhsA0EVIkhcX1I0NDHUAJg5NqqTQf4KI1K7NDQjbxzzxa9EIfAXpYNFkTL9vQ=
X-Received: by 2002:a54:408e:0:b0:354:46fc:9bb3 with SMTP id
 i14-20020a54408e000000b0035446fc9bb3mr6745235oii.38.1668458541761; Mon, 14
 Nov 2022 12:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20221114194133.1535178-1-robdclark@gmail.com>
 <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 12:42:41 -0800
Message-ID: <CAF6AEGtshehnG8vPonD=ckH8-xbW+D6ykCrZBWDT6bVh3U0pOw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix speed-bin detection vs
 probe-defer
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 12:27 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Nov 14, 2022 at 11:41 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If we get an error (other than -ENOENT) we need to propagate that up the
> > stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
> > whatever OPP(s) are represented by bit zero.
>
> Can you explain the "whatever OPP(s) are represented by bit zero"
> part? This doesn't seem to be true because `supp_hw` is initiated to
> UINT_MAX. If I'm remembering how this all works, doesn't that mean
> that if we get an error we'll assume all OPPs are OK?

Oh, that's right.. and even worse!  Ok, stand by for v2

> I'm not saying that I'm against your change, but I think maybe you're
> misdescribing the old behavior.
>
> Speaking of the initialization of supp_hw, if we want to change the
> behavior like your patch does then we should be able to remove that
> initialization, right?
>
> I would also suspect that your patch will result in a compiler
> warning, at least on some compilers. The goto label `done` is no
> longer needed, right?
>
> -Doug
