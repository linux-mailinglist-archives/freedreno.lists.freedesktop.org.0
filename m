Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2996A5A48D
	for <lists+freedreno@lfdr.de>; Mon, 10 Mar 2025 21:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9977010E0DD;
	Mon, 10 Mar 2025 20:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bdLPKGMy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBED10E2AF
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 20:14:57 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-549967c72bcso3234143e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741637696; x=1742242496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h9ZJhe15SI2R1lxy0woL42QmbLTLLNcrjryXpvdsrm0=;
 b=bdLPKGMyz0wcVwha/SUhyzOt/xFHYFykk0DTL2VljxgIZQAhhpcrSw2A2Py90qcoPY
 unjdB5/qU1nTXN5+3+Ydxl5/JXY13ogjg13EL49YCXHUQBweOKJhi3imb/kCd7qb/lT6
 dg8qJT/gPDzjwRWlUlLaGX7SBEdRsvhsAP54KNrkZMOAJb7qUGBgAag85p+nA5RvDEdC
 fTVEce4/1fdIp309hWihHeU/tn3Jd3qR3atIsXrkT43c27Lj/CzFRTLT4N1GMZzdtosc
 0QHxIPLIEuqDqud2n4g2kkudX7cr29pXuztmx0GGbBNYQDB5FZn3zQmy76DhUNoW23h1
 ZfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741637696; x=1742242496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9ZJhe15SI2R1lxy0woL42QmbLTLLNcrjryXpvdsrm0=;
 b=RF/kf//8pXmd18UlubTvgCSgIPESX599sHwV39cCEN/tl4LJToEO7qNNkENJcUJaOk
 Na57xDYlYpbdgyjxv46FEf/mVf+meA+yIo4VSgxiIX0NWnEpccS1yxNwtQvaQFITpv2E
 66DD2A7kuupEhQTTfo6ejaklk2TYePD+sI0qLkYaNcYXiGkL+f02VUnu8HxTk6sv3lhw
 37+5jpN2qRJewF5ZkhxeoBtYQQqVLY+L1siizsYdAS2COnfZbyrVl4nZeluw2Lg0qcn8
 JGVtfpZis6cGC86uD6qpTz4L1wEhF8JES/X0IDCjBa07SAadpmgDEx7e2nKPHm3OaX/f
 UqQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5r2OvT4dbCJNScVyqJ/PQufTWrZxLSYmqXE6DkpIHp6dhMXM+TWjL2mlKl9Emq1PxutumbrW3HoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp+PUBg7ToUH/HxYNqrXt/6zvhBud35uitnw3+YK7AWsexV5Bt
 OhXIgUw4lXJ5RKWQ0+zgNXhgbq1SSbguX9Zfata3c3vr6GDCuXbgxw409DaF0BM=
X-Gm-Gg: ASbGncvssQiKiN/AYWqc48yLrBIVUtNaH8AxpovSwJ+L/n3wo9qbhZF8H8onw6pZ+i/
 FtrEg/2fDm4+fQ5esLWEf6odxqBMP1PA3HHiTIS3I471lKVlSuVZ8uhgdGCoUX6y3BtaiyJJA+j
 XOej+nynHnQQNk3M9ypBm3DcSdY51+5PkKSVWFBn9ezq2zbIoII5dW2mA5xx3isYiv+0HSQ+sZn
 RgvgFshHtd8pCB4HFnoV1/LVGmK+4gtjs9khLmjLIYy+pUzUf2QmvO1PQT2biGOLr1/iECZdKOW
 67e/C4LlVLXcWyNbHIYiMhh0p3fquw7V+/8X9EOybnEETACKTsyDvadExegRTYiWdIsQLLyxckl
 ymUxAwNiIj9UDa+J+zMCe/bUm
X-Google-Smtp-Source: AGHT+IGctet0tbvnmmVPz/oI5Fqb6I+mucDKMgJv9axzwjfvPetRICONErkndHiBh4Y5t/R08GW8iA==
X-Received: by 2002:a05:6512:3ba5:b0:549:4e78:9ed7 with SMTP id
 2adb3069b0e04-549910d0e7bmr5230788e87.49.1741637695928; 
 Mon, 10 Mar 2025 13:14:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1c29adsm1554207e87.215.2025.03.10.13.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:14:55 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/display: hdmi: provide central data authority
 for ACR params
Message-ID: <bensvtxc67i566qqcjketdlffyrwxcnydwarqyjau6b7ibcq4b@d6d4sbm3rubf>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-1-bb9c242f4d4b@linaro.org>
 <20250310-funny-malamute-of-promotion-bb759e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-funny-malamute-of-promotion-bb759e@houat>
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

