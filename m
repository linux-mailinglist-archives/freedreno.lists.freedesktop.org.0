Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FCA4AE481
	for <lists+freedreno@lfdr.de>; Tue,  8 Feb 2022 23:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6D10E2D8;
	Tue,  8 Feb 2022 22:36:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128910E18E
 for <freedreno@lists.freedesktop.org>; Tue,  8 Feb 2022 22:36:16 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id c14so382279qvl.12
 for <freedreno@lists.freedesktop.org>; Tue, 08 Feb 2022 14:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4N/VNg4Z4S2yqwqo7lo1EjNg6APRg3vzTZff0H8mfjg=;
 b=talymFDqCzEUp4aHHWidFmuLQAjI7ib4UgEt38u23rP/AK6rIrytCEjeQZQh3RU080
 LPJe8b6QR0MHHR+TGcPrW08xNorYwQdYxPrj5gIqRh/Fn+ts37j7rrgcDpyMSXHpVyIq
 UA3ZMQ+8R9NiO946F3uG01eWoF61WgKLRkQ9lMD4DkAsJ89tfB0gq7BrXjuLwA8VSoFg
 VIohx2OoJk7bOWu8UnVAcyGyzXeY96nI3KsFWqDL7cMtm80M9gfVx4IiYcAVy3aWv0Qf
 K4YOmtSq+AXmcw2M/DN1ye6a8nuh0FdRmgMZ2DqlIS5jJ9pem5fnbtyU0+CAyQjSxfWF
 lQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4N/VNg4Z4S2yqwqo7lo1EjNg6APRg3vzTZff0H8mfjg=;
 b=7t/PutZ8uJmo0gXTGvz9+Gxzu/f040KtBeMaETr/YyoK0C6dEJWC0QknvZGFL9Rufx
 v4nrt6pv467WW7M2k/38YPF+XlMAexQb6ePN980DVrSc5otNKi+XUa5fwyM5cxRyZIEX
 NTgvlN3p6PPlmx06abO3m7hlmxoY5pTw88I6181T6B7nJ0vgRFvxf3WaBYNUvAnpnTmR
 xfFYGQ1IJRRiV/2gWU4SUsOyvIZ8kW5tjyAjuR+mzG5pSEFG7Lm8ynik4Wkecx6fITu7
 +iLZT6ydmEkqa4C3/vpKHuy78l0bNDAsTPjE/eUklpbiqUpl3UPTEodZoMnxYeD0iPP+
 OPpA==
X-Gm-Message-State: AOAM532mPvsXJcpEu088PphbT0DxZwpN8DBAp8o+jisf2i82ASQLxVul
 Dr7ByYh1IDR4a2oQAIVr97pwdl7feUIyboYYoj+wEA==
X-Google-Smtp-Source: ABdhPJyF46u8KAMmRWmD7rrzZKsobdyPRpM8YW1eiuvtHbLOEyo4TZh7sHhOrBLHCinn/AeeEBBrZcDWnwWA1wUxHI0=
X-Received: by 2002:a05:6214:2aa2:: with SMTP id
 js2mr4831360qvb.55.1644359775256; 
 Tue, 08 Feb 2022 14:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
 <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org> <YgLff2ZFjEN3I3M2@ripper>
In-Reply-To: <YgLff2ZFjEN3I3M2@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 9 Feb 2022 01:36:04 +0300
Message-ID: <CAA8EJpqtb90V6oN_d7_MYXvTNyt2NhLudJ-iJAbPb-ymX6JLQw@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add DisplayPort controller for
 SM8350
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 9 Feb 2022 at 00:21, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 19 Jan 15:14 PST 2022, Dmitry Baryshkov wrote:
>
> > On 28/12/2021 07:59, Bjorn Andersson wrote:
> > > The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> > > add support for this in the DisplayPort driver.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
>
> I don't see this in linux-next, would it be possible to pick it up now
> that we're past the merge window etc?

I'll work on my staging tree (and send it to Rob) before the EoW.

>
> Regards,
> Bjorn
>
> > > ---
> > >   .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
> > >   drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
> > >   2 files changed, 9 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 5457612ab136..cd05cfd76536 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >         - qcom,sc7280-edp
> > >         - qcom,sc8180x-dp
> > >         - qcom,sc8180x-edp
> > > +      - qcom,sm8350-dp
> > >     reg:
> > >       items:
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 8d9c19dbf33e..fd0fd03f8fed 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
> > >     .num_descs = 2,
> > >   };
> > > +static const struct msm_dp_config sm8350_dp_cfg = {
> > > +   .descs = (const struct msm_dp_desc[]) {
> > > +           [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > > +   },
> > > +   .num_descs = 1,
> > > +};
> > > +
> > >   static const struct of_device_id dp_dt_match[] = {
> > >     { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> > >     { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
> > >     { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> > > +   { .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
> > >     {}
> > >   };
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
