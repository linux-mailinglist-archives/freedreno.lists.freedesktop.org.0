Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7C9B9AD1
	for <lists+freedreno@lfdr.de>; Fri,  1 Nov 2024 23:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53CB10E03C;
	Fri,  1 Nov 2024 22:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LyI7rF9x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5969610E03C
 for <freedreno@lists.freedesktop.org>; Fri,  1 Nov 2024 22:26:50 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso3220145276.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Nov 2024 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730500009; x=1731104809; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
 b=LyI7rF9xn6c8shnt4/PQ5gYTS1LzWgZyuRLVPWcZwVET2lL8IN8PN7h0ciy+lsEtj5
 Wp9BaYqBwxKtfuS7skL4x0xHY9APaaY/vxNLT4BafoOsx11ONb9zco2rQHMZSpaFxpIs
 /0NkrCEPD/g/HdspWTWdXt1MFOr6Suf0SOsobNMEH/zAsYxV0xWYKeL834Y8ntDHRgaR
 HgW9vNO9Aa++i9G+uKVSKgVv0gohq3KZAxMM8wRnUQlSoXQKY88oGCuSAcOjTb+cWlc2
 priGNADiOysVS0BSNUmc+l/zmEixMV4bLLjNYgTctDkHCk35KRWSu5oa8fFSv2yeXidg
 K4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730500009; x=1731104809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
 b=gi+KJoxNCGKkngg9EeBjRwTsRirg4KsJTd5pG9XdySCxNfCrHBmaSo5Szrxfuyse5w
 BRVqa4tt1rtLMnU/J5RTXpG0m2qhJK4EatrGF2IqQuEz5Xr50LSG8KJ41b5Lg4Xlbgc2
 GD7MGpOEd2QTD5YkTMKpJVNKe7tY1eDAmbbVFd5k/sY2NTPRQmRcKzZkKK0qvXC/8pep
 hwnTzQvs25mAqFyJuOaM3EwFbaiqK3lopIcI1MTEPerU1OrapXxP5qjha9+oGiHyEkVg
 Vlf5TqkEAMBOt2bmpUlElprrrJAlLyzPs7RrmVHaxR7QOKaj1JN+2aKRBxGG8m0e4xQB
 sATg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3XfQbHcJ8LZWLwB71+Nc3GWRpWbaxPsRuH1T8cPhepkNz6SqOeeOe1rab0vhBpwTlKeA/0GNgUqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy9wGkipUBB9gygzNr/tvxCro/3NGpzDXmDeOjlND2LUWP/ay0
 aFNdS1pJ/uVkBn/ac6eb4jqc9BbbEB0w3MTDT588aiK6P07kdp0EaTnLTtKG/o6jyqBlvt52lU9
 Nrl6YyT4tdeJc6/AOaJHXBsH0fNZzJb/tixIOmg==
X-Google-Smtp-Source: AGHT+IGtriCDF4xwF2pEv4oKmK1IxTM5b7GjmdDA6xwQNU8GyukANzaIo/LVK5L70uLC6wImMimFPrxbBm/wgfMeDA8=
X-Received: by 2002:a05:6902:2182:b0:e2e:46e5:c2ca with SMTP id
 3f1490d57ef6-e3087a599c7mr22672334276.14.1730500009290; Fri, 01 Nov 2024
 15:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
 <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
In-Reply-To: <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Nov 2024 00:26:38 +0200
Message-ID: <CAA8EJpps+spdowEbDoO2zNfyn+DnWwPgnZiFMw13ZE=iAnJEnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 1 Nov 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> > The MSM HDMI driver supports interlaced modes. Set the corresponding
> > flag to allow interlaced modes on the corresponding connectors.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 4a5b5112227f..643c152e6380 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >       bridge->funcs = &msm_hdmi_bridge_funcs;
> >       bridge->ddc = hdmi->i2c;
> >       bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +     bridge->interlace_allowed = true;
> >       bridge->ops = DRM_BRIDGE_OP_HPD |
> >               DRM_BRIDGE_OP_DETECT |
> >               DRM_BRIDGE_OP_EDID;
> >
>
> I had quite a bit of discussion on this internally because this spans
> quite a few generations of chipsets.
>
> On very old hardware, even before msm8996, there was dedicated hardware
> de-interlacer. But even on msm8996 or other HDMI supported chipsets
> where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is
> present, these were because its carry forward of older interface code.
>
> The way we handle interlaced formats today, is software needs to handle
> the part of dividing height / 2 and width * 2 and adjust the source crop
> if necessary. This part has moved to userspace for recent chips.
>
> Othwerise, we will need to add this part in the dpu driver to adjust
> this. I am not seeing this part there yet. So may I know how you
> validated this change? Something similar to :
>
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340
>
> If we add this part first to dpu code, then we can mark interlace_allowed.

I think you are mixing the interlaced formats and interlaced output.
The code that you have pointed to is related to hardware deinterlacing
- in other words taking the interlaced framebuffer and outputting it
to the progressive display.

The interlace_allowed flag controls a different feature - filtering of
the internalced modes (aka 576i, 1080i, etc). In this case we are
using progressive frames, but the HDMI outputs a picture as two
separate fields. I have validated this by outputting image (modetest)
to the external HDMI display on IFC6410 and on DB820c boards.

-- 
With best wishes
Dmitry
