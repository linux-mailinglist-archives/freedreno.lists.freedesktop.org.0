Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE235EF9EF
	for <lists+freedreno@lfdr.de>; Thu, 29 Sep 2022 18:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746E10E607;
	Thu, 29 Sep 2022 16:13:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6470010E5F5
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 16:13:42 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dv25so3781945ejb.12
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
 b=U5nWZ+zCnE6ObM1a1HTcsz5fUlLj7t9tsv+E5+LhXtnz9e4+xVV3xDQOTnsLxYF47t
 2ZD30c3FM7IESBJDjIyKdNG1CIQ3oPQsfMBa45Rch5e+Fgg7012WK4guAP0mWiXKAOHg
 TK5WpXxFwsqpDoq6d1yO9pR9vCsxPFGrv9CUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
 b=dcI52z30Z+GrtItq7dzcS66rnba0XdhppegOTVgt6RmCtQta7Gq62mLlISBb96M7sb
 Bylobe/o0nqOaTpnCM4t9fTcrTlxZflC928jxM/OvkIo0cIpfEvPfzBJoymXDaTKeyCB
 PX58j5tDGccKCrahdH/y8eFspsQ1XAzKiG53eGhRzofWlsxnyhA32FV9BhiFCgyLNg4g
 MxND3Lcld2hTRqOLmwnRsTplmjqcKJxRiRtR9CWXgY+QEKrlNSzy438JaDIPHEIGrFJ4
 YCbHSVdv9WdaMi2i1jLPa38NAdAYiEfbVso16HfbKcM/GNbxDYLmOyIL+69HZwKekpr3
 j6cg==
X-Gm-Message-State: ACrzQf0yBQr5x6eA6+NeanQuhnyde4YuOlfYTKmdQaEjMrvxF8Wt49sS
 UwCHtPMMlp5yXfqXM/kWbh4wRs3WmpGvAiUb
X-Google-Smtp-Source: AMsMyM7mG4lNTBearusdajgrhRB7tGV64CDCkQyncAQxKsuNJH8yJbHvN+jvGiQjqpj8xCGF6tOyYQ==
X-Received: by 2002:a17:907:762d:b0:787:a8e3:17f2 with SMTP id
 jy13-20020a170907762d00b00787a8e317f2mr3295047ejc.661.1664468020410; 
 Thu, 29 Sep 2022 09:13:40 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 l16-20020a056402029000b00456e6e64047sm5566956edv.94.2022.09.29.09.13.38
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id x18so2963694wrm.7
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
X-Received: by 2002:a05:6000:168c:b0:226:f4c2:d6db with SMTP id
 y12-20020a056000168c00b00226f4c2d6dbmr2895434wrd.659.1664468017868; Thu, 29
 Sep 2022 09:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Sep 2022 09:13:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v5] drm/msm/disp/dpu1: add support for dspp sub
 block flush in sc7280
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
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Seperate ops for the sub block flush (Dmitry)
>
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
>  5 files changed, 50 insertions(+), 6 deletions(-)

Breadcrumbs: though this is tagged in the subject as v5 I think the
newest version is actually "resend v4" [1] which just fixes the
Signed-off-by.

[1] https://lore.kernel.org/r/1663825463-6715-1-git-send-email-quic_kalyant@quicinc.com
