Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d3PMN9PSdGnk+AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:27 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155C7DC3A
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEBA10E112;
	Sat, 24 Jan 2026 14:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SvidBkv9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7710EB94
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 18:21:54 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3530715386cso2350819a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 10:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769192514; cv=none;
 d=google.com; s=arc-20240605;
 b=eaxagT3Mp6n/0haFI1VhwsJfLTyqfAf9O+HxWtfcAfZHCB4D4YHySPNeGwBjsuJCOy
 ofe1G5ecfgv7aIQVY1JZRbcLg2r/csFKzBGJB0XMg2MQtTbvaC1ySCdgSUKkKkrKhK+U
 3ZLBwQ0z1h3i+FMcdfdu2gtvuV7r+2uym3ZAYoxFg76blciF+zkCTznZq2JWa1kNCknq
 MFD3q5kgMN2tRBQd6k+pxws8WadA+W91DL2tKHAg3iMSkpo4ASY2888bkiQAHVlJ5iad
 WlcX7fKa3LGdY9E/KwmGECRwLg6xdChSitXHnFVlN6YTB2L1ShYdFfGMSxTc4fYmjPy8
 CExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 fh=ATohSD7IR/UhF6ATHlnUCf0SrE42A4bH3PcYOHkrUDI=;
 b=bFVsiGLXwOl+iPNK8zEHuKRQ9y7J/ea8Z6YpxwK6IS23sttJtmSMAcTwbtrbOgxF0t
 IGr9ev4QJo5d8vBNW7b0UzEM/+n6pCjS1Pk9OtRsaEG7lp2ir52WxirhjRHjvFnOWgOd
 doVwSOWTDz0wxP/U3QQZ4oJRs3EMz9RogRRd73yQKXTBfZWCU2IhORGSaNS/NVstlMLj
 u1CZc41CytbYi3iW3z+AB2vHodD1ck7kSVENrRmBOcks6vErWVhdEbd3xv1Uk9APPPFT
 2pHrYVwyDe/b/Xms96lahVThuBwxvT2mATB9yuhlLALPCQJgEdu2gDPrxN3yHJE3LDOo
 498A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769192514; x=1769797314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 b=SvidBkv9R0NvniV0IeaXTXxeWINDtlLvxLQ59whYHbCBU6ZNKrCe0YqW9qT3auMk4m
 wMpjUWahpkM++RpnkiDt8tRyzj81FjBzB48QWgunDs8aTd5AR8bS7dWoDMIQXcMLw1Sp
 F/xpUy09p67f5X59BsqaSi6r0FfHUvjvLB7MMY5DlTPShPpkZ6XDqtXrQtzCDQuIrA3w
 UZSEy+CQJIydfjjEd7UIK6Ynasn8ovjeWXoxxd2vYkMogGtWCW1fbcFr3k6ax5basqHU
 odxMF5GsGN7bs/TjOseLPcKhiTqEAdCWzNtzepSlYRjk6v98GLFC5zqtYDJXKUbKUH4/
 0wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769192514; x=1769797314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 b=LUszhYpIBN+GWfZkJidOUIOUjyEEFcYKoiYRYwIN5YvjGu5CqMD3MAPCn3mdcWpCSc
 WxtN84AkVnqgvjc/OmB5m2XiJs/ayywjv0tZyL95CZG6itQpsJCsuPoiKy3W7gmuSMmY
 9+DW+p7rIScEdmaD/Tqnb8wcfD825DejSTHPzPacA2bLYFzoAW8BlIFlAfVRRRRTMSTN
 nUil9as5svWKcFrlCfNjaB6/10UAedEKGKGVSpValBKiQSeOYq7zaDqiYZQUMxsYrIDr
 ZPL5KQvBo2ptigpsHs4mYF5gAB43mfdsx/um51i24aofMXmtARtxwjyhF7KGxCIXfpeV
 BEfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxHa2pm54+pztHLhBGsZgTy4HyvG5/khX3JJATjFjPP4fEt0DPd9z/reEMmM4cmM4ypkSdMS3/lec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAaJ+Fmzb4bMCkEAdylYs16jKRiM4oiU/qA7aw+MLpnuQo1lOf
 7kx6bx0DcBOhzh/b5YW2fopN0LbglU9w0piYeQuuZey9Ortw8joexB3bX5KREJ0Xo8o/XIyOVP0
 1fxpc3rIOPa6KTaPW6xaVCg4cXu/XOFo=
X-Gm-Gg: AZuq6aLf9yfNNP6f4wQODRaDcOLXWgjkSM7xjFaUuggA56BflmGpNvUX21YJaKc3jD+
 F/TuS7Fzf1xWfGOb2Xx81DlL8hlyM1xrNO15RjRsCE7b0EETbVdq2gWGBgAER9F2rHtlywOM2i+
 vvkBpH4F0lte3smS2dWpVMOJCYkYfOoyKCT+KJ0HJrjsUdJDakLlooqy38eZb4/syq0w1xB3YR/
 jWiapIrWJSuQHQNWvKe30rFfnEYmoumxa6+e8jUS3x2jAa3kvxNlQ9D1TXOkEXT031StKRL+F4/
 OsZtDAc7/LzA0TSKSgkfPVp8RAVohQ==
X-Received: by 2002:a17:90b:5190:b0:34c:2db6:578f with SMTP id
 98e67ed59e1d1-3536885694cmr3448666a91.19.1769192514010; Fri, 23 Jan 2026
 10:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
In-Reply-To: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 02:21:42 +0800
X-Gm-Features: AZwV_QiUVgt6zT7LCvtUzjgnH_aqDOORlzA2yXQGNZS9mCONN_by2qCehnk_F_w
Message-ID: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 24 Jan 2026 14:10:24 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2155C7DC3A
X-Rspamd-Action: no action

Hi Dmitry,
Thanks for your review.
linux/cleanup.h is included in linux/of.h.
So it should be included already.

Best regards,
Feix Gu

On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> > In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> > While there was a manual of_node_put() at the end of the
> > common path, several early error returns would bypass this call,
> > resulting in a reference leak.
> > Fix this by using the __free(device_node) cleanup handler to
> > release the reference when the variable goes out of scope.
> >
> > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 2129d230a92b..0bc518d9fd65 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >       struct platform_device *pdev =3D priv->gpu_pdev;
> >       struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> > -     struct device_node *node;
> >       struct a6xx_gpu *a6xx_gpu;
> >       struct adreno_gpu *adreno_gpu;
> >       struct msm_gpu *gpu;
> > @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       adreno_gpu->registers =3D NULL;
> >
> >       /* Check if there is a GMU phandle and set it up */
> > -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> > +     struct device_node *node __free(device_node) =3D
> > +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>
> Missing include for cleanup.h.
>
> >       /* FIXME: How do we gracefully handle this? */
> >       BUG_ON(!node);
> >
> > @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >               ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >       else
> >               ret =3D a6xx_gmu_init(a6xx_gpu, node);
> > -     of_node_put(node);
> >       if (ret) {
> >               a6xx_destroy(&(a6xx_gpu->base.base));
> >               return ERR_PTR(ret);
> >
> > ---
> > base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > change-id: 20260123-a6xx_gpu-cbc095dbe423
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >
>
> --
> With best wishes
> Dmitry
