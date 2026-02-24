Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMO2NYdGnWmoOAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 07:34:47 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01D182773
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 07:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E5510E4B6;
	Tue, 24 Feb 2026 06:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/XBPJGZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8BD10E4B6
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 06:34:44 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5fdf6ad2517so3311214137.2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 22:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771914884; cv=none;
 d=google.com; s=arc-20240605;
 b=Wx5Es0fttFF4/PJX52Y6zbS8efnlCAxaUFzdMQNiGRICrsmvqHmFUAbYKrJp+YfhIa
 kO7la1EAglithp5mL7Rd7Bg136u2TcPc2aezKazmCLqhN6criD32VBEVMVho4nJPX8jl
 hqGqW6a0pakN/cl1IFrC9g7P+VxCJn4tScf2i9CGPieQ6LbDsRsNOHmnUwHqRtJALraP
 /K7kPRkZQ0+mmEhJd99MZ1cZR3271rUxaSym45gLiVYLRxX/NbYnrXSc2WiUVlM2ATNx
 q+//jw8tIyH+jwMwrVPdF4AHWcIFSayn1WAMQ6Bxmak7Fyu1uti5GhjYBh8mf+lh3xYC
 Dmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 fh=/QXajgvjT+g85KrRUfPKkv4drLjKZ4X9yVqmQAoA+cE=;
 b=VjNVr6SVlb2KEIBETus284Zz3vPrYtD6aZTwfQ1fgAwBNf48Jsf0gExgFLESV5Hsds
 ctIEtGUc7ikdAvEmC0mSvMMh/SplsywurzNxF+wqIW3fHIx6bRCY9x2M4ESnve2zLMAe
 4U/8Zzl1C/tzJAknmQJWb0xC2f/p3C8P7j2qrqrcUJC1ZhKpHGbfcJx8tY5T55Cy75HY
 uXPbJmc/3ayWOXzuPQ00R3FPHs/C43JRw9toggSA4JjF4Cg2XtZXlo0WLOpYvWY+dLJF
 4LzWED7ui1+7Z74aoqbuLF+bD97/NVaDp0gkwu5MhFYFFjLH5xEhwZ3XGgF546mSy/Es
 AdsA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771914884; x=1772519684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 b=k/XBPJGZTkzV8bC51epwE9oNEg1kXQeAD+utA/Wb2bXeqBssfaae8/blNPGLrOIsTO
 nnaOJe4S5kBJnf5lUiSztLquCnlvZwmFBg9BFOYfueIfCtGuZrBrXucsI/HdOG/eAulP
 cFFG8/cs8x6BYhFdQEYFx+GZl0dDOD0d2Li1l5LdQXbT395B+IL7s3qdk3z8wbDYUsgv
 I7KJ4Fqngsir5Sn8YE4pAz+InJKp5YWBWPw+tLRAdhaw2bcYXio/Nuw71B4cU8BW+Yci
 qpcXKJlbv1gkpLZTW6oeJVyqZtdSd/liugOWA5Q0EW9QRLYUuANRlx8hBWo6ibEfFs3O
 xyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771914884; x=1772519684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 b=g+glFE93/ozoek2avjQZttHkSv0MSETorahO8I8sGBgloeb9xzApPsBuWmZ0soEx/J
 pF91T8s8vYed3hi3oXJQEXcS/J2TY/gnz1JtxlMKfshe5JxkE0/XRrIpVe0RKIPsZ+4Z
 YC35JJVi74v0sd408cz7XIfXHmTetO+/fRHC0qBmc1TVjCAG2Mmm6TrJ1xQI5w9nZnKG
 OfJcJyJwefEWXmIA2s8fbL20wRZUOkAJozLhpFCXYxv9ogugzX/YM+iQQDtcni0jZ/6a
 PxAZn3+B2WzZogosngGT6cT6Ax9j8ceVeaoJAafOh+Vis7Jv9gzUPwLKB/FmsDjKaDoK
 VJWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZW3Jpu8fTT0v37lUZ0OPkW5qyzWsrl8IFEDErZsUHR2Ghra3Ok/jLU4ZCTukL46dn9bLLI2m2LBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybM8fprVCr1xCoFowWgdJZ9Xc1/8bud+iN63CEL/BZ65A9ST9s
 l4TYIK2ixkCvenemMBoBedNIBac+9jzZXyBjBHxSaj36/gK94TnJsQ3qMFhq1tqjUkDgnSI7wPe
 Gpqg/GTVTVw669hojXa0m9wcUFB//TR8=
