Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9934DD1B9
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81810E8E0;
	Fri, 18 Mar 2022 00:12:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853F610E8E0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id pv16so14102812ejb.0
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
 b=QMhgbox8xCb6ZSHg6qb0nNgah3j0TTlKYxHwcoQrl/cBMnwf4ZupJHJTrgJFw1csLO
 g1QvwAy3Ivjs5kB+3lKnBlk25Xek9CCmKA1EGxMrbFc4YNYz+bwCOl0GB+vbKkHq5OuM
 64BLXfm8aEmJXYfZZ7n6OAY4gaM6+1LKmPmSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
 b=xr4E8TgFEZUQYyoXv4Lmr1dU1LrwGbZLkmcmBPyCggfbziLReZms5WML+llPzRMhoh
 ay23Ca6eCjBbOKQmho9KxAUy1odDTQm9K4KfiuLcCKOeb4dPI3QYLQ6xlTuDHmeKmGAf
 vcCWr3FD1vB0Jog3LYXcsb5m7aAp3+gDKdbQJXGzHaKOwwLJmWCtpfujN4nyGhOS0nmb
 2OZBb1yYBjgspgeveIC/SdnrcGH+QQJlyBA9E6dMyxCqdwcEjaAjzmNSJ9R3wP4wtvLV
 1u7sXmxgX78awi4M0mNzs0pn6nrsMRgZMGDEVDQopQGL0s6oAHQha5122/ruk3uUqwmF
 OquA==
X-Gm-Message-State: AOAM533cmZC8JQZU9XZDbGLsc0clE/UlFc3Ef7VtI7cXVZK3fuQ8ZJt9
 5J5RLAGS+WZKWBkmaQpNkB2Z7CGXWF5fO4aPmz4=
X-Google-Smtp-Source: ABdhPJyZVrbHS4dqO7aUACAGcxbRK/rLvEDaOEEFgPEvctOyvgE68vUHxpWC5NMWVYeO1U+Qvhxvwg==
X-Received: by 2002:a17:907:6d19:b0:6db:89c8:52e3 with SMTP id
 sa25-20020a1709076d1900b006db89c852e3mr6912276ejc.754.1647562359696; 
 Thu, 17 Mar 2022 17:12:39 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402354600b0041871c5b9a6sm3345735edd.41.2022.03.17.17.12.38
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:39 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id u16so8633820wru.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:38 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:203:ed96:8212 with SMTP id
 ay4-20020a5d6f04000000b00203ed968212mr3631950wrb.679.1647562358403; Thu, 17
 Mar 2022 17:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 2/5] arm64: dts: qcom: sm7280: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/

Some nits on how you're referring to the dependent patch:

1. In the commit message it's really nice to also include the subject
line of the patch so someone looking at the commit after it lands can
more easily identify the patch you depend on.

2. It's better to use links that have the message ID in them. In the
past patchwork's magic IDs have been list.

So I'd write:

This patch is dependent on the patch ("drm/msm/disp/dpu1: set mdp clk
to the maximum frequency in opp table during probe") [1].

[1] https://lore.kernel.org/r/1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com/


> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
