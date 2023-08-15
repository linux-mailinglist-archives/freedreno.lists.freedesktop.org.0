Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1877CC3A
	for <lists+freedreno@lfdr.de>; Tue, 15 Aug 2023 13:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD54110E0F7;
	Tue, 15 Aug 2023 11:59:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Tue, 15 Aug 2023 11:59:54 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA81A10E0F7
 for <freedreno@lists.freedesktop.org>; Tue, 15 Aug 2023 11:59:54 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 85DFA3F20F
 for <freedreno@lists.freedesktop.org>; Tue, 15 Aug 2023 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692100336;
 bh=C7DwVUcSx3lMMADwShmbJqderoSd3gR00V23Q/iPW+s=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=ErF0+kwnXOf+IQIc0dWTI0wMNUOP69PdVRzVE0exWfqF+2v3c+8y0GjzHnD2xsBY8
 DbSCPLIny11p+YdWuECvLfNE8AOELdk5HIeAXbdjkRldDJ/DgAcCq96G9KjP8TnH4m
 IO8rEejrrHtnhpeIrL/oK9GxDdalJ+RNvY8F2BQrsJhY8XxskSej+3O8GiJCM7xTXh
 APfeKYpucPAZdWd+FxaGkHvQEKdu98BDWvyXQisFauQfJh6LoVUjqViP0L/Vsw19Nw
 I6HOCTerCH0gojSCCmEOGFcSWp7P9wrX2dX0opwZL/8+P4079YOGVPsLi8hYr2a7Zh
 aWM8xXQHLRl9A==
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so33434555e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Aug 2023 04:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692100336; x=1692705136;
 h=mime-version:organization:references:in-reply-to:message-id:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7DwVUcSx3lMMADwShmbJqderoSd3gR00V23Q/iPW+s=;
 b=HzNxqFeI3LVkDJLszYVsfZsWDZfMeagHS1f+rWA+SL1pS+CeNF+t7x70UPW4tEgk87
 H90i7lz82tPtLjLypwelDJ6JEQ64YTjevEaHJFXaQfNTpHlcljxFHxWS59t8DvPgh6sr
 KzeECHAB7E0U7qmUueGgcDOJMqSOZC2cO64oJDsUxPz2wnbnuI118oxaLOOTtbj8QkNZ
 fURE9ZLHmZAWtI61xoNei8HBU0SPHOypfNeOha36mcpTB74rPMzb/fUt/wKHnOGrFZg4
 I6aT4QKT7eGGywu49jNt60D2aEFiAN/YzCFt+n0WwBTFbvR3LUyY/ygJ+kGf/IHR+0wM
 auIg==
X-Gm-Message-State: AOJu0Yxe14kJDuZNIrWO1GNMHRjYEWp/96a621AUQQ4hAvyIRSuPKKTM
 /gr9PeUEeYn7W0+FUjUFOSyMc2cTR7oei3aLZt1mQnIFBRiUtFmQHCurPmZfz+79H25cjKvgrY5
 Z1YK9//nLtgIpINdoCZwYwcIYvmknoaCUkSQnUoJ8Q2ihTA==
X-Received: by 2002:adf:e9c9:0:b0:319:8b21:b050 with SMTP id
 l9-20020adfe9c9000000b003198b21b050mr388512wrn.61.1692100336175; 
 Tue, 15 Aug 2023 04:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbVNNrLF0rpeAxAN4xCQRWR3gy4KLXXalr3mFCIQPw+9VnlGKRxgZ6SkAXXFQkvb6dfVbzHA==
X-Received: by 2002:adf:e9c9:0:b0:319:8b21:b050 with SMTP id
 l9-20020adfe9c9000000b003198b21b050mr388493wrn.61.1692100335875; 
 Tue, 15 Aug 2023 04:52:15 -0700 (PDT)
Received: from gollum ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm17709446wrm.37.2023.08.15.04.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 04:52:15 -0700 (PDT)
Date: Tue, 15 Aug 2023 13:52:14 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20230815135214.15aeff63@gollum>
In-Reply-To: <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <20230620054031.1203960-1-juerg.haefliger@canonical.com>
 <b0460532-b5f1-7efc-49af-8d4feecc1085@linaro.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vv7PBfafaUhFIXtl8vRRuy7";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Add missing
 MODULE_FIRMWARE macros
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
Cc: sean@poorly.run, quic_akhilpo@quicinc.com, airlied@gmail.com,
 ribalda@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 konrad.dybcio@linaro.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, joel@joelfernandes.org,
 freedreno@lists.freedesktop.org, johan+linaro@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jun 2023 21:44:25 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On 20/06/2023 08:40, Juerg Haefliger wrote:
> > The driver references some firmware files that don't have corresponding
> > MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> >=20
> > ---
> > v2:
> >    - Drop addition and removal of zap files (needs more discussion)
> >    - Add new a690_gmu.bin
> >    - Update commit subject and message accordingly
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+) =20
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20

It looks like this didn't go anywhere. Is there something missing?

...Juerg

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmTbZu4ACgkQD9OLCQum
QrcZ2xAAg4LyZtCle1bB0fPoNTnHgzF+qA1aRvXE7v67vPpOMn3Q2uY4LpSs3YKJ
Fumq39oRZ0KkNtNuKaUxF9xIkbZOXIYfERvok7LMSp2SQJfa+mEI4j0kT1Lc8ER7
kKeRLZV2ASC+KA1EcxBINfyNi6wm/MxWWwQj98IzLHJxMu6+lTFoXsko4A7+TWOl
7Y0lqb/keVeYYHzMcTehoC9pF1HrIXdAMhP2OrczTkynWHU5eolQHWncCix83d1V
vz1ovozrGRCsvi6XHc8WSdWhhmp4JfbZXwTCEvG3riyAnUu5IbgQa5FGkiYXLrq8
QUgOXLsMsa7rA0WW5RoUp+wLhOIrwXZFZp7+1IbNAA4U53GMzpTSMTvnA6TBDrPC
VgC0KAqxoC3HzYL/1k1kaYybAw3HXBjaE0K2IiGHyY8YM4MDZoWBUxRiR0lAcKlB
XCpt6KbiFMvz4NYtw2EVeSeOUFPld3g+aIqHk578fnEse+gCegxyCc9X4auIGPND
lVNvPGZcIRcJypw9kkWZOJ1Uhhpm2y8/xUkhVMECQV3uyzLr02dFnA6Cuw/0+KOZ
Yrr7F37Lk8RkKqqQbBSWOYh49Y63ZDLOa+gts3+TzpiJS8YuXyXCSRQwJDN1r1fu
oAqaxGqhfpYZp4xZ/SMN70VepPX7rZCbc5f7BOFSxaXleJNcmGY=
=A5x/
-----END PGP SIGNATURE-----

--Sig_/Vv7PBfafaUhFIXtl8vRRuy7--