On Mon, Mar 10, 2025 at 03:46:33PM +0100, Maxime Ripard wrote:
> On Sun, Mar 09, 2025 at 10:13:56AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > HDMI standard defines recommended N and CTS values for Audio Clock
> > Regeneration. Currently each driver implements those, frequently in
> > somewhat unique way. Provide a generic helper for getting those values
> > to be used by the HDMI drivers.
> > 
> > The helper is added to drm_hdmi_helper.c rather than drm_hdmi_audio.c
> > since HDMI drivers can be using this helper function even without
> > switching to DRM HDMI Audio helpers.
> > 
> > Note: currently this only handles the values per HDMI 1.4b Section 7.2
> > and HDMI 2.0 Section 9.2.1. Later the table can be expanded to
> > accommodate for Deep Color TMDS char rates per HDMI 1.4 Appendix D
> > and/or HDMI 2.0 / 2.1 Appendix C).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c | 164 ++++++++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_helper.h     |   6 ++
> >  2 files changed, 170 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..89d25571bfd21c56c6835821d2272a12c816a76e 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -256,3 +256,167 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > +
> > +struct drm_hdmi_acr_n_cts_entry {
> > +	unsigned int n;
> > +	unsigned int cts;
> > +};
> > +
> > +struct drm_hdmi_acr_data {
> > +	unsigned long tmds_clock_khz;
> > +	struct drm_hdmi_acr_n_cts_entry n_cts_32k,
> > +					n_cts_44k1,
> > +					n_cts_48k;
> > +};
> > +
> > +static const struct drm_hdmi_acr_data hdmi_acr_n_cts[] = {
> > +	{
> > +		/* "Other" entry */
> > +		.n_cts_32k =  { .n = 4096, },
> > +		.n_cts_44k1 = { .n = 6272, },
> > +		.n_cts_48k =  { .n = 6144, },
> > +	}, {
> > +		.tmds_clock_khz = 25175,
> > +		.n_cts_32k =  { .n = 4576,  .cts = 28125, },
> > +		.n_cts_44k1 = { .n = 7007,  .cts = 31250, },
> > +		.n_cts_48k =  { .n = 6864,  .cts = 28125, },
> > +	}, {
> > +		.tmds_clock_khz = 25200,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 25200, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 28000, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 25200, },
> > +	}, {
> > +		.tmds_clock_khz = 27000,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 27000, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 30000, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 27000, },
> > +	}, {
> > +		.tmds_clock_khz = 27027,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 27027, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 30030, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 27027, },
> > +	}, {
> > +		.tmds_clock_khz = 54000,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 54000, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 60000, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 54000, },
> > +	}, {
> > +		.tmds_clock_khz = 54054,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 54054, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 60060, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 54054, },
> > +	}, {
> > +		.tmds_clock_khz = 74176,
> > +		.n_cts_32k =  { .n = 11648, .cts = 210937, }, /* and 210938 */
> > +		.n_cts_44k1 = { .n = 17836, .cts = 234375, },
> > +		.n_cts_48k =  { .n = 11648, .cts = 140625, },
> > +	}, {
> > +		.tmds_clock_khz = 74250,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 74250, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 82500, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 74250, },
> > +	}, {
> > +		.tmds_clock_khz = 148352,
> > +		.n_cts_32k =  { .n = 11648, .cts = 421875, },
> > +		.n_cts_44k1 = { .n = 8918,  .cts = 234375, },
> > +		.n_cts_48k =  { .n = 5824,  .cts = 140625, },
> > +	}, {
> > +		.tmds_clock_khz = 148500,
> > +		.n_cts_32k =  { .n = 4096,  .cts = 148500, },
> > +		.n_cts_44k1 = { .n = 6272,  .cts = 165000, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 148500, },
> > +	}, {
> > +		.tmds_clock_khz = 296703,
> > +		.n_cts_32k =  { .n = 5824,  .cts = 421875, },
> > +		.n_cts_44k1 = { .n = 4459,  .cts = 234375, },
> > +		.n_cts_48k =  { .n = 5824,  .cts = 281250, },
> > +	}, {
> > +		.tmds_clock_khz = 297000,
> > +		.n_cts_32k =  { .n = 3072,  .cts = 222750, },
> > +		.n_cts_44k1 = { .n = 4704,  .cts = 247500, },
> > +		.n_cts_48k =  { .n = 5120,  .cts = 247500, },
> > +	}, {
> > +		.tmds_clock_khz = 593407,
> > +		.n_cts_32k =  { .n = 5824,  .cts = 843750, },
> > +		.n_cts_44k1 = { .n = 8918,  .cts = 937500, },
> > +		.n_cts_48k =  { .n = 5824,  .cts = 562500, },
> > +	}, {
> > +		.tmds_clock_khz = 594000,
> > +		.n_cts_32k =  { .n = 3072,  .cts = 445500, },
> > +		.n_cts_44k1 = { .n = 9408,  .cts = 990000, },
> > +		.n_cts_48k =  { .n = 6144,  .cts = 594000, },
> > +	},
> > +};
> > +
> > +static int drm_hdmi_acr_find_tmds_entry(unsigned long tmds_clock_khz)
> > +{
> > +	int i;
> > +
> > +	/* skip the "other" entry */
> > +	for (i = 1; i < ARRAY_SIZE(hdmi_acr_n_cts); i++) {
> > +		if (hdmi_acr_n_cts[i].tmds_clock_khz == tmds_clock_khz)
> > +			return i;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_hdmi_acr_get_n_cts() - get N and CTS values for Audio Clock Regeneration
> > + *
> > + * @tmds_char_rate: TMDS clock (char rate) as used by the HDMI connector
> > + * @sample_rate: audio sample rate
> > + * @out_n: a pointer to write the N value
> > + * @out_cts: a pointer to write the CTS value
> > + *
> > + * Get the N and CTS values (either by calculating them or by returning data
> > + * from the tables. This follows the HDMI 1.4b Section 7.2 "Audio Sample Clock
> > + * Capture and Regeneration".
> > + */
> 
> I think we need to make it clear that it's for L-PCM only (I think?),
> either through a format parameter or through the documentation.

Ack

> 
> > +void
> > +drm_hdmi_acr_get_n_cts(unsigned long long tmds_char_rate,
> > +		       unsigned int sample_rate,
> > +		       unsigned int *out_n,
> > +		       unsigned int *out_cts)
> 
> And we should probably take the connector (or EDID) to make sure the
> monitor can support the format and sample rates.

Interesting perspective, I'll give it a thought. I was really just
trying to get rid of the duplication.

I think that 'supported' parts should be implemented in the hdmi-codec
instead, parsing the ELD and updating hw constraints. WDYT?

> 
> > +{
> > +	/* be a bit more tolerant, especially for the 1.001 entries */
> > +	unsigned long tmds_clock_khz = DIV_ROUND_CLOSEST_ULL(tmds_char_rate, 1000);
> > +	const struct drm_hdmi_acr_n_cts_entry *entry;
> > +	unsigned int n, cts, mult;
> > +	int tmds_idx;
> > +
> > +	tmds_idx = drm_hdmi_acr_find_tmds_entry(tmds_clock_khz);
> > +
> > +	/*
> > +	 * Don't change the order, 192 kHz is divisible by 48k and 32k, but it
> > +	 * should use 48k entry.
> > +	 */
> > +	if (sample_rate % 48000 == 0) {
> > +		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_48k;
> > +		mult = sample_rate / 48000;
> > +	} else if (sample_rate % 44100 == 0) {
> > +		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_44k1;
> > +		mult = sample_rate / 44100;
> > +	} else if (sample_rate % 32000 == 0) {
> > +		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_32k;
> > +		mult = sample_rate / 32000;
> > +	} else {
> > +		entry = NULL;
> > +	}
> > +
> > +	if (entry) {
> > +		n = entry->n * mult;
> > +		cts = entry->cts;
> > +	} else {
> > +		/* Recommended optimal value, HDMI 1.4b, Section 7.2.1 */
> > +		n = 128 * sample_rate / 1000;
> > +		cts = 0;
> > +	}
> > +
> > +	if (!cts)
> > +		cts = DIV_ROUND_CLOSEST_ULL(tmds_char_rate * n,
> > +					    128 * sample_rate);
> > +
> > +	*out_n = n;
> > +	*out_cts = cts;
> > +}
> 
> EXPORT_SYMBOL?

Yes, I forgot it.

> 
> Also, I'd really like to have some unit tests for this. Not for all the
> combinations, obviously, but testing that, say, 44.1kHz with a 148.5 MHz
> char rate works as expected, and then all the failure conditions
> depending on the monitor capabilities.

Ack for the tests. For the monitor capabilities, let's finish the
discussion above first.



-- 
With best wishes
Dmitry