X-Gm-Gg: ATEYQzyJ0NvB12nQOVRZsvTT7lo/XoQf17SA+lomhurDrlwEhEO5QZ4Surv1R50FPop
 KOjpay7tX64rAdUX+sinCvQ+89WNZ7HNea4C33lVb690G3tr7MDdbpWwkb8KJmNwYEsurIH9+rT
 +tC6Ooyat/FvmkPcU+y/zGhjYUkxqp/dlNbX70B899XrrszmrJpSbVwRoFMrBbeaOliyvC767QF
 yFNbuyX/Z/FlQXhsWPcppb6y3e9oEqX10XU6eJ9ywL/4S8+TDQaJ9Xe34qQOPb9u+/fHyDrbS6z
 H5jHezPHj88ZMtc3bw==
X-Received: by 2002:a05:6102:2921:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5feb2eeabbbmr6024557137.11.1771914883670; Mon, 23 Feb 2026
 22:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
 <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
In-Reply-To: <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Feb 2026 14:34:28 +0800
X-Gm-Features: AaiRm51R8L3iou4npU1vpdD5DZL9EpRpSawFc34RE0Bv8lB-h8L2KEIydo9ihY0
Message-ID: <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2E01D182773
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:35=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> > Recently, the hdisplay calculation is working for 3:1 compressed ratio
> > only. If we have a video panel with DSC BPP =3D 8, and BPC =3D 10, we s=
till
> > use the default bits_per_pclk =3D 24, then we get the wrong hdisplay. W=
e
> > can draw the conclusion by cross-comparing the calculation with the
> > calculation in dsi_adjust_pclk_for_compression().
> >
> > Since CMD mode does not use this, we can remove
> > !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> >
> > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> Could you please point out, which platform / device are you using to
> test this code?
>
Hi, Dmitry.

I was using Lenovo Yoga Tab Plus(sm8650), it is equipped with a
native 10-bit panel, the resolution is 2944 x 1840.

I am using Lenovo Legion Y700 Gen4(sm8750), it is equipped with a
native 10-bit panel too, the resolution is 1904 x 3040.

I witnessed that the DSI_ACTIVE_H_END bits in REG_DSI_ACTIVE_H are wrong.
For Y700 (panel in 8 dsc bpp and 10 bpc mode)
Upstream: 0x015e0020
0x015e - 0x0020 =3D 318 =3D DIV_ROUND_UP(1904 / 2 * 8,  24)
Downstream: 0x011e0020
0x011e - 0x0020 =3D 254 =3D DIV_ROUND_UP(1904 / 2 * 8,  30)

dsi_adjust_pclk_for_compression() did:
new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
                            dsc->bits_per_component * 3);
new_hdisplay will be halved later for bonded dsi.

Original calculation must be wrong, though it is unused. We can refer
to the downstream too.

Addition: To support 10-bit for dsi, more fixes are required. e.g.
programming VID_DST_FORMAT_RGB101010 into REG_DSI_VID_CFG0
adding MIPI_DSI_FMT_RGB101010 and bpp conversion into drm mipi dsi
fixing DSC RC parameters? Recently DRM_DSC_1_1_PRE_SCR is hardcoded
etc.

I just brought up the panel in 8 dsc bpp and 8 bpc mode. I will try
8 dsc bpp and 10 bpc mode after a while.

Best wishes,
Pengyu
