Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767AA3DF0E
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 16:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F18510E191;
	Thu, 20 Feb 2025 15:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CWGqHfJY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3A310E191
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:45:31 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6f6ca9a3425so9231837b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066331; x=1740671131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=caj6pSHnNXWHcTKHiPPWfy3wKXfZWUVBt2Cq5t/KZXw=;
 b=CWGqHfJYbGyBizisArfd7fwAXwvqBvXGwWTFGyxi4ThOnQHIE1UvXuDb9cjbqh4MMt
 2UglW/SjpG1y/n6iI2Rht/3XVeV/Wd9IzURb+pU50rkKedUhPupbgKCr6wfLbBLeIqvg
 npmavuWe60tXB1Mcb86pe8u2E5G4krzHj+UzyRwONR4edH0ajRBFJPvVXZMjMpBRFo9f
 mE4RsemyyUnH8KbDC7l8jL/p5pSowltdyJ+Rbyyr2/zRAxzvRqVnjJdtVaILYAdsiC44
 rNehYh2PYaRXmytISQpxnryNw27ulme4LkvM053Ghtycq1aw124ecQ+rEJE3I6vSMh20
 6qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066331; x=1740671131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caj6pSHnNXWHcTKHiPPWfy3wKXfZWUVBt2Cq5t/KZXw=;
 b=bUYAUXlSZPfIeMmpW0Orbv2URRVdBrZW19hwTEcubwDmcflIjtej/Ch5gYysG4tYMH
 90QAREW7B6Ihg0oIVOt2hk64EIxE22rAWnImVhn6+xnMi2DAXCdTMe+gCeYHlhtMUbJv
 7+egvMIhhGfq3hrifc7OmJIv3c5gHyonHojMr1KvyWMtxpkNtTItVCIfMlZBZie+TnZx
 8W26dMF6IG7iL+V/4MmzErwfUvjMuXixP6DyZ5VZnTb0p0qnmGlyIx3tR1RSfk6NCzhY
 1zD0Mkc4ftucs7+/vFUMtX4BeRchOSfcbfAqxn8qjXRGml6s3IGIU7nL27V+38Rkgl01
 e5KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFhxtnAqLvQ1JYVI6jNf+6gg7QRTHhi0f+lL86aLKdEgxoGIEc0XdGy5KXk6QPFCoyAeFURQpBt04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRaN703Ea1Fu9/djwGTn6yyXhqNEpiu+Rw8c4RB98x8lJ+VvE2
 qiYlKKdGEOmuWPsi9RMc9HEjDWCdSNctOElg2E1OByf8mPDi5XoKKYO/4GY42Sp88SG57BSfFs8
 LZuU2zmDSVH8sRdP3obZmB4CliR9GySddJRVjYQ==
X-Gm-Gg: ASbGncuPU/CDh0nD3oH1785cQUVmUBu9crG784Y4W4PiXKrlncq3Ih0PBj778jNKhfj
 GwNQi3MJAS1pcb/T58qe950KA7kUIIWU0SOphCeRGWQ7uKRNODG29+mHxCXdfIBlMGnxE2+cYSx
 YZ
X-Google-Smtp-Source: AGHT+IFG8SQEvQPyPA1X148UgsKK5bEmhiv/YocBv364w+iyBZWcNKIHT7rnzjN/l/ohIkB1RhFxo8T7boVqG1XXrxE=
X-Received: by 2002:a05:690c:4482:b0:6fb:9822:bbd7 with SMTP id
 00721157ae682-6fb9822be7dmr102049387b3.15.1740066330764; Thu, 20 Feb 2025
 07:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
 <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
In-Reply-To: <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:45:18 +0800
X-Gm-Features: AWEUYZmYsYjKrn2CbJfu7EO98jbyUBGJnmOHIdlgcyPvmpQCuWq9GXUcgPDpBig
Message-ID: <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 18:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> > This change originates from the Qualcomm Android Linux driver. It is
> > essential to support a dual-DSI configuration with two panels in
> > some circumstances per testing. As the name suggests, this modification
> > may enhance the bandwidth robustness of a bus.
>
> Please start by describing the problem and the result of the changes.
> Otherwise it reads as it "may enhance or may worsen" the robustness.

OK, will re-test it with older branch. I remember it cause LCD to go
to black without
this patch, but not fully confident with my memory. With latest code,
there is no
difference to have this patch or not.
>
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8=
e3ff395486c0b4898 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *h=
ost,
> >       return ret;
> >  }
> >
> > +#define DSI_VBIF_CTRL                        (0x01CC - 4)
> > +#define DSI_VBIF_CTRL_PRIORITY               0x07
> > +
> >  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_=
base,
> >                                 u32 len)
> >  {
> >       struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
> > +     const struct msm_dsi_cfg_handler *cfg_hnd =3D msm_host->cfg_hnd;
> > +     u32 reg;
> >
> >       dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
> >       dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> > +     if (cfg_hnd->minor >=3D MSM_DSI_6G_VER_MINOR_V2_8_0) {
> > +             reg =3D dsi_read(msm_host, DSI_VBIF_CTRL);
> > +             reg |=3D (DSI_VBIF_CTRL_PRIORITY & 0x7);
> > +             dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> > +     }
> >       dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
> >
> >       /* Make sure trigger happens */
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
