Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2098D17DA
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2024 11:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B6410E0F4;
	Tue, 28 May 2024 09:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KPKohvnR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2E10E16F
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 09:59:18 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e9819a6327so7025281fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716890356; x=1717495156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOHB0bGKjsCzyiTOasGxYrmiv1nfb2UcuoN8pI6JNDM=;
 b=KPKohvnRiDskdr3nnwNRarF/o8xklmlCH6Yb0NbuJLWhMnI6IYSe8KmCYy/XcNZlZa
 z7DCS7oCuyty9kvh+/7jNbS7RQpAtcLMoeMjUly4Uv+wD12RJPnFkeZsbgF+hRfmbVwo
 YM96diq1NRtJi2kuP9s3EgMba+sX3/iOq40wLcW8+0G7sB7Xa8nahbXa+T61ndmb2Dxo
 +DhiehNtrrWZkCi8MfF51lYd0iYZkxwh/LE774EZMgHuHw8pbbsv4sUf6ZeeKMNqrk/I
 bTbjA+fq2DW7NKRkzmRa0CeCn/v9ej8sEjDp1Alp2Aup7Ud6F2tb0drqtdUrs9BL9EZM
 J6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716890356; x=1717495156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOHB0bGKjsCzyiTOasGxYrmiv1nfb2UcuoN8pI6JNDM=;
 b=dg9ffJM6Wpzxu+2yp18731sUABdxTyBLo9APf6e5OwDOX+xLAIZexYJCtw3BCC6CYY
 k0LEZvLoFSxAhcMkNFgIj8O70nV7yeOuA0/ge5M0OyraPtwdt8G70RLHNV/07ku0sS2T
 obFGxNAN1zmyWO73YqDjdNijvHA6eoGmnGDjGXmUR7fTPUQ6hhZQxWiovh2jRx5GEeXC
 Y1ygN7xWHf8z3/pDYOkicIvcqWrRuQfQZYOTXD7s4KUUYcAf+ohZNOQHHorE/kBx//Dv
 Enhr1l5gPm3wE3Npxk9JF26aobT/JAyF6BwJaLratBA9OccECzEwweJhQ4g2qbP14aPF
 rHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl/lx1VeN3W0RLnki0oJDTvjrFrimyeB1otijZykXz/Qvo6x1drO2GCXqRhlB//etm+0u1pIgIzn6FzXKrgaoqAbm2LOXW13eNLDTz1eAD
X-Gm-Message-State: AOJu0YyBZGe85qOiXuyUssEHGEyBDZUCfKfu2oQyvd+YqbwchZ94iamW
 wKjgbh3JD+wBhFyMl3592ZRzgd62oCyx3I8nRTw7dhWNiN6hs2AzGhZPi5tOjgdshtGjMhhI/kM
 WXKkozCCRhzr/aA+hl4F1mYYGNqj0pdOq2188pw==
X-Google-Smtp-Source: AGHT+IEZJYr+NYpN1e2hcVYIpvKh++Em5UUPY+WUg+bF4xLU9EiG0nuQH84CetGWUAZkjEZpNzWVC6lOezqgm1EUpDo=
X-Received: by 2002:a2e:80da:0:b0:2e9:798c:8525 with SMTP id
 38308e7fff4ca-2e9798c866cmr27784281fa.26.1716890356147; Tue, 28 May 2024
 02:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
 <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
In-Reply-To: <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 28 May 2024 17:59:13 +0800
Message-ID: <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B45=E6=
=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 08:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 27, 2024 at 10:21:48PM +0800, Jun Nie wrote:
> > data is valid for only half the active window if widebus
> > is enabled
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 225c1c7768ff..f97221423249 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct=
 dpu_hw_intf *intf,
> >
> >       data_width =3D p->width;
> >
> > +     /*
> > +      * If widebus is enabled, data is valid for only half the active =
window
> > +      * since the data rate is doubled in this mode. But for the compr=
ession
> > +      * mode in DP case, the p->width is already adjusted in
> > +      * drm_mode_to_intf_timing_params()
>
> Is there any reason for divergence here?

Lots of parameters in dpu_hw_intf_setup_timing_engine() is calculated
from timing->width,
such as hsync_period and display_v_start. So the width cannot be
adjusted beforehand in
drm_mode_to_intf_timing_params(). Otherwise, we get below error.

I guess the interface timing configuration differ in silicon, thus the
software shall handle the
difference. If we adjust the width beforehand for DSI, we get below error.

[    6.625446] [drm:dpu_encoder_frame_done_timeout:2469] [dpu
error]enc31 frame done timeout
[    6.642369] [drm:dpu_encoder_phys_vid_wait_for_commit_done:525]
[dpu error]vblank timeout: 4200c1
[    6.642395] [drm:dpu_kms_wait_for_commit_done:493] [dpu error]wait
for commit done returned -110


>
> > +      */
> > +     if (p->wide_bus_en && !dp_intf)
> > +             data_width =3D p->width >> 1;
> > +
> >       hsync_data_start_x =3D hsync_start_x;
> >       hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
