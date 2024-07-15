Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFE931884
	for <lists+freedreno@lfdr.de>; Mon, 15 Jul 2024 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710F890B6;
	Mon, 15 Jul 2024 16:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KeIJ7dlz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D961510E434
 for <freedreno@lists.freedesktop.org>; Mon, 15 Jul 2024 16:34:11 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e035f4e3473so4102047276.3
 for <freedreno@lists.freedesktop.org>; Mon, 15 Jul 2024 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721061251; x=1721666051; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O37L9qZJLQGQMz18TDRSIA7wom9SyLF5AajKEOhKC40=;
 b=KeIJ7dlzkR+XVYbGAYr/ae1svGob5gBw5xwkm8agumhkhTRYcIs2dTLwZf/Y2Ryc3l
 HEMsiIHSbxMO/DuvPa/0ckTU2nJ2+3Sb3o8eR2L8zOPtET4lUCG6WLXcHfKxdv8vrbwy
 bw7mNls+YPB33rBrZya0HUegevMOJWPfLy09srqtTqa4V9Hn0bz1gPRBqRzjXohhinlf
 jxEuk2z5NtuHCvJBA1qwbiArtyaedtRYzW3XK53jnHWvzAwjcwhrnuZexZGpWubsYeoe
 hOP/WaTfrMUlFPNs+TEvFUwE/wJ+3nmw0YYXbehd5aEtBsPSeTkHqiMvhEAM8fLf9AYZ
 RLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721061251; x=1721666051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O37L9qZJLQGQMz18TDRSIA7wom9SyLF5AajKEOhKC40=;
 b=Eu5Xfy8bJemGRAwgRgzWhjxoHuNgRnV4CQHdyMQg7EiDDYML6z3RgIdwZ8I05zyylv
 wpSV/I3wW2Hefjmf9p7n7RTY4/RqPqJByJTdhL37DAM6uijy4+BIJhSv0ChbeayEyH3o
 JxiQya/hQkCzmzRhS5GddjMkp22eegPNH4s2msSPjG9kn0R6VqDkl3LTYQ0PPajY/SzK
 EnPu+YKfwhf10tHxcgKgon+7SJVd3w4jr9eKLSCY3pzaRCaw1MAdp0swbzr4OlFIeXTC
 cBuIIoqZPVuhik7dqW6N6KxhbmdwjzDOTZ5Z1SNY+uXAlfV3obleFoPVfccrO8VkLyay
 cggA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpTBifwBWMpsZfXE0VNt14rsBt6Tf7aIhvX1zVUVYs5LNFf9cArZ59GN/ebmklxExo9O3AjAXnAPMGXdj9GzWNC4QfZ2GlDdCZlUHqMYvQ
X-Gm-Message-State: AOJu0Yw7M08mlWX3702JGhz3k5YIRPpcHmyYnN+4FDtIGl4jXqG6C217
 tcPDMMTEZV3YozxfPSVZGlNJd38VyMHESdN2gBon3/3igb+mh8SimB0EnLNFlQlrtRLKtGS9DCj
 wCtO6cCRKWtlw0i1dKtg2Z4WKfPXuHvYjA5hGGA==
X-Google-Smtp-Source: AGHT+IHbhMbVEZKppzrWbxx+94NB44o9QwSREBMBZsGgAxNmoI/3j+IILkQ8RwefrybDTMBJhqnTa4iV4f6MMeBnuLs=
X-Received: by 2002:a5b:b02:0:b0:e05:acec:fefd with SMTP id
 3f1490d57ef6-e05d3bbdc7dmr99465276.48.1721061250693; Mon, 15 Jul 2024
 09:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
 <20240715-trickery-spongy-c9d8e246b4cc@spud>
 <20240715-stable-popsicle-7c6e2fa76644@spud>
In-Reply-To: <20240715-stable-popsicle-7c6e2fa76644@spud>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 19:33:59 +0300
Message-ID: <CAA8EJppYJuKpsUBhy3qwa684dWdZbp3qZtd6OdCz4YBU1DjYMA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Mon, 15 Jul 2024 at 18:28, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Jul 15, 2024 at 04:26:12PM +0100, Conor Dooley wrote:
> > On Mon, Jul 15, 2024 at 02:21:16PM +0200, Marc Gonzalez wrote:
> > > Current driver already supports the msm8998 HDMI TX.
> > > We just need to add the compatible string.
> >
> > Why is this required when the driver change suggests that this device is
> > compatible with the existing 8974?
>
> (I know I reviewed the binding already, just noticing this which
> suggests a fallback would be appropriate, despite the differing clocks
> etc)

Yes and no. All supported MMS HDMI controllers are backwards
compatible at least back to msm8960. However as we were not using
fallbacks before, does it really make sense to introduce them now?
It's highly likely that there will be no new HDMI controllers
(Qualcomm has stopped using them with MSM8998 at 2018).

>
> >
> > >
> > > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > ---
> > >  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > index 24abcb7254cc4..0bfee41c2e71a 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
> > >  }
> > >
> > >  static const struct of_device_id msm_hdmi_dt_match[] = {
> > > +   { .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
> > >     { .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
> > >     { .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
> > >     { .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
> > >
> > > --
> > > 2.34.1
> > >
>
>


-- 
With best wishes
Dmitry
