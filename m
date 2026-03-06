Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DDUG0c5rGnAnAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD822C36C
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009A910E431;
	Sat,  7 Mar 2026 14:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ckHhBA9o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513E110E162
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 20:20:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3870778358aso105073061fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 12:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772828399; cv=none;
 d=google.com; s=arc-20240605;
 b=U/Cq2g8W/u+qHNblR2YuWhxAFHh8YuUiFBPYWfUsgdbsPSjg/XvbdYygnPTOCsoq3K
 AqbMHNTeohYRPPG3NCJnURG0NgWdX4hvLdp7OjKfpCkrrriXyCf0ld54Y/C8sCgRyZu4
 sN4vuepb3PUlYI6otfljNQw0z07p1pbIvS5pJAvgZvwQcmpoIgjBdaj1djCwu0FOGTFJ
 WLKUrA4OsSk2CKBEphF54AprS9pKCje2Iz8n5txBAO4cpBoMu/XR1NS4sxJvm6ddfarc
 pW+ocH6QZvo7wmpilkMtbwnc4VIr0Y/8LPPP3pEFnsNc8Ac6hKDaLs815eIHWjfT+aJR
 pAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 fh=7/ONCva0S+KDKJZgGT1ssj97RjSbcHNXr5JxjrQaR0Q=;
 b=XtF90wz/ba5Ftzcf0VtgcmvKNFozVWB4BswX6FlMuRrym1ixT+nUleXSlRfMFdv5dE
 jhyHoLJg3jBo2Ju/9HFQSBICIxsYYNf0tVxVGqguUKn/82FFJf63ac9+gsnmurQ+0aWB
 Aw4Xui4R/A541C/NhkLw9tyrmfAdd90S1vK5tJWW42jyUmjWhYrZznbishYbmMe2Apq8
 es09PNO/Mdka0kJhSgICBVQ0FlWepq9EmGX0X4TyqHCcUgoutddi4pxytQI4pz3boUWG
 4S2eogJNXSXZQ734OzRUavAwHZ5ASPMAX6U/HI/S6dHd2OiQZk8+DR6xHFq9oSanN6M0
 YAjA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772828399; x=1773433199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 b=ckHhBA9o/7EHqg5K+y0fgp1JjQRjz9xQmxVOqd0HrTHcIru0HgV36X3hvRaW/uIGHR
 WQxriGT/AWVE3zzEghzOs552S9dd247z//4NsleiGzhVzDVT8W3h4x9w8wUgh8Oy3SCK
 ljtmmDtKORjodwyTnUyMyJMXWresgTLFyn9E0mp8hGnnP+abGsjjhWS6T2mpYyCCKFVS
 OkLJC+jFTPv7x+mG/pDeOTm1fEG/4/JZhkZ95eiXn1oNz/tQVfOPaebwdc+Kl3WuAA8W
 L1QWKIpmQ2KGbHTXYxmXvzBMDJWV0Y6g0rfJe4Afa+jiS515cf0817HpBCKIEmK4/Azo
 Barg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772828399; x=1773433199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 b=r4DqfRYk7s1gqFABaSm8BXsU1cK4cGTwLpLgPfuzOSQwxTn284chiU5OS4O3dzL0oI
 RHNR/9JDSeQ1JSiY1eQjQGKdAcCbOEt0PXpoMbOIbyurCFzwEC/Gi3MqqkmNmM97GgQG
 HjfwSCCol83rxVs6wYquxdS8jQB48fj/EP/jAv3hclWkFRJR4lVdxNxSnO7IRkviOdfe
 OOCm3KXzcjWYMhVYDIYutn2ZprvDwZLUTrTFtx+dxrMAj2Kat1CjMwlZNydBDEvkx7xG
 4vue5avt/9dWWSyJPFKqJeu15WSk4MOz96KKLtqy1zM8arRowsfnYNUOjL2YYmEpY+ho
 G3wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX3qHe1LqLjEF5dLlySCaqVzdmjblUREsgPdBQSvP84MQs906+VRHfy5ydiGSv+1F8aPNSuk5l4nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWO3fnVFq38b3wxwC5oIUWWxSoA+YRPKvRRKNYthO7miJEtiXm
 iWixz8T1c20bsGgO7JBkUHeeSmlwkp7q5bhamZYxanxcmIgJQXbWbjzRGOARngnx0HqcXNL2QOC
 DPHiiy5/BxqFxQoRl3png6D+aDLQx8AA=
X-Gm-Gg: ATEYQzyQiLYfD7qF5yR9+OOiPuJdmapRzjyztjiKvRoP9WfR5BKh0znWfyoR3vpSlga
 2IB2fhLLwbhiw3VUxB5oLAQDg4kS8jpLR3l3rST1jH1JSyd6eaEZ9CYcebaZ6N3Wsszi8Ynm7Mw
 9zMMnZUyJxAS5VFeIQ6GqT6/vjOPVJrdG9XgCfSdCNzxGz14pqdLE++3jFkE/PCrf2XPi/kHye5
 1QfAO+Id7YELdUZqHw943hBR3V2CEsLD3BUSzn6Wl1uUDiQ2EygeRlC7pjT8y3R4ranywLp8QCn
 2kWiZ0/w
X-Received: by 2002:a05:6512:39ce:b0:5a1:2738:faa1 with SMTP id
 2adb3069b0e04-5a13ccaff75mr1211409e87.17.1772828399265; Fri, 06 Mar 2026
 12:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
In-Reply-To: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Date: Fri, 6 Mar 2026 23:19:48 +0300
X-Gm-Features: AaiRm50OyrjTonmpW7cWhh3JWqXbBdsWbzC6qs6eblkKyDIRpVR1vHGgUauyhIs
Message-ID: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 07 Mar 2026 14:42:10 +0000
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
X-Rspamd-Queue-Id: 06DD822C36C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fekz115@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,jiaxyga.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fekz115@gmail.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

I have a concern regarding this patch. The Nothing Phone (1)
(sm7325-nothing-spacewar), which is already supported in mainline,
utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].

Currently, this configuration works properly. While I have encountered
minor graphical artifacts during brightness changes, the display
output is otherwise reliable across all supported refresh rates
(60/90/120 Hz).

Since this panel is already upstreamed, this patch might cause regressions.

[1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm7325/=
blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetree/=
display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484

Best regards,
Eugene Lepshy

=D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dmit=
ry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com>:
>
> On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > In upstream the msm, for bpc greater than 8 are not supported yet,
> > although the hardware block supports this. Remove them until we
> > support them.
> >
> > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits p=
er component")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>
> I hope Marijn, Danila or Eugeny can comment. The patch series with this
> patchset added 10 bpc panel and used it for one of the phones.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index e8e83ee61e..b60b26ddb0 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_ds=
i_host *msm_host, struct drm_dsc
> >
> >       switch (dsc->bits_per_component) {
> >       case 8:
> > -     case 10:
> > -     case 12:
> >               /*
> > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 block=
.
> > -              * If additional bpc values need to be supported, update
> > -              * this quard with the appropriate DSC version verificati=
on.
> > +              * In the upstream msm, only 8 bpc is supported for DSC 1=
.1/1.2
> > +              * block.
> >                */
> >               break;
> >       default:
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry
