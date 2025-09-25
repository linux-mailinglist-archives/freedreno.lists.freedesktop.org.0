Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E12B9D676
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 06:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AD510E83C;
	Thu, 25 Sep 2025 04:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ncfnJBLq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895CB10E83C
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 04:43:55 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-63605f6f64eso205638d50.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 21:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758775434; x=1759380234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oJ0z/i9UwoXPf+FRdpG+d9rqB85q6G/tg6yqdMdAbE=;
 b=ncfnJBLqgOwF2QVDB8SREW3tJi+w00crRsoU6qjV3nw0yoVfNg674FEdVWWYUKuyJA
 KrexN1ASjjO8iL6rc8cT+Y48sPpAWgqfJ4Jbk7990K0XdI085FUGvCAD5bT1Xljz+PEg
 QPF+TFJPh4SRj4ccQyA0TsPAtxLkx28X1JXuNCsbsBoD4T8boSfZxO70YcgCG98+DbTL
 IBMyQH32su0DKBmMFnwlI5wYkGK71iaX/IKnbvYkq5A0sZXzRqqSlksBU/nZtQLTUrwg
 KcUtJXIhHt+rQSXX6nHxIQ8LYB4qdqRVCIPIXW/3ql7ASDwMc5augRpmuUbvPhBJTlF4
 fgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758775434; x=1759380234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oJ0z/i9UwoXPf+FRdpG+d9rqB85q6G/tg6yqdMdAbE=;
 b=gEG7xBvJZjwjOX1+z/lLOJNigD83FRqN3d+1cinOpn8eb6uAjQEUKEcTxeP24kmaHr
 6N/+kVqxGoLINyxv/PkKfcaKc6aFeEGBYlq34Pb1+USPcVzXn9YeMbWD4hu3USeTUl2B
 cQHdmDR99g2CQ/JzHONbH3ic/elLD4MmX0gcCRBPxCkaRsiA9OW8NKNywP+YRdQclyjM
 5Qc0neIVwGkDAK5t0jXSiIi4Kk3bXU+DQMBd+QKD87+oLOixtnCRGckAokhUsokLWgrH
 YKv8LfrT8vwQpFw/F6sAdsB2shk/3fr3WAn5FaGk4kTY6MsVMYQEbF8wbLwCl0q0Jivw
 jJ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY6d74UtyE7g6d/iDAn46sKh6C7R+ZWl+lLU2v2tJkTPnA5Pg1IhIH5hsgirTP7Thj7oJB9lKjxbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzddobXESPBtyWKKhnOXNeUpn2nsBGT0/Lo/PR+uov18A8rj4uq
 YtlvR5dasXTFIim4aLfrgJ3IkfeKWjxZVUFbp3F2JAvEFru7m5uygrKIE4E3Sb4QyLGk2XBIQVh
 r4/tktzavt+nWqi4V15Pcc7+Co9FVCdJT4f09Plie4w==
X-Gm-Gg: ASbGnctj2Id6033Oh/fEIFfVjw5qNZl972r1UhyaYDn2GgNZX4xN6sPTemS7igKquDA
 Y3lNyuPqTcmFtUUSfGi2gF+0PVUY4oBmDMpIqHagHI8ID1cInrL7TWzo45hhyvvv8SE6qpPpwxU
 ye+wwkfxggz+mzevUeNIEqpe6W1JmZ0iuggaTIN5JWfKB5v4WHP84dl204LBEo3QNNfIFWFxc7y
 nXz6/XKbveu6qImOXLkNn/KnQZJJyi9w1BpmA==
X-Google-Smtp-Source: AGHT+IFrDu14o9eG1G/hd/jmgmyyF5h7kKgIrglBSkEsXTmL19swhPH9YqIMrOxeKGPXFw+V8ureBREiZfTmlkcgTpM=
X-Received: by 2002:a05:690e:2146:b0:633:961a:bd46 with SMTP id
 956f58d0204a3-6361a85f9a2mr1236698d50.25.1758775434361; Wed, 24 Sep 2025
 21:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
 <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
