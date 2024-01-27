Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55783EB55
	for <lists+freedreno@lfdr.de>; Sat, 27 Jan 2024 06:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CEF10E46B;
	Sat, 27 Jan 2024 05:43:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464F410E42A
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jan 2024 05:43:36 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5edfcba97e3so12033857b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jan 2024 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706334155; x=1706938955; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gLO6g7N21Idqil6jwJTMgSDzHCEwfR00dveBCYg6xrc=;
 b=EdqYGsd5Lb+PhCJWrdbeMrCWZjLZYB1li3xq7a6jLS9wUB0fM0Fz3XW22DyHDHfZQz
 cpDedmt6smLS7lBbKxwt4c5Oz+m/tFJ+/qyrKmrIjjazOMXaSOkQVEvM+8qNY7FnpD9X
 vYVB7O4jf40mB1KLrODC3gJHN+6Peg44JFIzXx5/SwgLyrUjNols4k6lwtoWvoDQq5e5
 d3kNR9OhT1n+H5fv2OQIdSHl46JpJW8paHIQWZqFhB13ThNszx6dpWMuwWOShFsIiZCQ
 UIwG94n7XWsSi7CDkoOJF49Vdoi+oZHw1S5p8MB3yE8RbyooC2f25oV8qiDzZcxjnStR
 henA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706334155; x=1706938955;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLO6g7N21Idqil6jwJTMgSDzHCEwfR00dveBCYg6xrc=;
 b=Rw4V5KGM4rrxrm5D4CcIvUE8vQNGgRPboluPDwMRsRuhfkhc1IGyhhxRLKD1KvHqZ+
 hkKyXF0WrimaZCYFdSYFSdsnOwSg12K/dRdTB/uZjyOnJti9saXR5QD3BDJkNAVnudR2
 +YVtfxhRrWrZJ/k5oBpZXCyPPfv2b54n8zkLS5UgbbwgwVXczzGsX3krcibWottDKI/n
 wSsmS9raCjCG9uv3hUtst7kUuWREtKZb/eSB7XA9ouX2FFsABOAqOiTID9OJS8bDRu0k
 FbreW5HvLehfvrrN+5yeXBjC/heKY9czc31ho/zspMYTnCKSSBGRP0ZTCvdIMI+FOuNj
 sPMQ==
X-Gm-Message-State: AOJu0YyoQ4qE+KkOocHpvfSsH2Y8DmfnD5VxSsUuuVDAKDeQ2kDmL1Wm
 0TOS7kKqFCj9nalWrkeH6cujirxX6cg4tnIxEL4ioN1QQSEKK8H/Bw9o8mfdRzLDhH4yib8j8Gt
 c7lE2MppaYpL6pQxE8OgvqpWpsnHDCOOaoveMyg==
X-Google-Smtp-Source: AGHT+IGfG9ECWJtlGCx/XgHVaYHNizDSKPDhJ1K4b2ASfHNN+HUB98imY4w0O2vIuwpSbFfsezaSH4jff5xrFAtDuuI=
X-Received: by 2002:a05:690c:3388:b0:5ff:6e27:cb4d with SMTP id
 fl8-20020a05690c338800b005ff6e27cb4dmr1007714ywb.72.1706334155548; Fri, 26
 Jan 2024 21:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
In-Reply-To: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 07:42:24 +0200
Message-ID: <CAA8EJppLsGhU=1O4XcbW6ydQ87=7rk4CBv-GN=-Gp76AUiTDCA@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 25 Jan 2024 at 23:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 25/01/2024 21:38, Paloma Arellano wrote:
> > INTF_CONFIG2 register cannot have widebus enabled when DP format is
> > YUV420. Therefore, program the INTF to send 1 ppc.
>
> I think this is handled in the DP driver, where we disallow wide bus for
> YUV 4:2:0 modes.

Maybe this needs some explanation from my side:
I think it will be better to have separate conditionals for setting
HCTL_EN and for DATABUS_WIDEN.


>
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 6bba531d6dc41..bfb93f02fe7c1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -168,7 +168,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >        * video timing. It is recommended to enable it for all cases, except
> >        * if compression is enabled in 1 pixel per clock mode
> >        */
> > -     if (p->wide_bus_en)
> > +     if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> > +             intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> > +     else if (p->wide_bus_en)
> >               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >
> >       data_width = p->width;
>
> --
> With best wishes
> Dmitry
>


--
With best wishes
Dmitry
