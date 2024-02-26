Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEEC867276
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 12:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098D10F067;
	Mon, 26 Feb 2024 11:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vfbipqrO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0962610F067
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 11:01:24 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcc6fc978ddso2342521276.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 03:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708945284; x=1709550084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9vvbj4M1K552Kyc5nJnZJSPi9kSGaKnUsSXP9LMZNY=;
 b=vfbipqrO4kmBASaaq6swW+1Vb2QZnpMRmixEchEhH6LrGlvyb8XkxdkKJMX6M1G+gD
 fXnXeTEVKCDsagWv+hkTiE8qcAS4r5mwJuLm1X1l9w+p5bI9CwBOL5cTtWGTcOLz9Pc5
 4vEoBfm94otS92grCqTFdlpjnruSQo71FKaIcctuw3Ai4gBHEmDxKbnsnQMoMxpXkRiF
 lybv2qanciRBSrlNKU2tZ3wFzY+DfV/qpTDN/0BlPZ7Gke+xvdiU3wio3hNmz6M9lQX9
 SEfAkNrIsgxJsZ6wktyCAo1NMXZOExNYbDFvby1OmsPLhClCbycB4W6X1nnQreJytqX/
 kCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708945284; x=1709550084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9vvbj4M1K552Kyc5nJnZJSPi9kSGaKnUsSXP9LMZNY=;
 b=dTpGUk5DtMN73VQaEiy1ybXE6z2mNDtWmqIZLg2C/FEZCnIUVBAOGzw0yjBGKdrlaH
 J2wSK9X9nvDjW1B+K/HESyYx4WwzDQUdn+5obf6rG1lZ7cqTTQgVCipdkxWSV122BlKL
 7pRhYN8jILrvDw0yGOTpQpVVih9VsSZ6suf2X/onSZuA2jlWPiR2ANW60KkjYFWJpdNk
 PyarG6n4NMc3741V7HpxhrJZn6hSEZWgtqs2vAzPJuiqilGiQZwLWyUAHTcCZY3FEvMA
 sQ/YgACf488SwwVHqADlwS1hPANmoT/jm7so0DYva9gvyxCqyRQLynk9p0FBVcX/VQZe
 D1aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMuSaCE7iQgaU4ajTPU7StCVn5VvTUhRTYPnmqDu00pvSwM3TsgPGPpWhSONJc49fH9B4NKxtcM6GiUoSJkRkKRHIbYqf9Pm2wZ3l55e6d
X-Gm-Message-State: AOJu0YzeKnp+Uime4Q+8bzFPL9dnxvnfGcHpxD5onG/9VaZccTl8eQll
 KQwd6O1xRGwjvHfWHwUzWjj1jbVRPA7qMW2lIMTAbrX30xal1ih5KxoKCSSdcE1GPpAra2msJZJ
 6iMJ+gCYm2Ku/kor2CLI1fI/uTEU5x6PPCCi2wA==
X-Google-Smtp-Source: AGHT+IGWyU4Q4HdX9n7xc4slBFaFWHwTYHJMp+KzDqdE1Y6SP2yHpPH7gTP9J4zbLMGsJgEkmHbIOprjDy6blCt21uI=
X-Received: by 2002:a25:b184:0:b0:dcb:df38:1c20 with SMTP id
 h4-20020a25b184000000b00dcbdf381c20mr4047405ybj.24.1708945283859; Mon, 26 Feb
 2024 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
 <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
In-Reply-To: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 13:01:12 +0200
Message-ID: <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, 26 Feb 2024 at 08:33, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The driver might decide to put the _shipped files to the subdir.
>
>
>
> Please stop this sentence.
>
> This sounds like we are not learning.
>
> https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8ok=
+7-CQUN=3DfQ@mail.gmail.com/
>
>
>
>
> > In such
> > case the cmd_copy might fail because the destination directory is not
> > present. Call mkdir -p to make sure that the destination directory is
> > present.
>
>
> There is no justification for this.
>
> If you need a single generated directory
> (drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whateve=
r)
> that should be super simple.
>
> Why does scripts/Makefile.lib need the modification?

Could you please tell me how I should handle this?
I was looking for a way to generate
drivers/gpu/drm/msm/registers/foo.xml.h and then use it during
compilation.
In drivers/gpu/drm/msm/Makefile I added $(obj)/registers/foo.xml.h as
a dependency to the corresponding object files and then added
drivers/gpu/drm/msm/registers/foo.xml.h_shipped file.
This way Kbuild/make will attempt to call cmd_copy to generate target
file, which thanks to VPATH expansion boils down to `cat
$(srctree)/$(src)/registers/foo.xml.h_shopped >
$(obj)/registers/foo.xml.h`. However this breaks as there is no
$(obj)/registers.


> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  scripts/Makefile.lib | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index cd5b181060f1..94373eeac420 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -297,7 +297,7 @@ endef
> >  # the copy would be read-only as well, leading to an error when execut=
ing the
> >  # rule next time. Use 'cat' instead in order to generate a writable fi=
le.
> >  quiet_cmd_copy =3D COPY    $@
> > -      cmd_copy =3D cat $< > $@
> > +      cmd_copy =3D mkdir -p $(shell dirname $@) && cat $< > $@
> >
> >  $(obj)/%: $(src)/%_shipped
> >         $(call cmd,copy)


--=20
With best wishes
Dmitry
