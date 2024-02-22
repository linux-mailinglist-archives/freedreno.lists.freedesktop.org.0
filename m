Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB78604C2
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 22:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21510E97B;
	Thu, 22 Feb 2024 21:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bDgWjbpP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E210E9CE
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 21:26:03 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6080a3eecd4so2045047b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 13:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708637162; x=1709241962; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAL1eQi9fwO5M4iI6CPGCaZqqkkbT0pjcXeRhNKkMT4=;
 b=bDgWjbpPphlAgLgI+TtvQdYGIsJBCKq1t7eGXarVQUNqPYsKBeZyMTaMReEYjR0PYY
 KJo7fo+HjzAJGbUAJelVbgKIC+dYvzjXuSBi4hG4ZVc4UHjc+iMTBvYZ2FMnIwPAOsst
 qsY33B0LT3dFN1MSdkPTWqg1VzX0UXpy1TTCNU4wTDEUGj9jxmMx4K53vtc+s5Z3CqCL
 cts0AQbWdFMVLFWKTDTpihuQb9cID3iZGydU7rrP9qn4ssQ3pFmdo8rZjDKtpqkdLA85
 HTOguH3pCDQff5Bf95n2NmPHj2PX5BegBbQcYbP/CYbDZWxnT+QVzvzBLCyebv4acVt8
 nF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708637162; x=1709241962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAL1eQi9fwO5M4iI6CPGCaZqqkkbT0pjcXeRhNKkMT4=;
 b=hRSpSVXL/MHQEH5a2hOVIH6RYDIEVBso3AgWeXLYWlZWn/ahz5UG5w/GCEmXzOg3Ye
 ozHmIQNgopn+71AYjIEP6wSheI7tg6Q1knLkaeTRX2bxkfDsMJmf7Lm99FNzx0Mdk5MG
 GDl8pBgHbHrsS0yDStCy1wHkYh6ViIzLR8CTu8Mgih47gIXHSY02+18ylq1wmIcggHen
 pY3CUMe7V7B4s40dPEv9eAINqnZeHKOIRzNXrdcZ33+54fYylp06Q+7CT0PhQREOvv4N
 dSnIzHNp06CvuMKZDQIIh54guVLCim+qGanAv87RVgvQvYt4nXRhANey1JjYaCfV4R7s
 7wag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRh8aFeHIXljGh35v00EdyGXFrDrWK440lyFTxXB86Ec2cB2WiALzhb4dvnhIx5BG6Dc7yfaHPbLPV8L9qKAeUvXvrkUlxlrQ73bN984Xa
X-Gm-Message-State: AOJu0Yz9w+2VQ+RS9an4/2mQ6tNZv+rWzWMysP0FxV+MlUxfSars0bv+
 rPXNORveV0V4zwJ8HkC9634NWLqy/1ZuNOBp5uRUBwaf6KPqP4X7KEX5B1GEarucOxshynpTwBm
 L4L6ftp2pp8FCbwFm034wD4PnI8wH2tqUw+lU2A==
X-Google-Smtp-Source: AGHT+IEFcsXBVJngj+jrntUh79Ngs62jpMD1Nkrbl1mK5ryjeqQFq5MvMKq11CjEr4oUdruoFkkp5lRGNDbdtOkU36g=
X-Received: by 2002:a5b:a49:0:b0:dc6:deca:468f with SMTP id
 z9-20020a5b0a49000000b00dc6deca468fmr412118ybq.29.1708637161970; Thu, 22 Feb
 2024 13:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
 <CAA8EJprXXjvanBU_HGv7X_dS3nyZ867AsvKj5+S3pnWcpsk1ug@mail.gmail.com>
 <20240222034727.GG2936378@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpotx0PiJ6geGUerOihnH3v5a=cm4ngpHsU1aKDOYtoAeg@mail.gmail.com>
In-Reply-To: <CAA8EJpotx0PiJ6geGUerOihnH3v5a=cm4ngpHsU1aKDOYtoAeg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:25:50 +0200
Message-ID: <CAA8EJprvVB1sU-LxirZ+myeYj2Cb22snoO5YWGP5YELR8YkGgg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/dp: Add DP support to combo instance in SC7280
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 22 Feb 2024 at 06:01, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 22 Feb 2024 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > On Thu, Feb 22, 2024 at 01:38:45AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > >
> > > > When upstreamed the SC7280 DP controllers where described as one being
> > > > DP and one eDP, but they can infact both be DP or eDP.
> > > >
> > > > Extend the list of DP controllers to cover both instances, and rely on
> > > > the newly introduced mechanism for selecting which mode they should
> > > > operate in.
> > > >
> > > > Move qcom,sc7280-edp to a dedicated list, to ensure existing DeviceTree
> > > > will continue to select eDP.
> > > >
> > > > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > index 7b8c695d521a..1792ba9f7259 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > @@ -129,7 +129,12 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
> > > >  };
> > > >
> > > >  static const struct msm_dp_desc sc7280_dp_descs[] = {
> > > > -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > > > +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> > > > +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> > >
> > > I think we need to keep .connector_type here, don't we?
> > >
> >
> > No, Abel removes the need for that in his patches - and while that logic
> > is slightly broken in the RFC I think it looks good.
>
> Let's see v2 first.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



>
> >
> > Regards,
> > Bjorn
> >
> > > > +       {}
> > > > +};
> > > > +
> > > > +static const struct msm_dp_desc sc7280_edp_descs[] = {
> > > >         { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > > >         {}
> > > >  };
> > > > @@ -182,7 +187,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
> > > >  static const struct of_device_id dp_dt_match[] = {
> > > >         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
> > > >         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> > > > -       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> > > > +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_descs },
> > > >         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
> > > >         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
> > > >         { .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