In-Reply-To: <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 25 Sep 2025 12:43:43 +0800
X-Gm-Features: AS18NWDgoGjQmOdf_hz0GeNod_X081dyusIHBuXhWh7GwxfQWDtv3U1S9TJ5f90
Message-ID: <CABymUCMvczXHM-cOXNko77xDVxX8Q6MA2AEZcGx_Yg6TWosMAg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
9=E6=9C=8825=E6=97=A5=E5=91=A8=E5=9B=9B 03:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 24, 2025 at 11:08:12PM +0800, Jun Nie wrote:
> > Support a hardware configuration where two independent DSI panels are
> > driven by a single, synchronous CRTC. This configuration uses a bonded
> > DSI link to provide a unified vblank for both displays.
> >
> > This allows application software to treat the two displays as a single,
> > wide framebuffer with a synchronized refresh cycle, simplifying renderi=
ng
> > logic for side-by-side panel arrangements.
>
> I'd like to understand how is it framed on the overall system design
> level. If it's a panel controlled over the DSI interface, it's fine
> since we can broadcast commands over two DSI links. What if the panel
> (or bridge) is controlled via I2C / SPI?

You mean there is only DSI data and all configuration is done via I2C/SPI,
right? I do not have a real use case so far, but it can be supported in the
same way. Panel driver finds the sibling panel via device tree to get the
peer I2C/SPI first. All commands are send to every bus in panel driver.

>
> >
> > At the DSI host level, the frame width for each link must be that of an
> > individual panel. The driver therefore halves the CRTC's horizontal
> > resolution before configuring the DSI host and any DSC encoders, ensuri=
ng
> > each panel receives the correct half of the framebuffer.
>
> >
> > While the DSI panel driver should manage two panels togehter.
> > 1. During probe, the driver finds the sibling dsi host via device tree
> > phandle and register the 2nd panel to get another mipi_dsi_device.
> > 2. Set dual_panel flag on both mipi_dsi_device.
> > 3. Prepare DSC data per requirement from single panel.
> > 4. All DSI commands should be send on every DSI link.
> > 5. Handle power supply for 2 panels in one shot, the same is true to
> >    brightness.
> > 6. From the CRTC's perspective, the two panels appear as one wide displ=
ay.
> >    The driver exposes a DRM mode where the horizontal timings (hdisplay=
,
> >    hsync_start, etc.) are doubled, while the vertical timings remain th=
ose
> >    of a single panel. Because 2 panels are expected to be mounted in
> >    left/right position.
> >
> > To maintain synchronization, both DSI links are configured to share a
> > single clock source, with the DSI1 controller using the clock provided
> > to DSI0 as below.
> >
> > &mdss_dsi1 {
> >    assigned-clocks =3D <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> >                    <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> >    assigned-clock-parents =3D <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> > }
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a5=
1a0a3e3f96f6c3838 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -177,6 +177,7 @@ struct msm_dsi_host {
> >       bool registered;
> >       bool power_on;
> >       bool enabled;
> > +     bool is_dual_panel;
> >       int irq;
> >  };
> >
> > @@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *=
msm_host, bool is_bonded_dsi)
> >                       return;
> >               }
> >
> > -             dsc->pic_width =3D mode->hdisplay;
> > +             if (msm_host->is_dual_panel)
> > +                     dsc->pic_width =3D hdisplay;
> > +             else
> > +                     dsc->pic_width =3D mode->hdisplay;
> >               dsc->pic_height =3D mode->vdisplay;
> >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> >
> > @@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *=
host,
> >       if (dsi->lanes > msm_host->num_data_lanes)
> >               return -EINVAL;
> >
> > +     msm_host->is_dual_panel =3D dsi->dual_panel;
> >       msm_host->channel =3D dsi->channel;
> >       msm_host->lanes =3D dsi->lanes;
> >       msm_host->format =3D dsi->format;
> > @@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struc=
t mipi_dsi_host *host,
> >       if (!msm_host->dsc)
> >               return MODE_OK;
> >
> > +     if (msm_host->is_dual_panel)
> > +             pic_width =3D mode->hdisplay / 2;
> > +
> >       if (pic_width % dsc->slice_width) {
> >               pr_err("DSI: pic_width %d has to be multiple of slice %d\=
n",
> >                      pic_width, dsc->slice_width);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
