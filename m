Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09A50B989
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 16:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D110ECFA;
	Fri, 22 Apr 2022 14:09:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B51310ECFA
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 14:09:35 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f5so9766892ljp.8
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
 b=EwnC0F+Pg4MtRzeeWPuywGVVfrIfoQpkjZejmyOOhaV3NRtb5XzudpYoMW98fIdcAm
 NUM6hR06S3J+6kzWZeWdVcyZdI0Toqj/vsaUJ+zpNTbPAQhBWPEucmWtE0wTHtBDsJ05
 p7cS3QW5VSa1GBar/5aair5GlO7o2wDtoN4xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXfqebKK5B9iW+cuu7Wrx8oyDP/rWO517FbDuh8GYTA=;
 b=2fVfdys1WX3suDb8YJwyWnduFcRu2suNQ/Zmr04F9RTPlPSJ8CrI4tR5ybRm1dXhk1
 Kdd6tSAATzQm3W5RiN7gSQpVMXsuKfBYn9CMZqAIgdInIrs7QKlsm0x3iHYu9QHFLSeq
 5PxM1PCtCqoP43gGWS9BjwEbM7x7/ooUjPouDPAYvFUKOKGRbfQkh1xJIVz0A9I04aZC
 c8wJAOvRnNG+nVkax891OcNg5/ogRFMyx2Z+AGweBpRrAhxhlEsw/5r8MsIXlkcJ4XPx
 feOi41z/TM9eR1aeS+SG6HcDUWwadOZig0E7PEQU/2gqWbFt4hnaTA5/qNt9EBa+s+Uk
 EUjw==
X-Gm-Message-State: AOAM533egE58VEbINPxy1+Tu8BhJz4wAD4ANt8lQ2umo7BGhe9R2Iwrn
 valJfhzh0rCqUmbpBTuKhycUywfgvCN8GzzKFW8=
X-Google-Smtp-Source: ABdhPJy8+5Gn2Nk25W8r4Ba2agTPdzk2gnBzlAMMkSydQTQldEBFneRV94WowsM+HRQBNgU74sqfxA==
X-Received: by 2002:a2e:bc09:0:b0:24d:b413:7be with SMTP id
 b9-20020a2ebc09000000b0024db41307bemr2900776ljf.504.1650636573263; 
 Fri, 22 Apr 2022 07:09:33 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 e25-20020a195019000000b0046d18e1e08esm238446lfb.121.2022.04.22.07.09.32
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:09:32 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 17so9806765lji.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 07:09:32 -0700 (PDT)
X-Received: by 2002:a5d:6506:0:b0:20a:c240:90e2 with SMTP id
 x6-20020a5d6506000000b0020ac24090e2mr3855081wru.342.1650636201140; Fri, 22
 Apr 2022 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 07:03:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
Message-ID: <CAD=FV=U9M_qsEacBHundgZAHMg7NEnW1LKZX6niN4fmsKUwt6A@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 1/4] drm/msm/dp: Add eDP support via
 aux_bus
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
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
> controller driver should support aux transactions originating from the
> panel-edp driver and hence should be initialized and ready.
>
> The panel bridge supporting the panel should be ready before the bridge
> connector is initialized. The generic panel probe needs the controller
> resources to be enabled to support the aux transactions originating from
> the panel probe.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comments for panel probe
>   - modify the error handling checks
>
> Changes in v8:
>   - handle corner cases
>   - add comment for the bridge ops
>
> Changes in v7:
>   - aux_bus is mandatory for eDP
>   - connector type check modified to just check for eDP
>
> Changes in v6:
>   - Remove initialization
>   - Fix aux_bus node leak
>   - Split the patches
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 73 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++--
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 23 +-----------
>  drivers/gpu/drm/msm/dp/dp_parser.h  | 13 ++++++-
>  5 files changed, 101 insertions(+), 30 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
