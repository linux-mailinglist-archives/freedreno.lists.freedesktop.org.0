Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rWHbG9jHq2mZgwEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 07:38:16 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4922A626
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 07:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5510E34D;
	Sat,  7 Mar 2026 06:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iG5/fmIh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B910E34D
 for <freedreno@lists.freedesktop.org>; Sat,  7 Mar 2026 06:38:13 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-56a9c5cb48bso3472456e0c.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 22:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772865492; cv=none;
 d=google.com; s=arc-20240605;
 b=VcnZ2Gw9pHfPeQdqTUvDxaWp3mODFNuY4QIg4OaxiFdLYEdteDALkyUNU+FdpmfvxE
 CaWHaJhDAjV0f2RUJh+roT7lqOhuco06RnqhYvYAUmtR6YPmDRCsvlvNaT1jAQB080H5
 GBgZShdzd964iJ2U70wcQColHCRdRIhFDXWnFkavxMiaqOE4Ph6HATghfCkpuSki8pBb
 w1wK4S0zCYqvEunk/UFZ+8jvLtyALrPT+o5FSYjv6zN32Ug2M/wxRn+tZgUv/3dipIzS
 vuQsNvy+frCUUymm/0Kzispl4avxGMjpp8xQD5abLhVHTCCCrenHcxA+zKyd16P6CNhn
 8Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 fh=Ev+nlGlEQ1W77RL95Y+MRzz3KCEfJoeNZ7kjzd/YIWI=;
 b=NDlCIZUqJFUtMUiLefMz6t9UwEGUWz9otFtCkLMJXMT6LgNxXsSkEAv9kN07NC8E1F
 lxTuDBYo0wmTkTulx8EU3g3hxlmXmdEwBbP4r6qjXBrmgW6wmE9c/EsoPn95k3vj1LK2
 Eu+ukeWC4XlvUW3Q+gL2bgtpofrn3Z6K4Nf1UWOwZZcRg5FkeqB5gs2QYMr7XmwnVAlu
 tqvOUWXZKqi6P03afy4o7aABHT1rCoErsexFHlktH8pFepDbZwOVSHV18FrvSLAp2Ru1
 dnTfSI85RKzIdqk0sGDos5Qj4zLSxUkqr2leyxHZ2sl0z/vbukyWSgpnNTUaLP/N9YF8
 i+Uw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772865492; x=1773470292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 b=iG5/fmIhi3QVvgR1mjnK5FZrGhE6yelqKRAwIEglzWUd2zICktKFifY37PKHNTW4qa
 i7EXSPkCiQAnsC+jlmmVwQn/Je0kW8lFsKeqPe2G34Al21i//JmThZdDcYNwnrzMZJu/
 lCKlXWIzdWONxsHAM1Z52FRSo0xTkR+hpsuqf378Io2rlAUhN+NMlBSCAXuqwpLBmfjB
 Lse+CBmRu3EukXFdNWA4o7WVm2UqehIw/HzJJT7rvpED/Trn5Y/wgZ2BzmndBi3OUtTT
 gSrxcJXtlkyRRl0WGjtTg+9sHfN6IJapStsBLVEqVNivlKIkZCGMO17GjRpakw7V1QAg
 se2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772865492; x=1773470292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 b=xBf3NY/TINl3C51V7QZQdLIRxpCQPySOHWrDBfSQCOZERyabD5kV6ZXGEMHxEvIuRX
 HzBDyM3Q/eLmFY2i/1g3e6ZwvJ6n4kr1TSqqQt5ecntj9tYhUmon+3nqCAIWLG0z41oA
 nDehEGFkVu3hdzuCSmS/5Ul96Ej4FNnX3pFjGtM4TSIdO29+aB53WyO6niT/zjPnb7wz
 +cUJRWWN9ANLuOZwxZb11BZCxY+n8VyAWPvBEdRVifNSla2OCC7dSPg50Upw+18YfCGE
 4Tatf1RF/UkWubcTQwYQjLM0+nJEFRxfzzMt+2WyY+ie4tD3NGvJ/ojlYuklg3TSDOr1
 +jdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1GBiKFTQoePCZpEXJSnL8C0T6oZEAayQjbtW0uvB/6B/NMuWSWD0VwerGB/Nf2FfjUnMF1N74JgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1NRuyD8+uU/6Mw+zc70RIyTr8ddm7zvRmw6f0x+MP4IQzILsO
 pCnAhaMjbNE308aFP+VZFgm8n/0mbLITrqDUEPrjInSMbhybzcSRyJgWIqPoxFfdLbjOkJyl15R
 PYoQfcX9dL0VQEJX+uamuYkHrwVYSlIQ=
