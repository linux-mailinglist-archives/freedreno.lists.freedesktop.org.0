Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0EC4D3A51
	for <lists+freedreno@lfdr.de>; Wed,  9 Mar 2022 20:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F2610E39D;
	Wed,  9 Mar 2022 19:25:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142510E3F1
 for <freedreno@lists.freedesktop.org>; Wed,  9 Mar 2022 19:25:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g20so4194154edw.6
 for <freedreno@lists.freedesktop.org>; Wed, 09 Mar 2022 11:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9Y6szzvKtNHoFGCjb1F/maZTq9LGD/L2oPRd71PbSg=;
 b=loJ4PyWWDk+MnjSEe9xkYcUQ+ARkCw/t7ZO5FrgFH/jEsHuyJEpg3AKAsftIm6OkSn
 ZRp+5pjqcNtZj+sXo8p4FlSS7uN+9Li5sNb+nDLHkgqHcpj7hz2YkjJ+ICsNao3JJyk/
 tCrtC1n8SySLdhq5cUehTSAY6gRAqJHpgfNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9Y6szzvKtNHoFGCjb1F/maZTq9LGD/L2oPRd71PbSg=;
 b=usHPjHMLovRFOXM5d1A2gxe710FCnXdMvc3YlSK2/WRxBik5GrlGs6GngNZgKZSuHQ
 qVmDz/w64w+cUhXZ9QbFvP8l01ISsjKqnfp7GVgMhq4UBpoPzTYhElWUzLiW6gNkVoAR
 P0pYgxZaSTgWOerN4yOjf+CbKfSI8f7VqkFGJLSM9iH7dkAdbiw/npFw2j28lqRJLGQV
 bfN4LeYvF9DwTaqw0Ctn8qEYcpIKtYyUiipED3xpo3rJ+bz2bc/r0kjRgDOciMuWBCFb
 p0DrCu2tlI4bXCGe6QFzwmeiUN5QYJ0ptT+P+HquLXqG3uqfcJIMwnAgPIF0Q/cXZmeL
 c3HA==
X-Gm-Message-State: AOAM531tJ7bva/wT/Rm7TuitQJ9308J1Upb5EG6wcx3Tz4wmFbv8Ym41
 BCi7D/1q+iDkrVX5X2xltgTACsspBxQaQhpB
X-Google-Smtp-Source: ABdhPJwTbFiaRGunxKrjKA/Qo9KtXGNi0G3FTPs+dAxFWKrlr0PIoyACDKoovfZkXFZJLsmQWbfknw==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id
 l24-20020a056402231800b004137645fa51mr966527eda.201.1646853938778; 
 Wed, 09 Mar 2022 11:25:38 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 gs39-20020a1709072d2700b006d3ed4f51c6sm1143668ejc.0.2022.03.09.11.25.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 11:25:37 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id t11so4624097wrm.5
 for <freedreno@lists.freedesktop.org>; Wed, 09 Mar 2022 11:25:37 -0800 (PST)
X-Received: by 2002:a5d:5232:0:b0:1f7:7c4c:e48 with SMTP id
 i18-20020a5d5232000000b001f77c4c0e48mr811587wra.679.1646853936582; Wed, 09
 Mar 2022 11:25:36 -0800 (PST)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 11:25:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
Message-ID: <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to
 the maximum frequency in opp table during probe
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 8, 2022 at 8:55 AM Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)

In addition to Dmitry's requests, can you also make this patch #1 in
the series since the DTS stuff really ought to come _after_ this one.

...and actually, thinking about it further:

1. If we land this fix, we actually don't _need_ the dts patches,
right? Sure, the clock rate will get assigned before probe but then
we'll change it right away in probe, right?

2. If we land the dts patches _before_ the driver patch then it will
be a regression, right?

3. The dts patches and driver patch will probably land through
separate trees. The driver patch will go through the MSM DRM tree and
the device tree patches through the Qualcomm armsoc tree, right?


Assuming that the above is right, we should:

1. Put the driver patch first.

2. Remove the "Fixes" tag on the dts patches. I guess in theory we
could have a FIxes tag on this patch?

3. Note in the dts patches commit messages that they depend on the driver patch.

4. Delay the dts patches until the driver change has made it to mainline.

Does that sound reasonable?
