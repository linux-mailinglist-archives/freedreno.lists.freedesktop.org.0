Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF985F04D
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 05:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8CF10E869;
	Thu, 22 Feb 2024 04:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xEKa/Vww";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331610E86B
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 04:01:52 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4994802276.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 20:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708574511; x=1709179311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sj35YOjK6RKB4C5ExxVych1pGfUJCfir8o97Bxs9Vxs=;
 b=xEKa/VwwLCI7fPXDInKdUXkBB3hgb7ozj5h3OzxLhVo4cqToY9Vwi+Jzelk7Z+Qt2o
 8Zj9BIiAp5bMwog4+BEF3Uuig1AI167gbDaExtoWpcNkppcwUkHhKs63xHKq7aQoL5h8
 B79OpHB5rAf95svssKLBwEJChlpfosqaZNNypmGCIveFQdyohD21btwnZ6pnMsrgJb/Z
 9xn4CARFCL8Gztdjo4ualfKnsyzf6Ll0EF5/RRcBYD/q0yu08yoWVanBfVEL0kxg8P/f
 nwiDTFg4+vAkyvZ/RYSiJduB0OMVhFiWb6cfBIS4Cg3JPAsL/gBFoEOYlxTLJtpbNJxM
 qp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708574511; x=1709179311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sj35YOjK6RKB4C5ExxVych1pGfUJCfir8o97Bxs9Vxs=;
 b=AlnIB///g7Ua42G0ja+0p3B+h0qlnzkfm8t4ZmoIO6Qo54XQM/xroDxqgeuNH+XdBB
 NE9jG9DR4N1bL7mp2D7fZ5lFn24PK2ULD4R67Rlb/NojZlRSuZtcWc5QoItN34XcGsID
 twEaIKjnDrr/cAMtcWd8Y0njVqmllCze+tEGaiXZ59DLwNg471qckD/p7RBrsQkdVxne
 fr/SdPNduUS3nW4Ptxjwjxjj5QJGN7bZMrCrnNBVl5jCfh08pmMyVg/VsEt7PlzVUKcP
 C5VkCvsV+8sKRBqGEf4jlyAaHVquJtMZZ1oSz5qcwCqnYuoexhMbD4tjlY70LeACU7i3
 BxcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIOUq9a9xx0rDz40IiyhKrY51mZE0p4pH9I1pg8c9+yuuwdjTLqE217gt4hgahC+kxXrQcv+CjMFOEaR7JnfwUFZ3WXEs6vVvYkeTe4sbK
X-Gm-Message-State: AOJu0YwErWO8V9Y1mmh6HuLuNrahKF58vwvnp/2MDEjfZvqFtZ1y6coy
 AV0gS5HvZuIskSUQwXiOO0GA9UAt6VulnTvpTVVYXfQXF4/LdHw3ZqgeY/I+VzvgDawG9xAcx05
 /PAitRzQfJEBHqdLq81G7dW9WMcsCyDxuNh3D2Q==
X-Google-Smtp-Source: AGHT+IG7ga8Qwv736rdMo9Jd6hOdoA/3LAjM8sRFm6VRm7EEEGVF9fa5s36oG1kV9WzIB5M4xsWL1nKyzNF2W5KfJjg=
X-Received: by 2002:a25:2944:0:b0:dbc:decf:e511 with SMTP id
 p65-20020a252944000000b00dbcdecfe511mr1272238ybp.6.1708574511204; Wed, 21 Feb
 2024 20:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
 <CAA8EJprXXjvanBU_HGv7X_dS3nyZ867AsvKj5+S3pnWcpsk1ug@mail.gmail.com>
 <20240222034727.GG2936378@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240222034727.GG2936378@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 06:01:39 +0200
Message-ID: <CAA8EJpotx0PiJ6geGUerOihnH3v5a=cm4ngpHsU1aKDOYtoAeg@mail.gmail.com>
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

On Thu, 22 Feb 2024 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Thu, Feb 22, 2024 at 01:38:45AM +0200, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > >
> > > When upstreamed the SC7280 DP controllers where described as one being
> > > DP and one eDP, but they can infact both be DP or eDP.
> > >
> > > Extend the list of DP controllers to cover both instances, and rely on
> > > the newly introduced mechanism for selecting which mode they should
> > > operate in.
> > >
> > > Move qcom,sc7280-edp to a dedicated list, to ensure existing DeviceTree
> > > will continue to select eDP.
> > >
> > > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 7b8c695d521a..1792ba9f7259 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -129,7 +129,12 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
> > >  };
> > >
> > >  static const struct msm_dp_desc sc7280_dp_descs[] = {
> > > -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > > +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> > > +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
> >
> > I think we need to keep .connector_type here, don't we?
> >
>
> No, Abel removes the need for that in his patches - and while that logic
> is slightly broken in the RFC I think it looks good.

Let's see v2 first.

>
> Regards,
> Bjorn
>
> > > +       {}
> > > +};
> > > +
> > > +static const struct msm_dp_desc sc7280_edp_descs[] = {
> > >         { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > >         {}
> > >  };
> > > @@ -182,7 +187,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
> > >  static const struct of_device_id dp_dt_match[] = {
> > >         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
> > >         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> > > -       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> > > +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_descs },
> > >         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
> > >         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
> > >         { .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
> > >
> > > --
> > > 2.25.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
