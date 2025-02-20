Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C264A3DF76
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 16:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1689F10E064;
	Thu, 20 Feb 2025 15:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UMTbEhMM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7A210E064
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:55:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54529e15643so1985292e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066934; x=1740671734; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
 b=UMTbEhMMUHZ7XKF0R3pF2rA8k5p/7G+quKMJC67geDVIoiV024c/LSv7Q/+0CtNlws
 aZbvzNcMfin4EKm8cVwUiZKzo211e8qVUY+G1mnc5d5oI+yfQsxef89BITK+/UFqChwj
 /e3iXbvr96HlUBvqcjbyw1d8U8O5kTGuZ3SmGVL0jUq6mo0d75oh5QuEMTSryR55zHOE
 iP7g0RtIF0SfMMIiyXPjYMKJRZcboT3d5AcuwQ0dW1IXvtqH2fOC8cZvVKmWnD+FQ396
 CqbY2I4nogqbG2u/HcKKUyWS7rN3ER7zT453+4g7z5JQK2s7XtV8QS0MPzBYksKFR+Ok
 X27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066934; x=1740671734;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
 b=LKtHIo+RWi6/ktdIyWBiAMFXS8yhi2XOYJ5VlfbfSC6MLFA8WQPgWd9LkWk2Gwgah0
 JPHcxJ/u9Obub90dQTJLMTqYYmZyTwZEHdlVvUKHK+cyWVHKrlie/psIyyMSCybzqgOL
 I8Qjn8TlbdqZ+1N4B9YBMSqBxOGKUC0lYeb9TerlvmjFvqGqIULBhxQJmJ7WDTXyeu78
 wTWKmLkxKAQJ/0+PO9pFsy/bcXuYqKqNqnGzBTqLg/CDC+CtKeSPGq4eBzZvzoa+z6FP
 rlnXVC1G/GnwR+1NM9lP3BV2rd3V05INyKZyUHkEWQx7iWkiJAfCLOSTrylvhWG1KAwn
 Lt6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqBNP0huDrPGy1Ahx7fV0apIDznOVMNf8DZuV7bjMGq4VaItxyutbp/wMq7JEEsciss1Wkvsyxq88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+g70GWEMkDWHlRQ10ruzCQPMNG88JaeuudYoI97OCLATuMfrT
 6hs84LF4eElC5LNQgcSvZVvV0gW09VJqdJF6OanJGS1uUwNJtIf7ATqVO5ywqHU=
X-Gm-Gg: ASbGncs+CROhbRWfvNpLhyi+p8lFaDhcsjbJC070Cx0Z8mu+wQTtwM5eGJBNNlJloow
 e0dBmfN3NsnJer1nLFEGYUZ4yEc5aykDLXsvk9NtbfaxUrk3myFYqzWKrhPvuPou0CHsdxBQ13G
 ULoyCF8SJcTxntcetYJgJCO7apTJktF1wGkpMwGJf3fHH3EP1wnH9TeUms1vMhrZndhn40Be6TC
 jHd9pECeelWkfQC0EpYVf+rE0DE9qa0XLK7maRpqPnyVxT7UZdp/7WuvNvV25VTwoZbzDycZ5O+
 mQTp2Wts4THd95M0UjvHkdEK0X6SZ8V/LjD5coi/x24GivGvD1Wm2LfOnZPmoyg1eQnsCd4=
X-Google-Smtp-Source: AGHT+IEtf97SsjRtuL6d8IE3D1pgFUBRXbcvvxV4g3GwdxhA+EzzwQ1kj3+RIrBDm6cRLGQC3ggahA==
X-Received: by 2002:a05:6512:a90:b0:545:fdd:9ef4 with SMTP id
 2adb3069b0e04-546e4569f20mr1523857e87.8.1740066934306; 
 Thu, 20 Feb 2025 07:55:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461f6448adsm1414735e87.70.2025.02.20.07.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:55:33 -0800 (PST)
Date: Thu, 20 Feb 2025 17:55:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
Message-ID: <xmamjbm67hxxmzwnilqwlb6esbpf3rtxayitzln4lvwfl4ok3c@7g6gsyp36f6y>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
 <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
 <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
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

On Thu, Feb 20, 2025 at 11:45:18PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:27写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> > > This change originates from the Qualcomm Android Linux driver. It is
> > > essential to support a dual-DSI configuration with two panels in
> > > some circumstances per testing. As the name suggests, this modification
> > > may enhance the bandwidth robustness of a bus.
> >
> > Please start by describing the problem and the result of the changes.
> > Otherwise it reads as it "may enhance or may worsen" the robustness.
> 
> OK, will re-test it with older branch. I remember it cause LCD to go
> to black without
> this patch, but not fully confident with my memory. With latest code,
> there is no
> difference to have this patch or not.

For the reference, this is the description from the display drivers
techpack:

    disp: msm: dsi: Adjust DSI priority level

    Sets DSI priority level to 7 before any commands are triggered.
    This DSI priority setting is recommended by systems team as DSI
    and Lutdma uses same Xin for fetch.

Maybe Abhinav can help with the proper problem description.

Also, see below.

> >
> > >
> > > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
> > >       return ret;
> > >  }
> > >
> > > +#define DSI_VBIF_CTRL                        (0x01CC - 4)

Register definition should go to the dsi.xml file. And anyway it should
have used lower case hex.

> > > +#define DSI_VBIF_CTRL_PRIORITY               0x07
> > > +
> > >  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
> > >                                 u32 len)
> > >  {
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > > +     const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> > > +     u32 reg;
> > >
> > >       dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
> > >       dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> > > +     if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> > > +             reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> > > +             reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> > > +             dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> > > +     }
> > >       dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
> > >
> > >       /* Make sure trigger happens */
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