X-Gm-Gg: ATEYQzwOo5r/vU1IHFogNTygt2gBiIIPIlTyOVQqGuG567IeHatKObDSxR01/3gfP8z
 qPn7QHV2BZDqk/nwTq+/5mq7uwDFAupBER1BcmJL7+0rQG+XF4gQiRzxH/sTYtv8GzkvRV51SpR
 YCFSFKemnC8hBS7hwQRbTvvJbZe5yC4wSNs70+ccicEHuk4jpPNj3N+q3x79TUQ4HGRa/wnMlRA
 N9Q15wz62tbMJByJePzBLC5jaXICjWtD0rRkOBZKqctz9lw8gZlsmkKIPQVoXPQbuAqDc5ABErN
 NC9PzMmX
X-Received: by 2002:a05:6102:3a0b:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5ffe614cb63mr1619980137.22.1772865492332; Fri, 06 Mar 2026
 22:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
 <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
In-Reply-To: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 7 Mar 2026 14:37:51 +0800
X-Gm-Features: AaiRm51z5Jl0rIbfj9Qhdy98oqHJyd1EH7rdlZU1JRZ1VO1ldASebfgwROZoW5I
Message-ID: <CAH2e8h6zQRi5XKLpb5bnQAdamc9qp06PvUU=AqVbtOq-g4OTyA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Rspamd-Queue-Id: A7D4922A626
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fekz115@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,jiaxyga.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sat, Mar 7, 2026 at 4:20=E2=80=AFAM =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=
=D0=B9 =D0=9B=D0=B5=D0=BF=D1=88=D0=B8=D0=B9 <fekz115@gmail.com> wrote:
>
> Hi,
>
> I have a concern regarding this patch. The Nothing Phone (1)
> (sm7325-nothing-spacewar), which is already supported in mainline,
> utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].
>
> Currently, this configuration works properly. While I have encountered
> minor graphical artifacts during brightness changes, the display
> output is otherwise reliable across all supported refresh rates
> (60/90/120 Hz).
>
> Since this panel is already upstreamed, this patch might cause regression=
s.
>
> [1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm732=
5/blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetre=
e/display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484
>


Oh, I see. I messed up bpc, it is fine now. Recently, encoders have
supported src bpc > 8, dsi don't support dst bpc > 8. But the nothing
phone panel does not require dsi to support it.

Since the panel is a 8-bit panel, and src bpc !=3D dst bpc. Although they
are equal on some devices(they are, on my 8-bit or 10-bit devices).

i.e. qcom,mdss-dsc-bit-per-component !=3D qcom,mdss-dsi-bpp / 3

Please ignore this patch.

Best wishes,
Pengyu

> Best regards,
> Eugene Lepshy
>
> =D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dm=
itry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>:
> >
> > On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > > In upstream the msm, for bpc greater than 8 are not supported yet,
> > > although the hardware block supports this. Remove them until we
> > > support them.
> > >
> > > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits=
 per component")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > I hope Marijn, Danila or Eugeny can comment. The patch series with this
> > patchset added 10 bpc panel and used it for one of the phones.
> >
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm=
/dsi/dsi_host.c
> > > index e8e83ee61e..b60b26ddb0 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_=
dsi_host *msm_host, struct drm_dsc
> > >
> > >       switch (dsc->bits_per_component) {
> > >       case 8:
> > > -     case 10:
> > > -     case 12:
> > >               /*
> > > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 blo=
ck.
> > > -              * If additional bpc values need to be supported, updat=
e
> > > -              * this quard with the appropriate DSC version verifica=
tion.
> > > +              * In the upstream msm, only 8 bpc is supported for DSC=
 1.1/1.2
> > > +              * block.
> > >                */
> > >               break;
> > >       default:
> > > --
> > > 2.53.0
> > >
> >
> > --
> > With best wishes
> > Dmitry
