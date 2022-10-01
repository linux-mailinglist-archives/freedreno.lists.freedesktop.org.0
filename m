Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858415F1DDC
	for <lists+freedreno@lfdr.de>; Sat,  1 Oct 2022 18:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436E310E377;
	Sat,  1 Oct 2022 16:50:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE89C10E3E2
 for <freedreno@lists.freedesktop.org>; Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id f189so8652503yba.12
 for <freedreno@lists.freedesktop.org>; Sat, 01 Oct 2022 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=g3lxI1rEb012jkHLPicQe05FcKANs5i//52fZg/FCRk=;
 b=luBhQJRCZ1/tzrdGyXpFnNJtdRZZfNZytLW/jVLHu4qzuikBh8atujFKR8HBcWbRAd
 s4rtnWo9N5G8xpkkt0kMIa29qEV5qfiy6+MYlMFzd0mo2KZENnIWsryce1i2sJr0BvUb
 sPlWATQIaoZmEpjvHxx2uFGqaJQjTtBoPSmpDlfByko7rK3IbydeaBf/F9S+f41D0Bxw
 MD/+vPbD5v+HKzuLcTNI1H0LjzbBaMiAdNlu5f4l4W24RG6FPe0J7BMLUtIGHOhYie4x
 1ayGA+WoZEcyPdmHQRdqGoaKFSCGHhGRnl8dAj48kPLZyP5BiOH/JEOTXDbEU3op7vjB
 TbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g3lxI1rEb012jkHLPicQe05FcKANs5i//52fZg/FCRk=;
 b=1obIMp8EWCIzD0apG5TRsfABN+UdKhlzbr8bqt9TojtFoh2nScGGmgsfrocMy0kS/N
 kpPNG09xKGRbzu79Ahq+HHFkGvmhXX28h07y8BN7310feCheDoi3tgs+NPkCikCfw6LM
 bDborYqAzI4g1j2EvOosNQ6UsPkmVmx2Oy6epReD8cWtsg4jXA1z2Uoa5UsoY0Tsv04y
 oVsw5XLzOzxyLvDy8CbXKQrQFJXNC7F/2rVewJ7mUD1wY8kJ+Nj8Yjkd03Ykn8xiRCdq
 J7EBPHYErveibcWa4SU3InrLreSZowAOnE0/iiMzrL/JS0N3qh26FyejYbBmQ/JnaBc5
 JqcQ==
X-Gm-Message-State: ACrzQf0Rbq7PjEWVSVqf763vVWZT9+W6N5PeGR6e3QCWun4aQwxL4IlS
 UvQKQ5SDzZOmPPMe/T9FHtNmEJ19mptraaTmKpzOog==
X-Google-Smtp-Source: AMsMyM5JaLBAZqMMzMpT3rZcygWPPiyF48NGvdL4SMEhpQ3AIcyxe9hHN8bHRjNaV5HDQiykqUH4lBdYlxIZy2oZwOs=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr13068673ybh.288.1664643047860; Sat, 01
 Oct 2022 09:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
 <A446B5C0-1EAA-4A24-8E7B-3C0EB2024026@linaro.org>
 <BN0PR02MB8142577BE680E27952F912A296599@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142577BE680E27952F912A296599@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 1 Oct 2022 19:50:36 +0300
Message-ID: <CAA8EJpobnK67OV7v_ze7X7PhWr0M32-=dthbV3ms3qdQ4mDCqA@mail.gmail.com>
To: Kalyan Thota <kalyant@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, "y@qualcomm.com" <y@qualcomm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 1 Oct 2022 at 17:25, Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
>
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Sent: Friday, September 30, 2022 1:59 PM
> >To: Doug Anderson <dianders@chromium.org>; Kalyan Thota (QUIC)
> ><quic_kalyant@quicinc.com>
> >Cc: y@qualcomm.com; dri-devel <dri-devel@lists.freedesktop.org>; linux-a=
rm-
> >msm <linux-arm-msm@vger.kernel.org>; freedreno
> ><freedreno@lists.freedesktop.org>; open list:OPEN FIRMWARE AND FLATTENED
> >DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; LKML <linux-
> >kernel@vger.kernel.org>; Rob Clark <robdclark@gmail.com>; Stephen Boyd
> ><swboyd@chromium.org>; Vinod Polimera (QUIC)
> ><quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
> ><quic_abhinavk@quicinc.com>
> >Subject: Re: [v5] drm/msm/disp/dpu1: add support for dspp sub block flus=
h in
> >sc7280
> >
> >WARNING: This email originated from outside of Qualcomm. Please be wary =
of
> >any links or attachments, and do not enable macros.
> >
> >On 29 September 2022 19:13:20 GMT+03:00, Doug Anderson
> ><dianders@chromium.org> wrote:
> >>Hi,
> >>
> >>On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc.com>
> >wrote:
> >>>
> >>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> >>> allows individual sub blocks to be flushed in coordination with
> >>> master flush control.
> >>>
> >>> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> >>>
> >>> This change adds necessary support for the above design.
> >>>
> >>> Changes in v1:
> >>> - Few nits (Doug, Dmitry)
> >>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
> >>>
> >>> Changes in v2:
> >>> - Move the address offset to flush macro (Dmitry)
> >>> - Seperate ops for the sub block flush (Dmitry)
> >>>
> >>> Changes in v3:
> >>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
> >>>
> >>> Changes in v4:
> >>> - Use shorter version for unsigned int (Stephen)
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
> >>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35
> >++++++++++++++++++++++++--
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
> >>>  5 files changed, 50 insertions(+), 6 deletions(-)
> >>
> >>Breadcrumbs: though this is tagged in the subject as v5 I think the
> >>newest version is actually "resend v4" [1] which just fixes the
> >>Signed-off-by.
> >
> >Not to mention that v5 misses the S-o-B tag.
> >
> >>
> >>[1]
> >>https://lore.kernel.org/r/1663825463-6715-1-git-send-email-quic_kalyant
> >>@quicinc.com
> >
> Latest one is https://lore.kernel.org/r/1663825463-6715-1-git-send-email-=
quic_kalyant@quicinc.com that I last posted.
> Don=E2=80=99t recollect on why tag was marked as v5. To avoid confusion, =
shall I resend it again ?

Currently I see v5 and after that comes a resend of v4.

So, please send v6 with all the tags being present, no y@ in the
msg-id/in-reply-to/etc.


--=20
With best wishes
Dmitry
