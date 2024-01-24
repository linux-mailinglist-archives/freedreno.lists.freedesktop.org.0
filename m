Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BE83A3AB
	for <lists+freedreno@lfdr.de>; Wed, 24 Jan 2024 09:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D410E99D;
	Wed, 24 Jan 2024 08:01:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4A610E99D
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 08:01:22 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55c6bc3dd54so3768230a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 00:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1706083221; x=1706688021; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1iNsBQtek6e9skYq9Z1rL6ps6zVCkkZxhyX4dVD9qQ=;
 b=u3AbGcVHFSWuXwWXDKMUIQZwMJtAOHd8nC9S+ffxu+QoC3OPL4cC5v1+8q1w88gVc2
 RsiduK/+ryEKTvLfpdYm/ZLQrcIiRL1Idf9rBKmoDvSUMpC70HTvqaXRCnNXpyrDU6up
 hT6ub8cAefnakSGJc/2Ax87tRhTLVsk+Xk76XGZhScoiOt7TzRYYCcDjxSJERwVOyIJx
 EHPl2b7cAw6kONIGI73Cp1UlOcfwVrIwvnlpx7gjjtzIbByn+SDxPDCWDOLibYBYRYIH
 xrp0IrV/LGZLPC5/+VVjEhfJRd+hGqNIKRWygkCkufqOZkHMrF8bZWHB01OLRP6iS1ia
 DiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706083221; x=1706688021;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+1iNsBQtek6e9skYq9Z1rL6ps6zVCkkZxhyX4dVD9qQ=;
 b=Do/RH31s7GhkCcfouI7q6Ch4K8AiIsvQvAjrfVYCgstVhfrh64/dDTyB+pzMC4nWH7
 dxlJNrbRgboea9g9dEeTNYMKFWjCL/yvrnhR2yWNQFWsx+j89ZfnPE5goKY0FSOJqgvE
 4l+d7iXRQ+o5ZCyXkYzjWoLQiu5JCDPyMZSDXQzEFkszWaEEOYDKbMCHeMxp+brSvV8Q
 O9hOm7t96MIq/g9KHFKY99GdjyyXBuGbfoDBQ0HflEtarojmt/CM+BGkre77GnAJFKbj
 7Ag8MMeBYgHh7LlsoSruVlxxFVRMh8zBj21V81i2y7yQ6T6RBU9ygksE4qwwO5q3hrMm
 timg==
X-Gm-Message-State: AOJu0YxpXwjCwxusPDtfFjW8YGTKouotUteuxn0Es+6BoaOXQx532mt4
 RnoRoZUJOU7PBpKI0eEH6rXCvHHvqBtV35nVK3zP783MuIcIBaqYieyOHgPUjY4=
X-Google-Smtp-Source: AGHT+IGOfgJbOSQadnKGAiNooVHILk9J6Hx2PXu43Sowz5rh6eYZpKwjo0pLYhmByPKFPLpipcWFRg==
X-Received: by 2002:a17:906:9c88:b0:a31:2ebe:38af with SMTP id
 fj8-20020a1709069c8800b00a312ebe38afmr355681ejc.8.1706083220933; 
 Wed, 24 Jan 2024 00:00:20 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 cd6-20020a170906b34600b00a2c8e9918casm14572641ejb.198.2024.01.24.00.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:00:20 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jan 2024 09:00:20 +0100
Message-Id: <CYMS0ZCCYW70.2S0E9NYRR6YPR@fairphone.com>
Subject: Re: [RFT PATCH v2 4/4] drm/msm/dpu: enable writeback on SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>
X-Mailer: aerc 0.15.2
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>
 <CXSF8ZPWKRD9.9CMJU31KG4KP@fairphone.com>
In-Reply-To: <CXSF8ZPWKRD9.9CMJU31KG4KP@fairphone.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue Dec 19, 2023 at 4:39 PM CET, Luca Weiss wrote:
> On Sun Dec 3, 2023 at 1:32 AM CET, Dmitry Baryshkov wrote:
> > Enable WB2 hardware block, enabling writeback support on this platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hi Dmitry,
>
> I've tried this on sm7225-fairphone-fp4 but having trouble testing this.
>
> I guess I'm using some ID wrong with modetest, could you check and see
> what I do wrong?
>
> libdrm is on version 2.4.118 from Alpine Linux/postmarketOS, kernel is
> v6.7.0-rc6 plus a few patches for hardware enablement (like display).
>
> See log:
>
> <snip>
>

Hi Dmitry,

I've tested again now and made it work.

$ modetest -M msm -a -s 38@64:1024x768 -o test.d -P 45@64:1024x768

Then display the image with

$ magick display -size 1024x768 -depth 8 RGBA:test.d

As discussed on IRC it seems the byte order of R and B might be wrong,
so it looks like BGRA is the format we get the data in, not RGBA.

Anyways:

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Regards
> Luca
>
>
> > ---
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/d=
rivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > index 62db84bd15f2..3c179a73c030 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > @@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp =3D {
> >  		[DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },
> >  		[DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },
> >  		[DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },
> > +		[DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },
> >  		[DPU_CLK_CTRL_REG_DMA] =3D { .reg_off =3D 0x2bc, .bit_off =3D 20 },
> >  	},
> >  };
> > @@ -146,6 +147,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] =3D {
> >  	},
> >  };
> > =20
> > +static const struct dpu_wb_cfg sm6350_wb[] =3D {
> > +	{
> > +		.name =3D "wb_2", .id =3D WB_2,
> > +		.base =3D 0x65000, .len =3D 0x2c8,
> > +		.features =3D WB_SM8250_MASK,
> > +		.format_list =3D wb2_formats,
> > +		.num_formats =3D ARRAY_SIZE(wb2_formats),
> > +		.clk_ctrl =3D DPU_CLK_CTRL_WB2,
> > +		.xin_id =3D 6,
> > +		.vbif_idx =3D VBIF_RT,
> > +		.maxlinewidth =3D 1920,
> > +		.intr_wb_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> > +	},
> > +};
> > +
> >  static const struct dpu_intf_cfg sm6350_intf[] =3D {
> >  	{
> >  		.name =3D "intf_0", .id =3D INTF_0,
> > @@ -219,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg =3D {
> >  	.dsc =3D sm6350_dsc,
> >  	.pingpong_count =3D ARRAY_SIZE(sm6350_pp),
> >  	.pingpong =3D sm6350_pp,
> > +	.wb_count =3D ARRAY_SIZE(sm6350_wb),
> > +	.wb =3D sm6350_wb,
> >  	.intf_count =3D ARRAY_SIZE(sm6350_intf),
> >  	.intf =3D sm6350_intf,
> >  	.vbif_count =3D ARRAY_SIZE(sdm845_vbif),

